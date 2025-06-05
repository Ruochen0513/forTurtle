#!/usr/bin/env python3

import rospy
from std_msgs.msg import Float64
from dynamixel_msgs.msg import JointState
import threading

class ArmController:
    def __init__(self, error_threshold=0.01, settle_time=1.0, short_wait=0.3):
        rospy.on_shutdown(self.cleanup)

        # 发布器
        self.joint_tilt_pub = rospy.Publisher('tilt_controller/command', Float64, queue_size=10)
        self.joint_shoulder_pub = rospy.Publisher('shoulder_controller/command', Float64, queue_size=10)
        self.joint_elbow_pub = rospy.Publisher('elbow_controller/command', Float64, queue_size=10)
        self.joint_wrist_pub = rospy.Publisher('wrist_controller/command', Float64, queue_size=10)
        self.joint_hand_pub = rospy.Publisher('hand_controller/command', Float64, queue_size=10)

        # 关节误差
        self.joint_errors = {
            'tilt': float('inf'),
            'shoulder': float('inf'),
            'elbow': float('inf'),
            'wrist': float('inf'),
            'hand': float('inf')
        }
        self.error_threshold = error_threshold
        self.settle_time = settle_time
        self.short_wait = short_wait
        self.lock = threading.Lock()

        # 订阅关节状态
        rospy.Subscriber('tilt_controller/state', JointState, self._make_state_cb('tilt'))
        rospy.Subscriber('shoulder_controller/state', JointState, self._make_state_cb('shoulder'))
        rospy.Subscriber('elbow_controller/state', JointState, self._make_state_cb('elbow'))
        rospy.Subscriber('wrist_controller/state', JointState, self._make_state_cb('wrist'))
        rospy.Subscriber('hand_controller/state', JointState, self._make_state_cb('hand'))

        # 目标位置
        self.target_positions_A = {
            'tilt': 4.1264,
            'shoulder': 2.5003,
            'elbow': 2.6947,
            'wrist': 2.5464,
            'hand': 3.2980
        }
        self.target_positions_B = {
            'tilt': 4.1519,
            'shoulder': 2.3367,
            'elbow': 0.8692,
            'wrist': 2.6793,
            'hand': 2.3981
        }
        rospy.loginfo("Arm controller initialized. Will start reciprocating motion based on joint error.")

    def _make_state_cb(self, joint_name):
        def cb(msg):
            with self.lock:
                self.joint_errors[joint_name] = abs(msg.error)
        return cb

    def send_joint_positions(self, positions):
        self.joint_tilt_pub.publish(Float64(positions['tilt']))
        self.joint_shoulder_pub.publish(Float64(positions['shoulder']))
        self.joint_elbow_pub.publish(Float64(positions['elbow']))
        self.joint_wrist_pub.publish(Float64(positions['wrist']))
        self.joint_hand_pub.publish(Float64(positions['hand']))

    def joints_are_settled(self):
        with self.lock:
            return all(e < self.error_threshold for e in self.joint_errors.values())

    def run_reciprocating_motion(self):
        positions_list = [self.target_positions_A, self.target_positions_B]
        idx = 0
        rate = rospy.Rate(10)  # 10Hz 检查
        while not rospy.is_shutdown():
            target = positions_list[idx]
            rospy.loginfo(f"Moving to Target: {target}")
            self.send_joint_positions(target)
            # 等待所有关节到位
            while not rospy.is_shutdown():
                if self.joints_are_settled():
                    rospy.loginfo("所有关节已到位，等待 %.2f 秒后切换目标" % self.short_wait)
                    break
                rate.sleep()
            if rospy.is_shutdown():
                break
            try:
                rospy.sleep(self.short_wait)
            except rospy.ROSInterruptException:
                break
            idx = 1 - idx  # 切换目标

    def cleanup(self):
        rospy.loginfo('Shutting down arm controller demo...')
        rospy.loginfo('Arm controller shutdown complete.')

if __name__== '__main__':
    rospy.init_node('arm_reciprocating_demo', anonymous=True)
    try:
        controller = ArmController(error_threshold=0.00001, settle_time=1.0, short_wait=0.3)  # 阈值和等待时间可调
        controller.run_reciprocating_motion()
    except rospy.ROSInterruptException:
        rospy.loginfo("ROS Interrupt Exception caught in main. Node shutting down.")
    except Exception as e:
        rospy.logerr(f"An unexpected error occurred: {e}")
    finally:
        rospy.loginfo("Exiting arm_reciprocating_demo node.")