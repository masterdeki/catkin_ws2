#!/bin/bash
echo "AgAR Launch"

export ROS_LOG_DIR=/home/pi/ros_logs/agar_plc_ws
export ROSCONSOLE_FORMAT='[${node}][${severity}] [${time:%Y-%m-%d %H:%M:%S}] [${time}] - [line: ${line}] ${message}'

cd /home/pi/workspace/agar_plc_ws
source devel/setup.bash
roslaunch agar_launch agar.launch


