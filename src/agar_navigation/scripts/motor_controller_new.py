#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
from dynamic_reconfigure.server import Server
from agar_navigation.cfg import DynamicParamConfig
from agar_common.klsreader import klsreader
from agar_navigation.msg import motor_status
from agar_navigation.msg import controller_status 

from enum import Enum

from agar_common.motor_commands import motor_commands

class Robot_DIR(Enum):
    FORWARD = 0
    BACKWARD = 1
    NEUTRAL = 2
    TENK_LEFT = 3
    TENK_RIGHT = 4
    LEFT = 5
    RIGHT = 6

def callback(config, level):

    global motor_speed
    global tank_speed
    global brake_speed
    global min_speed
    global rate

    motor_speed = config.motor_speed
    tank_speed = config.tank_speed
    brake_speed = config.analog_brake
    min_speed = config.min_speed
    rate_hz = config.rate_hz

    rospy.loginfo("Dynamic parameter: {0}, {1}, {2}, {3}, {4}".format(motor_speed, tank_speed, brake_speed, min_speed, rate_hz))


    rate = rospy.Rate(rate_hz)

    # if brake_speed > 0:
    #     rospy.loginfo("Analog brake activated. Brake speed: {0}".format(brake_speed))
    #     motor.brake_analog(brake_speed, brake_speed, brake_speed, brake_speed)
    # else:
    #     rospy.loginfo("Analog brake released")
    #     motor.brake_analog(0, 0, 0, 0)

    return config

if __name__ == '__main__':
    rospy.init_node('motor_controller')

    kls = klsreader()
    motor = motor_commands()
    motor.brake_all()
    motor.remove_brakes()
    
    rate = rospy.Rate(20)

    motor_speed = 0
    tank_speed = 0
    brake_speed = 0
    min_speed = 0

    default_speed = 1024
    max_speed = 512
    tenk_speed = 512

    cmd_x = 0
    cmd_z = 0
    

    reconfigure_server = Server(DynamicParamConfig, callback=callback)
    rospy.loginfo("initialize the dynamic_reconfig_test node...")


    def move_robot(msg):
        global cmd_x
        global cmd_z

        cmd_x = msg.linear.x
        cmd_z = msg.angular.z

        left_wheels_speed = 0
        left_wheels_direction = Robot_DIR.FORWARD
        right_wheels_speed = 0
        right_wheels_direction = Robot_DIR.FORWARD

        # if cmd_x == 0 and cmd_z == 0:
        #     motor.brake_all()
        #     return

        #motor.remove_brakes()

        if cmd_x == 0 and abs(cmd_z) != 0:
            left_wheels_speed = right_wheels_speed = (default_speed * tank_speed / 100) * abs(cmd_z)

            if left_wheels_speed < min_speed:
                left_wheels_speed = right_wheels_speed = min_speed

            if cmd_z > 0:
                left_wheels_direction = Robot_DIR.BACKWARD
                right_wheels_direction = Robot_DIR.FORWARD
            else:
                left_wheels_direction = Robot_DIR.FORWARD
                right_wheels_direction = Robot_DIR.BACKWARD

        else:
            rot_left = abs(cmd_z) if cmd_z > 0 else 0
            rot_right = abs(cmd_z) if cmd_z < 0 else 0

            max_speed = (default_speed * motor_speed / 100)

            left_wheels_speed = max_speed * abs(cmd_x) - max_speed * rot_left
            right_wheels_speed = max_speed * abs(cmd_x) - max_speed * rot_right

            if rot_left > 0 and left_wheels_speed < min_speed:
                left_wheels_speed = min_speed
            if rot_right > 0 and right_wheels_speed < min_speed:
                right_wheels_speed = min_speed

            if cmd_z > 0:
                motor.brake_analog(brake_speed, 0, brake_speed, 0)
            elif cmd_z < 0:
                motor.brake_analog(0, brake_speed, 0, brake_speed)
            else:
                motor.brake_analog(0, 0, 0, 0)


            if cmd_x < 0:
                left_wheels_direction = right_wheels_direction = Robot_DIR.BACKWARD
            else:
                left_wheels_direction = right_wheels_direction = Robot_DIR.FORWARD

        #rospy.loginfo("Wheel speed: {0}, {1}".format(left_wheels_speed, right_wheels_speed))

        motor.move_side(left_wheels_speed, left_wheels_direction.value, right_wheels_speed, right_wheels_direction.value)

    rospy.Subscriber("/cmd_vel", Twist, move_robot, queue_size=1)



    motor_status_pub = rospy.Publisher('/motor_status', motor_status, queue_size=1)    
    def publish_motor_status(data):
        cont_rl = controller_status()
        cont_rl.rpm = data["rear_left"]["rpm"]
        cont_rl.phaseCurrent = data["rear_left"]["phaseCurrent"]
        cont_rl.batteryVoltage = data["rear_left"]["batteryVoltage"]
        cont_rl.controllerTemp = data["rear_left"]["controllerTemp"]
        cont_rl.reverse = data["rear_left"]["reverse"]
        cont_rl.brakePedal = data["rear_left"]["brakePedal"]
        cont_rl.brakeSwitch = data["rear_left"]["brakeSwitch"]
        cont_rl.footSwitch = data["rear_left"]["footSwitch"]

        cont_rr = controller_status()
        cont_rr.rpm = data["rear_right"]["rpm"]
        cont_rr.phaseCurrent = data["rear_right"]["phaseCurrent"]
        cont_rr.batteryVoltage = data["rear_right"]["batteryVoltage"]
        cont_rr.controllerTemp = data["rear_right"]["controllerTemp"]
        cont_rr.reverse = data["rear_right"]["reverse"]
        cont_rr.brakePedal = data["rear_right"]["brakePedal"]
        cont_rr.brakeSwitch = data["rear_right"]["brakeSwitch"]
        cont_rr.footSwitch = data["rear_right"]["footSwitch"]

        mtr_status = motor_status()
        mtr_status.motor_rl = cont_rl
        mtr_status.motor_rr = cont_rr

        motor_status_pub.publish(mtr_status)


    brake_on = False

    while not rospy.is_shutdown():


        motor_data = kls.get_motor_status()
        publish_motor_status(motor_data)



        rpm_rr = motor_data["rear_right"]["rpm"]

        if rpm_rr > 500:
            motor.brake_analog(0, 0, 0, brake_speed)
        else:
            motor.brake_analog(0, 0, 0, 0)



        # if brake_speed > 0:
        #     if brake_on:
        #         motor.brake_analog(brake_speed, 0, brake_speed, 0)
        #         brake_on = False
        #     else:
        #         motor.brake_analog(0, 0, 0, 0)
        #         brake_on = True
        # else:
        #     motor.brake_analog(0, 0, 0, 0)



        if rospy.is_shutdown():
            motor.brake_all()
            break

        rate.sleep()



    print('Node motor_controller stopped')