#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
import os
import sys
import time
import uuid
import json
import pyaudio
import wave
import threading
import gzip
import websocket
import struct
import queue
from std_msgs.msg import String

# 录音参数
FORMAT = pyaudio.paInt16
CHANNELS = 1
RATE = 16000
CHUNK = 3200  # 0.2秒一包，即5帧每秒

class VolcEngineASR:
    def __init__(self):
        rospy.init_node('speech_recognition', anonymous=True)
        self.voice_pub = rospy.Publisher('raw_text', String, queue_size=10)

        # 订阅TTS状态
        rospy.Subscriber('tts_status', String, self.tts_status_callback)
        
        # 从环境变量读取鉴权信息
        self.app_id = os.environ.get('VOLC_APP_ID', '4286471456')
        self.access_key = os.environ.get('VOLC_ACCESS_KEY', 'zYtpjB6nqyTk6LDWk_Do3z402Wghcg63')
        self.resource_id = os.environ.get('VOLC_RESOURCE_ID', 'volc.bigasr.sauc.duration')
        if not self.app_id or not self.access_key:
            rospy.logerr('请设置VOLC_APP_ID和VOLC_ACCESS_KEY环境变量！')
            sys.exit(1)

        self.ws_url = 'wss://openspeech.bytedance.com/api/v3/sauc/bigmodel'
        self.connect_id = str(uuid.uuid4())
        
        # 通信状态和控制
        self.is_active = True
        self.is_connected = False
        self.audio_queue = queue.Queue()
        self.ws = None

        # 无声检测参数
        self.silence_threshold = 50
        self.max_silence_frames = 25 # 对应5秒静音 (25 * 0.2s/frame)
        self.silence_frames = 0 # 当前连续静音帧计数
        
        # 识别状态控制
        self.last_published_text = None
        self.current_recognition = "" # 当前ASR返回的完整文本
        self.is_processing = False # 是否正在处理一个语音片段（由ASR回调计时器管理）
        self.last_audio_time = 0
        
        # 新增：语音活动检测计时器和相关参数
        self.text_lock = threading.Lock() # 用于同步访问共享文本状态
        self.speech_activity_timer = None
        self.speech_timeout_duration = 1.5  # 秒，用户停止说话后等待的时间
        self.pending_text_to_publish = "" # 存储当前积累的、等待发布的句子
        
        # 新增：TTS状态控制
        self.tts_is_playing = False
        self.tts_lock = threading.Lock()
        
        # 启动线程
        self.ws_thread = threading.Thread(target=self.websocket_thread)
        self.ws_thread.daemon = True
        self.ws_thread.start()
        
        self.record_thread = threading.Thread(target=self.recording_thread)
        self.record_thread.daemon = True
        self.record_thread.start()
        
        rospy.loginfo('语音识别节点已启动 - 自然语句识别模式')

    def tts_status_callback(self, msg):
        """处理TTS状态更新"""
        with self.tts_lock:
            self.tts_is_playing = (msg.data == "playing")
            rospy.loginfo(f"TTS状态更新: {'播放中' if self.tts_is_playing else '已停止'}")

    def create_header(self, msg_type, msg_flags, serialization, compression):
        """创建二进制消息头"""
        byte1 = (1 << 4) | 1
        byte2 = (msg_type << 4) | msg_flags
        byte3 = (serialization << 4) | compression
        byte4 = 0
        return bytes([byte1, byte2, byte3, byte4])

    def create_full_request(self):
        """创建初始请求"""
        req = {
            "app": {
                "service_type": "asr",
                "version": "v1"
            },
            "audio": {
                "format": "pcm",
                "sample_rate": 16000,
                "channel": 1,
                "encoding": ""
            }
        }
        json_data = json.dumps(req).encode('utf-8')
        compressed_data = gzip.compress(json_data)
        
        header = self.create_header(1, 0, 1, 1)
        size_bytes = struct.pack('>I', len(compressed_data))
        
        return header + size_bytes + compressed_data

    def create_audio_request(self, audio_data, is_last=False):
        """创建音频数据请求"""
        if not audio_data:
            compressed_data = gzip.compress(b'')
        else:
            compressed_data = gzip.compress(audio_data)
        
        flags = 2 if is_last else 0
        header = self.create_header(2, flags, 0, 1)
        size_bytes = struct.pack('>I', len(compressed_data))
        
        return header + size_bytes + compressed_data

    def extract_latest_text(self, full_text):
        """从完整识别文本中提取最新部分"""
        # 如果文本为空，直接返回
        if not full_text:
            return ""
            
        # 按句号分割文本
        sentences = full_text.split('。')
        # 过滤掉空字符串
        sentences = [s.strip() for s in sentences if s.strip()]
        
        # 如果分割后没有句子，返回原文本
        if not sentences:
            return full_text
            
        # 返回最后一个句子
        return sentences[-1] + '。'

    def parse_response(self, response):
        """解析服务器响应"""
        if not response or len(response) < 12:
            return None
        
        b1, b2, b3, b4 = response[0:4]
        msg_type = (b2 >> 4) & 0xF
        msg_flags = b2 & 0xF
        serialization = (b3 >> 4) & 0xF
        compression = b3 & 0xF
        
        sequence = int.from_bytes(response[4:8], byteorder='big')
        payload_size = int.from_bytes(response[8:12], byteorder='big')
        
        if len(response) < 12 + payload_size:
            rospy.logwarn(f"响应数据不完整: 需要{12 + payload_size}字节，实际{len(response)}字节")
            return None
            
        payload = response[12:12+payload_size]
        
        if compression == 1:
            try:
                payload = gzip.decompress(payload)
            except Exception as e:
                rospy.logerr(f"解压响应失败: {e}")
                return None
        
        if serialization == 1:
            try:
                result = json.loads(payload.decode('utf-8'))
                
                with self.text_lock:
                    if result and 'result' in result and 'text' in result['result']:
                        text = result['result']['text'].strip()
                        if text:  # 只要有文本就处理
                            # 提取最新的识别文本
                            latest_text = self.extract_latest_text(text)
                            if latest_text and latest_text != self.current_recognition:
                                self.current_recognition = latest_text
                                self.pending_text_to_publish = latest_text
                                
                                rospy.loginfo(f"实时识别更新: {latest_text}")
                                
                                self.is_processing = True
                                
                                # 取消旧的计时器并启动新的
                                if self.speech_activity_timer:
                                    self.speech_activity_timer.cancel()
                                
                                self.speech_activity_timer = threading.Timer(self.speech_timeout_duration, self.publish_final_sentence)
                                self.speech_activity_timer.start()
                
                return result
            except Exception as e:
                rospy.logerr(f"解析JSON响应失败: {e}")
                return None
        
        return None

    def publish_final_sentence(self):
        """在用户停止说话一段时间后发布最终识别的句子"""
        with self.text_lock:
            final_text = self.pending_text_to_publish # 先读取
            if final_text and final_text != self.last_published_text:
                rospy.loginfo(f"最终识别结果: {final_text}")
                self.filter_and_publish(final_text)
                self.last_published_text = final_text # 更新已发布的文本
            
            self.pending_text_to_publish = "" # 为下一句做准备
            # self.current_recognition = "" # 等待ASR在有新语音时更新，这里不清空，以防万一有后续极短修正
            self.is_processing = False # 标记语音片段处理结束

    def is_silence(self, audio_data):
        """检测音频是否为静音"""
        if not audio_data:
            return True
            
        try:
            values = []
            for i in range(0, len(audio_data), 2):
                if i+1 < len(audio_data):
                    value = int.from_bytes(audio_data[i:i+2], byteorder='little', signed=True)
                    values.append(abs(value))
            
            if values:
                avg_amplitude = sum(values) / len(values)
                return avg_amplitude < self.silence_threshold
            return True
        except Exception as e:
            rospy.logwarn(f"检测静音时出错: {e}")
            return False

    def recording_thread(self):
        """持续录音线程"""
        audio = pyaudio.PyAudio()
        stream = None
        
        try:
            stream = audio.open(format=FORMAT, channels=CHANNELS, rate=RATE, 
                             input=True, frames_per_buffer=CHUNK)
            rospy.loginfo("开始录音...")
            
            while self.is_active and not rospy.is_shutdown():
                try:
                    # 检查TTS是否正在播放
                    with self.tts_lock:
                        if self.tts_is_playing:
                            time.sleep(0.1)  # 如果TTS正在播放，暂停录音
                            continue
                    
                    audio_data = stream.read(CHUNK, exception_on_overflow=False)
                    self.last_audio_time = time.time()
                    
                    is_silent_chunk = self.is_silence(audio_data)

                    with self.text_lock:
                        if is_silent_chunk:
                            self.silence_frames += 1
                            if self.silence_frames >= self.max_silence_frames:
                                # 仅当ASR回调当前未处理语音片段时，此处的静音才发送结束帧
                                if not self.is_processing and self.is_connected:
                                    self.audio_queue.put((b'', True))
                                    rospy.loginfo("检测到长时间静音（且无活跃ASR计时），发送结束帧并重置。")
                                    self.current_recognition = ""
                                    self.last_published_text = None 
                                    self.pending_text_to_publish = "" # 确保清空
                                # 不论是否发送结束帧，都重置silence_frames计数，避免在is_processing为true时累积过多而反复判断
                                self.silence_frames = 0
                        else: # 非静音帧
                            self.silence_frames = 0
                            # 如果检测到声音，并且之前没有正在处理的语音片段 (is_processing is False)，
                            # 重置last_published_text，确保用户重复上一句话也能发布。
                            if not self.is_processing:
                                self.last_published_text = None
                        
                        # 将非静音的音频数据放入队列
                        if self.is_connected and not is_silent_chunk:
                            self.audio_queue.put((audio_data, False))
                    
                except Exception as e:
                    rospy.logerr(f"录音过程出错: {e}")
                    time.sleep(0.1)
        
        except Exception as e:
            rospy.logerr(f"初始化录音设备时出错: {e}")
        
        finally:
            if stream:
                stream.stop_stream()
                stream.close()
            audio.terminate()
            rospy.loginfo("录音线程已停止")

    def websocket_thread(self):
        """WebSocket通信线程"""
        while self.is_active and not rospy.is_shutdown():
            try:
                headers = {
                    'X-Api-App-Key': self.app_id,
                    'X-Api-Access-Key': self.access_key,
                    'X-Api-Resource-Id': self.resource_id,
                    'X-Api-Connect-Id': self.connect_id
                }
                
                self.ws = websocket.create_connection(
                    self.ws_url, 
                    header=[f'{k}: {v}' for k, v in headers.items()]
                )
                self.is_connected = True
                rospy.loginfo("WebSocket连接已建立")
                
                initial_request = self.create_full_request()
                self.ws.send_binary(initial_request)
                
                response = self.ws.recv()
                result = self.parse_response(response)
                if result:
                    rospy.loginfo(f"初始响应: {result}")
                
                while not self.audio_queue.empty():
                    try:
                        self.audio_queue.get_nowait()
                    except queue.Empty:
                        break
                
                while self.is_active and not rospy.is_shutdown():
                    try:
                        audio_data, is_last = self.audio_queue.get(timeout=0.5)
                    except queue.Empty:
                        continue
                    
                    audio_request = self.create_audio_request(audio_data, is_last)
                    self.ws.send_binary(audio_request)
                    
                    self.ws.settimeout(0.2)
                    try:
                        response = self.ws.recv()
                        self.parse_response(response)
                        
                        if is_last:
                            initial_request = self.create_full_request()
                            self.ws.send_binary(initial_request)
                            response = self.ws.recv()
                            result = self.parse_response(response)
                            if result:
                                rospy.loginfo(f"新会话初始响应: {result}")
                            continue
                        
                    except websocket.WebSocketTimeoutException:
                        pass
                    except Exception as e:
                        rospy.logerr(f"接收响应出错: {e}")
                        break
            
            except Exception as e:
                rospy.logerr(f"WebSocket连接出错: {e}")
            
            finally:
                if self.ws:
                    try:
                        self.ws.close()
                    except:
                        pass
                self.is_connected = False
                self.ws = None
                rospy.loginfo("WebSocket连接已关闭，将在2秒后重新连接...")
                time.sleep(2)

    def filter_and_publish(self, text):
        """发布识别到的文本"""
        msg = String()
        msg.data = text
        self.voice_pub.publish(msg)
        rospy.loginfo(f"发布语音指令: {text}")
    
    def shutdown(self):
        """关闭节点时的清理工作"""
        self.is_active = False
        if hasattr(self, 'text_lock'): # 确保对象已完全初始化
            with self.text_lock:
                if self.speech_activity_timer:
                    self.speech_activity_timer.cancel()
                    self.speech_activity_timer = None

            # 尝试发布任何在关闭前未发布的文本
            if hasattr(self, 'publish_final_sentence'):
                 # 调用前最好也获取锁，或确保 publish_final_sentence 内部能安全处理
                 self.publish_final_sentence()

        if self.ws:
            try:
                self.ws.close()
            except:
                pass
        rospy.loginfo("语音识别节点已关闭")

if __name__ == '__main__':
    try:
        asr = VolcEngineASR()
        rospy.on_shutdown(asr.shutdown)
        rospy.spin()
    except rospy.ROSInterruptException:
        pass