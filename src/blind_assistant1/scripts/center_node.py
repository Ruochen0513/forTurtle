#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
import json
import re
from std_msgs.msg import String
from zhipuai import ZhipuAI

class CenterNode:
    def __init__(self):
        rospy.init_node('center_node', anonymous=True)
        
        # 智谱AI客户端初始化（建议将API_KEY移到环境变量）
        self.client = ZhipuAI(api_key="ca93604709044884b178da7f8604b070.83NBe82V7DRdsKBF")  
        self.model = "glm-4-flash"
        
        # 严格定义的JSON格式提示词
        self.system_prompt = """你现在是一个盲人引导机器人，具有运动控制/导航/机械臂夹取/场景识别的功能，请分析用户的要求，如果你认为用户的要求属于运动控制/导航/机械臂夹取/场景识别中的一类，请按照下属json格式响应，请严格按以下JSON格式响应：
{
  "content": "回复内容",
  "request": "运动控制/导航/机械臂夹取/场景识别",        # 仅“request”为“运动控制“或者“导航“或者“机械臂夹取“或者“场景识别”时需要，选择“运动控制”或者“导航”或者“机械臂夹取”二者之一输出，其他情况设为“NONE”
  "text": "前进/后退/左转/右转/停止",  # 仅“request”为运动控制时需要，选择“前进”或者“后退”或者“左转”或者“右转”或者“停止”五者之一输出，其他情况设为“NONE”
  "place": "116"  # 仅导航时需要        # 仅“request”为导航时需要，且只有两个选项：301，302，且只响应数字即可，其他情况设为“NONE”  
  "arm": "true"   # 仅机械臂夹取时需要，且只要"request"为机械臂夹取，"arm"即为true， 其他情况设为“NONE”    
  "visual": "true"  # 仅场景识别时需要，且只要"request"为场景识别，"visual"即为true，其他情况设为“NONE”       
}
例如：
如果用户说“请你前进”，你的响应应该是：
{
  "content": "好的，我将前进",
  "request": "运动控制",
  "text": "前进",
  "place": "NONE",
  "arm": "NONE",
  "visual": "NONE"
}
如果用户说“请你去301”，你的响应应该是：
{
  "content": "好的，我将去301教室",
  "request": "导航",
  "text": "NONE",
  "place": "301",
  "arm": "NONE",
  "visual": "NONE" 
}
如果用户说“请你带我去115”，你的响应应该是：
{
  "content": "好的，我将带你去115教室",
  "request": "导航",
  "text": "NONE",
  "place": "NONE",
  "arm": "NONE",
  "visual": "NONE" 
}
如果用户说“请帮我夹一瓶水”，你的响应应该是：
{
  "content": "好的，我将帮你夹一瓶水",
  "request": "机械臂夹取",
  "text": "NONE",
  "place": "NONE",
  "arm": "true",
  "visual": "NONE" 
}
如果用户说“请帮我描述一下眼前的景象”，你的响应应该是：
{
  "content": "",   # 不用回答，保持空字符串即可
  "request": "场景识别",
  "text": "NONE",
  "place": "NONE",
  "arm": "NONE",
  "visual": "true" 
}
"""
        
        # 话题设置
        rospy.Subscriber('raw_text', String, self.voice_command_callback)
        self.command_pub = rospy.Publisher('robot_command', String, queue_size=10, latch=True)
        self.speech_pub = rospy.Publisher('tts_text', String, queue_size=10)
        self.nav_pub = rospy.Publisher('voice_cmd', String, queue_size=10, latch=True)
        self.arm_pub = rospy.Publisher('arm_cmd', String, queue_size=10, latch=True)
        self.visual_pub = rospy.Publisher('visual_cmd', String, queue_size=10, latch=True)
        rospy.loginfo("中心节点已启动，等待语音命令...")

    def voice_command_callback(self, msg):
        """处理语音指令"""
        try:
            voice_text = msg.data.strip()
            if not voice_text:
                return
                
            rospy.loginfo(f"收到语音指令: {voice_text}")
            response = self.process_with_llm(voice_text)
            self.handle_llm_response(response)
            
        except Exception as e:
            rospy.logerr(f"处理指令出错: {e}")
            self.speech_pub.publish("处理指令时发生错误")

    def process_with_llm(self, user_input):
        """调用大语言模型"""
        try:
            response = self.client.chat.completions.create(
                model=self.model,
                messages=[
                    {"role": "system", "content": self.system_prompt},
                    {"role": "user", "content": user_input},
                ],
            )
            return response.choices[0].message.content if response.choices else None
        except Exception as e:
            rospy.logerr(f"调用大模型失败: {e}")
            return None

    def handle_llm_response(self, response):
        """处理大模型响应"""
        if not response:
            rospy.logwarn("收到空响应")
            return
            
        rospy.loginfo(f"原始响应: {response}")
        
        try:
            # 提取标准JSON部分（兼容可能存在的额外说明文字）
            json_match = re.search(r'\{[\s\S]*\}', response)
            if not json_match:
                raise ValueError("未找到JSON格式响应")
                
            data = json.loads(json_match.group())
            rospy.loginfo(f"解析结果: {data}")
            
            # 语音反馈
            if "content" in data:
                self.speech_pub.publish(data["content"])
            
            # 运动控制指令
            if data.get("request") == "运动控制":
                if "text" in data and data["text"] in ["前进", "后退", "左转", "右转", "停止"]:
                    self.command_pub.publish(data["text"])
                else:
                    rospy.logwarn(f"非法运动指令: {data.get('text')}")
            
            # 其他指令类型
            elif data.get("request") in ["导航"]:
                if "place" in data and data["place"] in ["301", "302"]:
                    self.nav_pub.publish(data["place"])
                else:
                    rospy.logwarn(f"非法运动指令: {data.get('place')}")
            # 其他指令类型
            elif data.get("request") in ["机械臂夹取"]:
                self.arm_pub.publish(data["arm"])
            # 其他指令类型
            elif data.get("request") in ["场景识别"]:
                self.visual_pub.publish(data["visual"])
                
        except json.JSONDecodeError:
            rospy.logerr(f"JSON解析失败: {response}")

        except Exception as e:
            rospy.logerr(f"处理响应出错: {e}")


if __name__ == '__main__':
    try:
        CenterNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass