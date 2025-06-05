#!/usr/bin/env python
import rospy
import cv2
from sensor_msgs.msg import Image
from std_msgs.msg import String
from cv_bridge import CvBridge

class IPCameraNode:
    def __init__(self):
        self.bridge = CvBridge()
        self.current_frame = None
        
        # 初始化发布者
        self.image_pub = rospy.Publisher("/ip_camera/image_raw", Image, queue_size=10)
        self.visual_info_pub = rospy.Publisher("visual_info", Image, queue_size=10)
        
        # 初始化订阅者
        rospy.Subscriber("visual_cmd", String, self.cmd_callback)
        
        # 替换为你的IP摄像头URL
        self.cap = cv2.VideoCapture("http://192.168.189.69:11311/videofeed?mjpeg=1")
    
    def cmd_callback(self, msg):
        if msg.data.lower() == "true" and self.current_frame is not None:
            # 当接收到"true"时，发布当前帧到visual_info话题
            visual_image = self.bridge.cv2_to_imgmsg(self.current_frame, "bgr8")
            self.visual_info_pub.publish(visual_image)
            rospy.loginfo("Image captured and published to visual_info topic")
    
    def run(self):
        rate = rospy.Rate(30)  # 30Hz
        
        while not rospy.is_shutdown():
            ret, frame = self.cap.read()
            if ret:
                self.current_frame = frame  # 保存当前帧
                ros_image = self.bridge.cv2_to_imgmsg(frame, "bgr8")
                self.image_pub.publish(ros_image)
            rate.sleep()
        
        self.cap.release()

def main():
    rospy.init_node('ip_camera_publisher', anonymous=True)
    node = IPCameraNode()
    try:
        node.run()
    except rospy.ROSInterruptException:
        pass

if __name__ == '__main__':
    main()