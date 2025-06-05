#!/usr/bin/env python3
import rospy
import cv2
import pytesseract
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

class RoomDetector:
    def __init__(self):
        rospy.init_node('room_detector')
        self.bridge = CvBridge()
        self.pub = rospy.Publisher('/current_room', String, queue_size=10)
        
        pytesseract.pytesseract.tesseract_cmd = '/usr/bin/tesseract'
        
        rospy.Subscriber('/usb_cam/image_raw', Image, self.image_callback)

    def image_callback(self, msg):
        try:
            cv_img = self.bridge.imgmsg_to_cv2(msg, 'bgr8')
            gray = cv2.cvtColor(cv_img, cv2.COLOR_BGR2GRAY)
            
            # 数字识别增强
            custom_config = r'--oem 3 --psm 6 outputbase digits'
            text = pytesseract.image_to_string(gray, config=custom_config)
            
            if text.strip():
                self.pub.publish(text.strip())
        except Exception as e:
            rospy.logerr(f"识别错误: {str(e)}")

if __name__ == '__main__':
    rd = RoomDetector()
    rospy.spin()
