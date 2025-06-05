#!/usr/bin/env python3
import rospy
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from std_msgs.msg import String
import actionlib

class NavController:
    def __init__(self):
        rospy.init_node('nav_controller')
        
        # 房间位置预设
        self.room_locations = {
            "301": [-6.6188, 0.77232, 0],
            "302": [3.2, 0.8, 0.0]
        }
        
        # 动作客户端
        self.move_base = actionlib.SimpleActionClient('move_base', MoveBaseAction)
        self.move_base.wait_for_server()

        # 订阅语音和视觉
        rospy.Subscriber('/voice_cmd', String, self.voice_callback)
        # rospy.Subscriber('/current_room', String, self.room_callback)

    def voice_callback(self, msg):
        if msg.data in self.room_locations:
            self.navigate_to_room(msg.data)

    def navigate_to_room(self, room):
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.pose.position.x = self.room_locations[room][0]
        goal.target_pose.pose.position.y = self.room_locations[room][1]
        goal.target_pose.pose.orientation.w = self.room_locations[room][2]
        
        self.move_base.send_goal(goal)
        rospy.loginfo(f"正在导航到 {room} 房间")

if __name__ == '__main__':
    nc = NavController()
    rospy.spin()
