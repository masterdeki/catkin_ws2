# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "agar_navigation: 2 messages, 4 services")

set(MSG_I_FLAGS "-Iagar_navigation:/home/dejan/catkin_ws/src/agar_navigation/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(agar_navigation_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg" NAME_WE)
add_custom_target(_agar_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "agar_navigation" "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg" ""
)

get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/msg/motor_status.msg" NAME_WE)
add_custom_target(_agar_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "agar_navigation" "/home/dejan/catkin_ws/src/agar_navigation/msg/motor_status.msg" "agar_navigation/controller_status"
)

get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/AgarParams.srv" NAME_WE)
add_custom_target(_agar_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "agar_navigation" "/home/dejan/catkin_ws/src/agar_navigation/srv/AgarParams.srv" ""
)

get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/AutoMoveSave.srv" NAME_WE)
add_custom_target(_agar_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "agar_navigation" "/home/dejan/catkin_ws/src/agar_navigation/srv/AutoMoveSave.srv" ""
)

get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotSpeedSave.srv" NAME_WE)
add_custom_target(_agar_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "agar_navigation" "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotSpeedSave.srv" ""
)

get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotStatusSrv.srv" NAME_WE)
add_custom_target(_agar_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "agar_navigation" "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotStatusSrv.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agar_navigation
)
_generate_msg_cpp(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/msg/motor_status.msg"
  "${MSG_I_FLAGS}"
  "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agar_navigation
)

### Generating Services
_generate_srv_cpp(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/AgarParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agar_navigation
)
_generate_srv_cpp(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/AutoMoveSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agar_navigation
)
_generate_srv_cpp(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotSpeedSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agar_navigation
)
_generate_srv_cpp(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotStatusSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agar_navigation
)

### Generating Module File
_generate_module_cpp(agar_navigation
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agar_navigation
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(agar_navigation_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(agar_navigation_generate_messages agar_navigation_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg" NAME_WE)
add_dependencies(agar_navigation_generate_messages_cpp _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/msg/motor_status.msg" NAME_WE)
add_dependencies(agar_navigation_generate_messages_cpp _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/AgarParams.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_cpp _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/AutoMoveSave.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_cpp _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotSpeedSave.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_cpp _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotStatusSrv.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_cpp _agar_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(agar_navigation_gencpp)
add_dependencies(agar_navigation_gencpp agar_navigation_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS agar_navigation_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agar_navigation
)
_generate_msg_eus(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/msg/motor_status.msg"
  "${MSG_I_FLAGS}"
  "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agar_navigation
)

### Generating Services
_generate_srv_eus(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/AgarParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agar_navigation
)
_generate_srv_eus(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/AutoMoveSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agar_navigation
)
_generate_srv_eus(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotSpeedSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agar_navigation
)
_generate_srv_eus(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotStatusSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agar_navigation
)

### Generating Module File
_generate_module_eus(agar_navigation
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agar_navigation
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(agar_navigation_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(agar_navigation_generate_messages agar_navigation_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg" NAME_WE)
add_dependencies(agar_navigation_generate_messages_eus _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/msg/motor_status.msg" NAME_WE)
add_dependencies(agar_navigation_generate_messages_eus _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/AgarParams.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_eus _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/AutoMoveSave.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_eus _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotSpeedSave.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_eus _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotStatusSrv.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_eus _agar_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(agar_navigation_geneus)
add_dependencies(agar_navigation_geneus agar_navigation_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS agar_navigation_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agar_navigation
)
_generate_msg_lisp(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/msg/motor_status.msg"
  "${MSG_I_FLAGS}"
  "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agar_navigation
)

### Generating Services
_generate_srv_lisp(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/AgarParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agar_navigation
)
_generate_srv_lisp(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/AutoMoveSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agar_navigation
)
_generate_srv_lisp(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotSpeedSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agar_navigation
)
_generate_srv_lisp(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotStatusSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agar_navigation
)

### Generating Module File
_generate_module_lisp(agar_navigation
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agar_navigation
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(agar_navigation_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(agar_navigation_generate_messages agar_navigation_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg" NAME_WE)
add_dependencies(agar_navigation_generate_messages_lisp _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/msg/motor_status.msg" NAME_WE)
add_dependencies(agar_navigation_generate_messages_lisp _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/AgarParams.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_lisp _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/AutoMoveSave.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_lisp _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotSpeedSave.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_lisp _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotStatusSrv.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_lisp _agar_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(agar_navigation_genlisp)
add_dependencies(agar_navigation_genlisp agar_navigation_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS agar_navigation_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agar_navigation
)
_generate_msg_nodejs(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/msg/motor_status.msg"
  "${MSG_I_FLAGS}"
  "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agar_navigation
)

### Generating Services
_generate_srv_nodejs(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/AgarParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agar_navigation
)
_generate_srv_nodejs(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/AutoMoveSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agar_navigation
)
_generate_srv_nodejs(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotSpeedSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agar_navigation
)
_generate_srv_nodejs(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotStatusSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agar_navigation
)

### Generating Module File
_generate_module_nodejs(agar_navigation
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agar_navigation
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(agar_navigation_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(agar_navigation_generate_messages agar_navigation_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg" NAME_WE)
add_dependencies(agar_navigation_generate_messages_nodejs _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/msg/motor_status.msg" NAME_WE)
add_dependencies(agar_navigation_generate_messages_nodejs _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/AgarParams.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_nodejs _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/AutoMoveSave.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_nodejs _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotSpeedSave.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_nodejs _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotStatusSrv.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_nodejs _agar_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(agar_navigation_gennodejs)
add_dependencies(agar_navigation_gennodejs agar_navigation_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS agar_navigation_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agar_navigation
)
_generate_msg_py(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/msg/motor_status.msg"
  "${MSG_I_FLAGS}"
  "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agar_navigation
)

### Generating Services
_generate_srv_py(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/AgarParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agar_navigation
)
_generate_srv_py(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/AutoMoveSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agar_navigation
)
_generate_srv_py(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotSpeedSave.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agar_navigation
)
_generate_srv_py(agar_navigation
  "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotStatusSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agar_navigation
)

### Generating Module File
_generate_module_py(agar_navigation
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agar_navigation
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(agar_navigation_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(agar_navigation_generate_messages agar_navigation_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/msg/controller_status.msg" NAME_WE)
add_dependencies(agar_navigation_generate_messages_py _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/msg/motor_status.msg" NAME_WE)
add_dependencies(agar_navigation_generate_messages_py _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/AgarParams.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_py _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/AutoMoveSave.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_py _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotSpeedSave.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_py _agar_navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dejan/catkin_ws/src/agar_navigation/srv/RobotStatusSrv.srv" NAME_WE)
add_dependencies(agar_navigation_generate_messages_py _agar_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(agar_navigation_genpy)
add_dependencies(agar_navigation_genpy agar_navigation_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS agar_navigation_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agar_navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/agar_navigation
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(agar_navigation_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agar_navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/agar_navigation
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(agar_navigation_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agar_navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/agar_navigation
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(agar_navigation_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agar_navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/agar_navigation
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(agar_navigation_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agar_navigation)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agar_navigation\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/agar_navigation
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(agar_navigation_generate_messages_py std_msgs_generate_messages_py)
endif()
