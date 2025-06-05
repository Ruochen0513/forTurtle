#!/usr/bin/env python
import rospy
import subprocess
import time
from std_msgs.msg import Bool, Int32

class ArmController:
    def __init__(self):
        # 初始化节点
        rospy.init_node('arm_controller', anonymous=True)
        
        # 创建发布者，发布到已存在的voice_cmd话题
        self.voice_cmd_pub = rospy.Publisher('voice_cmd', Int32, queue_size=10)
        
        # 订阅arm_cmd话题
        rospy.Subscriber('arm_cmd', Bool, self.arm_cmd_callback)
        
        rospy.loginfo("Arm controller initialized. Listening to arm_cmd topic...")
    
    def arm_cmd_callback(self, msg):
        # 当接收到arm_cmd为true时，发布302到voice_cmd话题
        if msg.data:
            cmd = Int32()
            cmd.data = 302
            self.voice_cmd_pub.publish(cmd)
            rospy.loginfo("Received True on arm_cmd, published 302 to voice_cmd")
            
            # 等待3秒
            rospy.loginfo("Waiting 3 seconds before starting arm_demo.py...")
            time.sleep(3)
            
            # 启动arm_demo.py脚本
            try:
                subprocess.Popen(["rosrun", "my_dynamixel", "arm_demo.py"])
                rospy.loginfo("Started arm_demo.py")
            except Exception as e:
                rospy.logerr("Failed to start arm_demo.py: %s", str(e))

def main():
    controller = ArmController()
    # 保持节点运行直到被关闭
    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass