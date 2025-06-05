#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
import asyncio
import websockets
import uuid
import json
import gzip
# import copy # copy 未使用，可以移除
# import os # os 如果只用于路径处理，可以按需保留或移除
import threading
from std_msgs.msg import String

import pyaudio # 添加 pyaudio
import queue     # 添加 queue
import time      # 添加 time
from pydub import AudioSegment # 添加 pydub
from io import BytesIO         # 添加 BytesIO


# 消息类型定义
MESSAGE_TYPES = {11: "audio-only server response", 12: "frontend server response", 15: "error message from server"}
MESSAGE_TYPE_SPECIFIC_FLAGS = {0: "no sequence number", 1: "sequence number > 0",
                             2: "last message from server (seq < 0)", 3: "sequence number < 0"}
MESSAGE_SERIALIZATION_METHODS = {0: "no serialization", 1: "JSON", 15: "custom type"}
MESSAGE_COMPRESSIONS = {0: "no compression", 1: "gzip", 15: "custom compression method"}

class TTSNode:
    def __init__(self):
        rospy.init_node('tts_node', anonymous=True)
        
        # 订阅语音合成话题
        rospy.Subscriber('tts_text', String, self.tts_callback)
        
        # 添加TTS状态发布者
        self.tts_status_pub = rospy.Publisher('tts_status', String, queue_size=10)
        
        # 从环境变量读取鉴权信息
        self.app_id = rospy.get_param('~app_id', '7709498845')
        self.access_key = rospy.get_param('~access_key', 'tiKoWmAWbbi-tIkY81klLAk-evHvOxlL')
        self.voice_type = rospy.get_param('~voice_type', 'zh_male_shaonianzixin_moon_bigtts')
        
        # WebSocket URL
        self.api_url = 'wss://openspeech.bytedance.com/api/v1/tts/ws_binary'
        
        # 默认请求头
        self.default_header = bytearray(b'\x11\x10\x11\x00')
        
        # 音频播放参数 (与火山引擎TTS默认输出匹配)
        self.format = pyaudio.paInt16  # 16-bit PCM
        self.channels = 1              # 单声道
        self.rate = 24000              # 采样率，火山引擎MP3通常是24kHz
        self.chunk = 1024              # 每次写入流的数据块大小
        
        # 初始化音频播放器
        self.audio = pyaudio.PyAudio()
        self.stream = None
        self.audio_lock = threading.Lock() # 锁，用于保护stream对象的访问
        
        # 音频数据队列 (存放解码后的PCM数据)
        self.audio_queue = queue.Queue()
        
        # 创建事件循环
        self.loop = asyncio.new_event_loop()
        # asyncio.set_event_loop(self.loop) # 不应在主线程设置，应在需要运行loop的线程中设置

        # 启动音频播放线程
        self.play_thread = threading.Thread(target=self.audio_playback_thread)
        self.play_thread.daemon = True # 设置为守护线程，主程序退出时该线程也退出
        self.play_thread.start()
        
        rospy.loginfo("语音合成节点已启动 (带音频播放功能)")
        rospy.loginfo(f"当前使用的音色: {self.voice_type}")

    def init_audio_stream(self):
        """初始化或重新初始化音频流"""
        with self.audio_lock:
            try:
                if self.stream:
                    self.stream.stop_stream()
                    self.stream.close()
                
                self.stream = self.audio.open(
                    format=self.format,
                    channels=self.channels,
                    rate=self.rate,
                    output=True,
                    frames_per_buffer=self.chunk
                )
                rospy.loginfo("音频流已成功初始化/重新初始化")
            except Exception as e:
                rospy.logerr(f"音频流初始化失败: {e}")
                self.stream = None # 确保出错时stream为None

    def audio_playback_thread(self):
        """音频播放线程，从队列中获取PCM数据并播放"""
        self.init_audio_stream() # 初始化一次音频流
        while not rospy.is_shutdown():
            try:
                pcm_data = self.audio_queue.get(timeout=0.1) # 等待0.1秒获取数据
                with self.audio_lock:
                    if not self.stream or not self.stream.is_active():
                        rospy.logwarn("音频流无效或未激活，尝试重新初始化...")
                        self.init_audio_stream() # 尝试重新初始化
                    
                    if self.stream: # 确保流有效
                        try:
                            # 发布TTS开始播放状态
                            self.tts_status_pub.publish("playing")
                            self.stream.write(pcm_data)
                            # 发布TTS播放结束状态
                            self.tts_status_pub.publish("stopped")
                        except IOError as e:
                            rospy.logerr(f"音频播放IOError: {e}. 尝试重新初始化音频流。")
                            self.init_audio_stream() # IO错误通常意味着流出问题了
                        except Exception as e:
                            rospy.logerr(f"音频播放时发生未知错误: {e}")
                self.audio_queue.task_done() # 告知队列任务完成
            except queue.Empty:
                # 队列为空是正常情况，继续等待
                time.sleep(0.01) # 短暂休眠避免CPU空转
            except Exception as e:
                rospy.logerr(f"音频播放线程发生错误: {e}")
                time.sleep(0.1) # 发生错误，稍作等待

    def create_request(self, text):
        """创建请求JSON"""
        request = {
            "app": {
                "appid": self.app_id,
                "token": self.access_key,
                "cluster": "volcano_tts"
            },
            "user": {
                "uid": str(uuid.uuid4())
            },
            "audio": {
                "voice_type": self.voice_type,
                "encoding": "mp3", # 我们请求MP3
                "speed_ratio": 1.0,
                "volume_ratio": 1.0,
                "pitch_ratio": 1.0,
                "sample_rate": self.rate # 与播放器采样率一致
            },
            "request": {
                "reqid": str(uuid.uuid4()),
                "text": text,
                "text_type": "plain",
                "operation": "submit",
                "use_cache": True
            }
        }
        # rospy.loginfo(f"创建请求: {json.dumps(request, ensure_ascii=False)}") # 请求内容较多，可以按需取消注释
        return request

    async def tts_request(self, text):
        """发送语音合成请求，接收并处理音频数据进行播放"""
        try:
            request_json = self.create_request(text)
            payload_bytes = json.dumps(request_json).encode('utf-8')
            payload_bytes = gzip.compress(payload_bytes) # 压缩请求体
            
            full_request = bytearray(self.default_header)
            full_request.extend(len(payload_bytes).to_bytes(4, 'big'))
            full_request.extend(payload_bytes)
            
            rospy.loginfo("正在连接WebSocket服务器...")
            headers = {"Authorization": f"Bearer; {self.access_key}"}
            async with websockets.connect(self.api_url, extra_headers=headers, ping_interval=None) as ws:
                rospy.loginfo("WebSocket连接已建立")
                await ws.send(full_request)
                rospy.loginfo("请求已发送")
                
                accumulated_mp3_data = BytesIO() # 用于累积MP3数据块

                while True:
                    response = await ws.recv()
                    if not response:
                        rospy.loginfo("收到空响应，结束接收")
                        break
                    
                    # 解析通用响应头
                    # byte 0: protocol_version (4 bits), header_size (4 bits, N*4 bytes)
                    # byte 1: message_type (4 bits), message_type_specific_flags (4 bits)
                    # byte 2: message_serialization_method (4 bits), message_compression (4 bits)
                    # byte 3: reserved
                    header_size_words = response[0] & 0x0f
                    payload_offset = header_size_words * 4 # 实际头部字节数
                    
                    message_type = response[1] >> 4
                    message_type_specific_flags = response[1] & 0x0f
                    message_compression_type = response[2] & 0x0f # 获取压缩类型

                    payload = response[payload_offset:] # 实际负载

                    rospy.loginfo(f"收到响应: 类型={MESSAGE_TYPES.get(message_type, 'unknown')}, 标志={MESSAGE_TYPE_SPECIFIC_FLAGS.get(message_type_specific_flags, 'unknown')}, 压缩={MESSAGE_COMPRESSIONS.get(message_compression_type, 'unknown')}")
                    
                    if message_type == 0xb:  # audio-only server response (11)
                        if message_type_specific_flags == 0:  # ACK
                            rospy.loginfo("收到ACK响应")
                            continue
                        
                        # 解析音频负载头
                        sequence_number = int.from_bytes(payload[:4], "big", signed=True)
                        audio_payload_size = int.from_bytes(payload[4:8], "big", signed=False)
                        
                        # 提取实际的音频数据块，确保使用 audio_payload_size
                        mp3_chunk = payload[8 : 8 + audio_payload_size]
                        
                        rospy.loginfo(f"收到音频数据块: 序号={sequence_number}, 声明大小={audio_payload_size}字节, 实际接收大小={len(mp3_chunk)}字节")

                        # 1. 处理压缩 (如果服务器发送了压缩的MP3)
                        if message_compression_type == 1: # gzip
                            rospy.loginfo("音频数据块是gzipped，正在解压...")
                            try:
                                mp3_chunk = gzip.decompress(mp3_chunk)
                                rospy.loginfo(f"解压后大小: {len(mp3_chunk)}字节")
                            except Exception as e:
                                rospy.logerr(f"音频数据块Gzip解压失败: {e}")
                                continue # 跳过这个损坏的数据块
                        
                        # 2. 将MP3数据块解码为PCM并放入队列
                        # Pydub 对于流式MP3，最好是累积一定数据再解码，或者确保每个chunk是可独立解码的。
                        # 对于TTS，通常每个块可以独立解码或拼接后解码。
                        # 这里我们简单地逐块解码，如果遇到问题，可以考虑累积所有块再一次性解码。
                        try:
                            segment = AudioSegment.from_mp3(BytesIO(mp3_chunk))
                            # 确保音频参数与播放器设置一致
                            segment = segment.set_channels(self.channels)
                            segment = segment.set_frame_rate(self.rate)
                            segment = segment.set_sample_width(self.audio.get_sample_size(self.format)) # e.g., 2 for paInt16

                            self.audio_queue.put(segment.raw_data)
                            # rospy.loginfo(f"解码PCM数据并放入队列，大小: {len(segment.raw_data)}")

                        except Exception as e:
                            rospy.logerr(f"MP3块解码失败: {e}")
                            # 可以选择将原始MP3块写入 accumulated_mp3_data 供后续调试或尝试整体解码
                            # accumulated_mp3_data.write(mp3_chunk) 

                        if sequence_number < 0: # sequence_number < 0 表示是最后一块
                            rospy.loginfo("收到最后一段音频数据")
                            # 如果之前是累积MP3数据，可以在这里进行整体解码
                            # if accumulated_mp3_data.tell() > 0:
                            #     rospy.loginfo("尝试解码累积的MP3数据...")
                            #     accumulated_mp3_data.seek(0)
                            #     try:
                            #         segment = AudioSegment.from_mp3(accumulated_mp3_data)
                            #         segment = segment.set_channels(self.channels).set_frame_rate(self.rate)
                            #         segment = segment.set_sample_width(self.audio.get_sample_size(self.format))
                            #         self.audio_queue.put(segment.raw_data)
                            #         rospy.loginfo("累积MP3数据解码完成并放入队列.")
                            #     except Exception as e_acc:
                            #         rospy.logerr(f"累积MP3数据解码失败: {e_acc}")
                            break # 结束接收循环
                            
                    elif message_type == 0xf:  # error message from server (15)
                        code = int.from_bytes(payload[:4], "big", signed=False)
                        msg_size = int.from_bytes(payload[4:8], "big", signed=False)
                        error_msg_content = payload[8 : 8 + msg_size]

                        if message_compression_type == 1: # gzip for error message
                            try:
                                error_msg_content = gzip.decompress(error_msg_content)
                            except Exception as e:
                                rospy.logerr(f"错误消息Gzip解压失败: {e}")
                        
                        try:
                            error_msg_str = error_msg_content.decode('utf-8')
                            rospy.logerr(f"语音合成错误: 代码={code}, 消息={error_msg_str}")
                        except Exception as e:
                            rospy.logerr(f"解码错误消息失败: {e}, 内容 (bytes): {error_msg_content[:100]}") # Log raw bytes for debugging
                        break # 出错则终止
            
            # 等待音频队列播放完毕
            self.audio_queue.join() # 等待所有放入队列的item都被task_done()
            rospy.loginfo("所有音频已播放完毕。")

        except websockets.exceptions.ConnectionClosed as e:
            rospy.logerr(f"WebSocket连接意外关闭: {e}")
        except Exception as e:
            rospy.logerr(f"语音合成请求或处理过程中发生错误: {e}")
            import traceback
            rospy.logerr(traceback.format_exc()) # 打印详细的堆栈信息

    def tts_callback(self, msg):
        """处理接收到的文本转语音请求"""
        text = msg.data
        rospy.loginfo(f"收到语音合成请求: {text}")
        
        # 如果不想同时处理多个请求，可以在这里加入锁或请求状态管理
        # 清空音频队列中可能残留的旧数据 (如果适用，但通常播放线程会处理)
        while not self.audio_queue.empty():
            try:
                self.audio_queue.get_nowait()
                self.audio_queue.task_done()
            except queue.Empty:
                break
        rospy.loginfo("旧音频队列已清空。")

        # 在新线程中运行异步任务
        def run_async_tts():
            # 每个新线程都需要有自己的事件循环或正确设置当前线程的事件循环
            asyncio.set_event_loop(self.loop) # 或者 asyncio.new_event_loop() 并设为当前
            try:
                self.loop.run_until_complete(self.tts_request(text))
            except Exception as e:
                rospy.logerr(f"run_async_tts 发生错误: {e}")
            finally:
                rospy.loginfo(f"语音合成任务完成: {text}")
        
        # 为每个TTS请求创建一个新线程来运行异步websocket代码
        tts_processing_thread = threading.Thread(target=run_async_tts)
        tts_processing_thread.start()

    def shutdown(self):
        """关闭节点时的清理工作"""
        rospy.loginfo("TTS节点正在关闭...")
        with self.audio_lock:
            if self.stream:
                try:
                    self.stream.stop_stream()
                    self.stream.close()
                    rospy.loginfo("音频流已关闭。")
                except Exception as e:
                    rospy.logerr(f"关闭音频流时出错: {e}")
        if self.audio:
            try:
                self.audio.terminate()
                rospy.loginfo("PyAudio已终止。")
            except Exception as e:
                rospy.logerr(f"终止PyAudio时出错: {e}")
        
        # 尝试优雅地停止事件循环 (如果它仍在运行)
        if self.loop.is_running():
            self.loop.call_soon_threadsafe(self.loop.stop)
        
        rospy.loginfo("TTS节点关闭完成。")


if __name__ == '__main__':
    try:
        tts_node = TTSNode()
        rospy.on_shutdown(tts_node.shutdown) # 注册关闭时的清理函数
        rospy.spin()
    except rospy.ROSInterruptException:
        rospy.loginfo("ROS中断，节点关闭。")
    except Exception as e:
        rospy.logerr(f"TTS节点启动时发生未捕获的异常: {e}")
        import traceback
        rospy.logerr(traceback.format_exc())