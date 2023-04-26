#!/usr/bin/env python3

import rospy
from datetime import datetime

from sensor_msgs.msg import BatteryState
from agar_navigation.msg import motor_status
from sensor_msgs.msg import NavSatFix


if __name__ == '__main__':
    rospy.init_node('agar_logger')

    rate = rospy.Rate(25)
    record_log = rospy.get_param('/agar/record_log')

    log_dir = rospy.get_param("/agar/log_directory")
    log_filename = rospy.get_param("/agar/log_filename")
    time_stamp = datetime.now().strftime("%Y%m%d")

    log = "{0}{1}_{2}.txt".format(log_dir, log_filename, time_stamp)

    bat_log = "0,0,0,0,0"
    mot_log = "0,0,0,0,0,0,0,0,0,0"
    gps_log = "0,0,0,0"
    

    def get_battery_state(msg):
        global bat_log
        bat_log = "{0},{1},{2},{3},{4}".format(msg.voltage, msg.temperature, msg.current, msg.capacity, msg.percentage)
    rospy.Subscriber("/battery_state", BatteryState, get_battery_state, queue_size=1)


    def get_motor_status(msg):
        global mot_log
        mot_log = "{0},{1},{2},{3},{4},{5},{6},{7},{8},{9}".format(msg.motor_rl.rpm, msg.motor_rl.phaseCurrent, 
                msg.motor_rl.batteryVoltage, msg.motor_rl.controllerTemp, msg.motor_rl.reverse, msg.motor_rr.rpm, 
                msg.motor_rr.phaseCurrent, msg.motor_rr.batteryVoltage, msg.motor_rr.controllerTemp, msg.motor_rr.reverse)
    rospy.Subscriber('/motor_status', motor_status, get_motor_status, queue_size=1) 


    def get_gps_status(msg):
        global gps_log
        time = datetime.utcfromtimestamp(msg.header.stamp.to_sec())
        gps_log = "{0},{1},{2},{3}".format(time, msg.latitude, msg.longitude, msg.altitude)
    rospy.Subscriber('/gps/fix', NavSatFix, get_gps_status, queue_size=1)

    agar_log = open(log, "a")
    agar_log.write("******************************************************\n")
    agar_log.write('Log started at %s.\n' % datetime.now())
    agar_log.write("******************************************************\n")
    agar_log.write("time,gps_time,lat,lng,alt,bat_voltage,bat_temperature,bat_current,bat_capacity,bat_percentage,rl_rpm,rl_current,rl_bat_voltage,rl_controller_temp,rl_reverse,rr_rpm,rr_current,rr_bat_voltage,rr_controller_temp,rr_reverse\n")

    while(True):
        log_data = "{0},{1},{2},{3}".format(datetime.now(), gps_log, bat_log, mot_log)

        agar_log.write(log_data)
        agar_log.write(",\n")
        agar_log.flush()

        if rospy.is_shutdown():
            break

        rate.sleep()
