# Install script for directory: /home/amadeus/forTurtle/src/turtlebot_apps/turtlebot_actions

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/amadeus/forTurtle/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_actions/action" TYPE FILE FILES
    "/home/amadeus/forTurtle/src/turtlebot_apps/turtlebot_actions/action/FindFiducial.action"
    "/home/amadeus/forTurtle/src/turtlebot_apps/turtlebot_actions/action/TurtlebotMove.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_actions/msg" TYPE FILE FILES
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialAction.msg"
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionGoal.msg"
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionResult.msg"
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialActionFeedback.msg"
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialGoal.msg"
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialResult.msg"
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/FindFiducialFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_actions/msg" TYPE FILE FILES
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveAction.msg"
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionGoal.msg"
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionResult.msg"
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveActionFeedback.msg"
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveGoal.msg"
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveResult.msg"
    "/home/amadeus/forTurtle/devel/share/turtlebot_actions/msg/TurtlebotMoveFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_actions/cmake" TYPE FILE FILES "/home/amadeus/forTurtle/build/turtlebot_apps/turtlebot_actions/catkin_generated/installspace/turtlebot_actions-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/amadeus/forTurtle/devel/include/turtlebot_actions")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/amadeus/forTurtle/devel/share/roseus/ros/turtlebot_actions")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/amadeus/forTurtle/devel/share/common-lisp/ros/turtlebot_actions")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/amadeus/forTurtle/devel/share/gennodejs/ros/turtlebot_actions")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/amadeus/forTurtle/devel/lib/python3.8/site-packages/turtlebot_actions")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages" TYPE DIRECTORY FILES "/home/amadeus/forTurtle/devel/lib/python3.8/site-packages/turtlebot_actions")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/amadeus/forTurtle/build/turtlebot_apps/turtlebot_actions/catkin_generated/installspace/turtlebot_actions.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_actions/cmake" TYPE FILE FILES "/home/amadeus/forTurtle/build/turtlebot_apps/turtlebot_actions/catkin_generated/installspace/turtlebot_actions-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_actions/cmake" TYPE FILE FILES
    "/home/amadeus/forTurtle/build/turtlebot_apps/turtlebot_actions/catkin_generated/installspace/turtlebot_actionsConfig.cmake"
    "/home/amadeus/forTurtle/build/turtlebot_apps/turtlebot_actions/catkin_generated/installspace/turtlebot_actionsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_actions" TYPE FILE FILES "/home/amadeus/forTurtle/src/turtlebot_apps/turtlebot_actions/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/turtlebot_move_action_server" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/turtlebot_move_action_server")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/turtlebot_move_action_server"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions" TYPE EXECUTABLE FILES "/home/amadeus/forTurtle/devel/lib/turtlebot_actions/turtlebot_move_action_server")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/turtlebot_move_action_server" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/turtlebot_move_action_server")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/turtlebot_move_action_server"
         OLD_RPATH "/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/turtlebot_move_action_server")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/find_fiducial_pose" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/find_fiducial_pose")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/find_fiducial_pose"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions" TYPE EXECUTABLE FILES "/home/amadeus/forTurtle/devel/lib/turtlebot_actions/find_fiducial_pose")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/find_fiducial_pose" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/find_fiducial_pose")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/find_fiducial_pose"
         OLD_RPATH "/opt/ros/noetic/lib:/usr/local/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions/find_fiducial_pose")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/turtlebot_actions" TYPE DIRECTORY FILES "/home/amadeus/forTurtle/src/turtlebot_apps/turtlebot_actions/include")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/turtlebot_actions" TYPE PROGRAM FILES
    "/home/amadeus/forTurtle/src/turtlebot_apps/turtlebot_actions/scripts/test_fiducial.py"
    "/home/amadeus/forTurtle/src/turtlebot_apps/turtlebot_actions/scripts/test_move.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_actions" TYPE DIRECTORY FILES "/home/amadeus/forTurtle/src/turtlebot_apps/turtlebot_actions/launch")
endif()

