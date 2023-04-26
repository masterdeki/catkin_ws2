cmake_minimum_required(VERSION 3.0.2)
project(agar_motor_controller)

find_package(catkin REQUIRED COMPONENTS
  dynamic_reconfigure
  geometry_msgs
  message_generation
  rospy
  sensor_msgs
  std_msgs
  tf2_msgs
)

catkin_python_setup()

generate_dynamic_reconfigure_options(
  cfg/motor_params.cfg
)

catkin_package(
  LIBRARIES robot_control
  CATKIN_DEPENDS rospy std_msgs geometry_msgs tf2_msgs sensor_msgs dynamic_reconfigure
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

catkin_install_python(PROGRAMS
  src/motor_driver_ros_wrapper.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(
  DIRECTORY cfg
  DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
)

