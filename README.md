## 语音控制移动机器人运动流程
- roscore
- roslaunch turtlebot_gazebo turtlebot_world.launch 启动移动机器人仿真
- rosrun my_pkg voice_control.py 启动语音控制节点
- roslaunch robot_voice iat_publish.launch 启动语音识别节点

## 模版匹配
- roslaunch usb_cam usb_cam-test.launch 启动电脑摄像头
- rosrun my_pkg template.py 进行模版匹配


## 打开仿真机器人摄像头
- roslaunch turtlebot_gazebo turtlebot_world.launch 启动移动机器人仿真
- rosrun image_view image_view image:=/camera/rgb/image_raw 打开仿真机器人摄像头