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


## 操控移动机器人进行建图与导航
### 建图
- roslaunch turtlebot_bringup minimal.launch 启动移动机器人底盘
- roslaunch turtlebot_navigation gmapping_demo.launch 启动gmapping建图
- roslaunch turtlebot_rviz_launchers view_navigation.launch 启动rviz可视化工具
- rosrun teleop_twist_keyboard teleop_twist_keyboard.py 控制移动机器人运动
### 导航
- echo "export TURTLEBOT_GAZEBO_WORLD_FILE=xxx" >> ~/.bashrc 设置地图路径
- source ~/.bashrc
- roslaunch turtlebot_bringup minimal.launch use_sim_time:=False 启动移动机器人底盘
- roslaunch turtlebot_navigation amcl_demo.launch 启动amcl定位
- roslaunch turtlebot_rviz_launchers view_navigation.launch --screen 启动rviz可视化工具