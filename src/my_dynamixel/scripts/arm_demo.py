#!/usr/bin/env python3

import rospyfrom std_msgs.msg import Float64

class loop:
    def __init__(self):
        rospy.on_shutdown(self.cleanup)

        self.joint = rospy.Publisher('tilt_controller/command', Float64, queue_size=10)
        self.pos = Float64()
        self.pos = 1.5

        self.joint.publish(self.pos)

        while not rospy.is_shutdown():
            self.pos = 0.5
            self.joint.publish(self.pos)
            rospy.sleep(3)

            self.pos = 1.5
            self.joint.publish(self.pos)
            rospy.sleep(3)
    
    def cleanup(self):
        rospy.loginfo('Shutting down robot arm ...')

if __name__=='__main__':
    rospy.init_node('arm')
    try:
        loop()
        rospy.spin()
    except rospy.ROSInterruptException
        pass