#!/usr/bin/env python3
import os
from typing import Any, List, cast
import rospy
from sensor_msgs.msg import Image
from std_msgs.msg import String
from cv_bridge import CvBridge
import cv2
import base64
from volcenginesdkarkruntime import Ark

class VisualRecognitionNode:
    def __init__(self):
        rospy.init_node('visual_recognition', anonymous=True)
        # 获取图像话题和模型ID
        raw_topics = rospy.get_param('~image_topics', ['visual_info'])
        self.topics: List[str]
        if isinstance(raw_topics, list):
            self.topics = raw_topics  # type: ignore
        else:
            self.topics = [raw_topics]  # type: ignore
        # 获取模型ID并确保为字符串
        raw_model = rospy.get_param('~model', 'doubao-1.5-vision-pro-250328')
        self.model: str = str(raw_model)
        self.bridge = CvBridge()
        # 缓存按时间戳分组的Base64图像列表123
        self.buffers = {}
        self.expected_count = len(self.topics)
        # 发布文字描述
        self.pub = rospy.Publisher('tts_text', String, queue_size=10)
        # 初始化Ark客户端
        self.client = Ark(api_key='21f84842-2bb0-4a2e-97b4-512aa307703d')
        # 订阅所有图像话题
        for topic in self.topics:
            rospy.Subscriber(topic, Image, self.image_callback)
        rospy.loginfo(f"Subscribed to topics {self.topics}, using model {self.model}")

    def image_callback(self, msg):
        ts = msg.header.stamp.to_nsec()
        try:
            # 转CV图像并JPEG编码
            cv_img = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
            ret, buf = cv2.imencode('.jpg', cv_img)
            if not ret:
                raise ValueError('JPEG encoding failed')
            raw_b64 = base64.b64encode(buf.tobytes()).decode('utf-8')
            # 构造符合 data URI 规范的 Base64 字符串
            data_uri = f"data:image/jpeg;base64,{raw_b64}"
        except Exception as e:
            rospy.logerr(f"Image conversion error: {e}")
            return
        # 缓存图像
        lst = self.buffers.setdefault(ts, [])
        lst.append(data_uri)
        # 如果已收齐同一时间戳的所有图像，则处理
        if len(lst) >= self.expected_count:
            images = self.buffers.pop(ts)
            self.process_images(images)

    def process_images(self, images):
        # 构造多图像请求内容
        content = []
        for img_b64 in images:
            content.append({'type':'image_url','image_url':{'url':img_b64}})
        content.append({'type':'text','text':'请描述上述图片内容。要求尽量简短，缩减到在20字以内。'})
        try:
            # 调用Ark视觉理解模型，多图像输入
            resp = cast(Any, self.client.chat.completions.create(
                model=self.model,
                messages=[{'role': 'user', 'content': content}]
            ))
            # 从响应中提取文本描述
            desc = resp.choices[0].message.content  # type: ignore
            rospy.loginfo(f"Visual description: {desc}")
            self.pub.publish(desc)
        except Exception as e:
            rospy.logerr(f"Ark API error: {e}")

if __name__ == '__main__':
    node = VisualRecognitionNode()
    rospy.spin()