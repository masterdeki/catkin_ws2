cmake_minimum_required(VERSION 2.8.3)
project(reach_rs_driver)

find_package(catkin REQUIRED COMPONENTS
    rospy
    sensor_msgs
    message_generation
)

catkin_python_setup()

add_service_files(
  DIRECTORY srv 
  FILES 
  GpsStatusSrv.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
  sensor_msgs
)



catkin_package(
    LIBRARIES reach_rs_driver
    CATKIN_DEPENDS rospy sensor_msgs message_runtime
)

catkin_install_python(PROGRAMS
  scripts/reach_rs_driver_node
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
