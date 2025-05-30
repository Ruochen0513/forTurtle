# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "turtlebot_actions: 14 messages, 0 services")

set(MSG_I_FLAGS "-Iturtlebot_actions:/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(turtlebot_actions_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg" "turtlebot_actions/FindFiducialActionFeedback:geometry_msgs/Pose:actionlib_msgs/GoalID:geometry_msgs/PoseStamped:std_msgs/Header:turtlebot_actions/FindFiducialActionResult:geometry_msgs/Point:turtlebot_actions/FindFiducialResult:turtlebot_actions/FindFiducialActionGoal:geometry_msgs/Quaternion:turtlebot_actions/FindFiducialFeedback:turtlebot_actions/FindFiducialGoal:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg" "turtlebot_actions/FindFiducialGoal:std_msgs/Header:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg" "geometry_msgs/Pose:actionlib_msgs/GoalID:geometry_msgs/PoseStamped:std_msgs/Header:geometry_msgs/Point:turtlebot_actions/FindFiducialResult:geometry_msgs/Quaternion:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg" "turtlebot_actions/FindFiducialFeedback:std_msgs/Header:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg" ""
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg" "geometry_msgs/Pose:geometry_msgs/PoseStamped:std_msgs/Header:geometry_msgs/Point:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg" ""
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg" "turtlebot_actions/TurtlebotMoveGoal:actionlib_msgs/GoalID:turtlebot_actions/TurtlebotMoveActionFeedback:std_msgs/Header:turtlebot_actions/TurtlebotMoveResult:turtlebot_actions/TurtlebotMoveActionResult:turtlebot_actions/TurtlebotMoveFeedback:actionlib_msgs/GoalStatus:turtlebot_actions/TurtlebotMoveActionGoal"
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg" "turtlebot_actions/TurtlebotMoveGoal:std_msgs/Header:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg" "turtlebot_actions/TurtlebotMoveResult:std_msgs/Header:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg" "std_msgs/Header:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:turtlebot_actions/TurtlebotMoveFeedback"
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg" ""
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg" ""
)

get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg" NAME_WE)
add_custom_target(_turtlebot_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot_actions" "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_cpp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
)

### Generating Services

### Generating Module File
_generate_module_cpp(turtlebot_actions
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(turtlebot_actions_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(turtlebot_actions_generate_messages turtlebot_actions_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_cpp _turtlebot_actions_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot_actions_gencpp)
add_dependencies(turtlebot_actions_gencpp turtlebot_actions_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot_actions_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_eus(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
)

### Generating Services

### Generating Module File
_generate_module_eus(turtlebot_actions
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(turtlebot_actions_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(turtlebot_actions_generate_messages turtlebot_actions_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_eus _turtlebot_actions_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot_actions_geneus)
add_dependencies(turtlebot_actions_geneus turtlebot_actions_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot_actions_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_lisp(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
)

### Generating Services

### Generating Module File
_generate_module_lisp(turtlebot_actions
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(turtlebot_actions_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(turtlebot_actions_generate_messages turtlebot_actions_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_lisp _turtlebot_actions_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot_actions_genlisp)
add_dependencies(turtlebot_actions_genlisp turtlebot_actions_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot_actions_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_nodejs(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
)

### Generating Services

### Generating Module File
_generate_module_nodejs(turtlebot_actions
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(turtlebot_actions_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(turtlebot_actions_generate_messages turtlebot_actions_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_nodejs _turtlebot_actions_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot_actions_gennodejs)
add_dependencies(turtlebot_actions_gennodejs turtlebot_actions_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot_actions_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)
_generate_msg_py(turtlebot_actions
  "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
)

### Generating Services

### Generating Module File
_generate_module_py(turtlebot_actions
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(turtlebot_actions_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(turtlebot_actions_generate_messages turtlebot_actions_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg" NAME_WE)
add_dependencies(turtlebot_actions_generate_messages_py _turtlebot_actions_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot_actions_genpy)
add_dependencies(turtlebot_actions_genpy turtlebot_actions_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot_actions_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot_actions
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(turtlebot_actions_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(turtlebot_actions_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(turtlebot_actions_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot_actions
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(turtlebot_actions_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(turtlebot_actions_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(turtlebot_actions_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot_actions
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(turtlebot_actions_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(turtlebot_actions_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(turtlebot_actions_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot_actions
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(turtlebot_actions_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(turtlebot_actions_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(turtlebot_actions_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot_actions
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(turtlebot_actions_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(turtlebot_actions_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(turtlebot_actions_generate_messages_py geometry_msgs_generate_messages_py)
endif()
