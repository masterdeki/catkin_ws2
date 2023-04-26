#!/usr/bin/env python3

# import sys
#sys.path.append('/home/dejan/catkin_ws/src/agar_common/src/agar_common')

import rospy
from dynamic_reconfigure.server import Server
from agar_motor_controller.cfg import DynamicParamConfig
from geometry_msgs.msg import Twist
from std_msgs.msg import Int32MultiArray

from motor_driver import motor_driver, motor_direction
from std_msgs.msg import UInt64

from agar_common.klsreader import klsreader
from agar_navigation.msg import motor_status
from agar_navigation.msg import controller_status 



class motor_wrapper(object):
    def __init__(self):

        self.motor_driver = motor_driver()
        self.motor_driver.stop()
        self.motor_driver.activate_all_brakes()
        self.motor_driver.release_all_brakes()
        self.max_left_rpm = 0
        self.max_right_rpm = 0
        self.motor_driver.release_all_analog_brakes()
        

        self.kls = klsreader()

        self.current_speed = 0
        self.target_speed = 0
        self.changed_direction = False
        self.motor_dir = motor_direction.FORWARD

        rospy.on_shutdown(self.motor_driver.stop)
        self.rate = rospy.Rate(100)

        self.reconfigure_server = Server(DynamicParamConfig, callback=self.param_callback)

        self.motor_status_pub = rospy.Publisher('/motor_status', motor_status, queue_size=1)    
        rospy.Subscriber("/motor_cmd_vel", Twist, self.activate_motor, queue_size=1)


    def param_callback(self, config, level):

        self.motor_speed = config.motor_speed
        self.motor_driver.set_speed(config.motor_speed, config.min_speed)
        return config
    
    def activate_motor(self, msg):
        linear_velocity = msg.linear.x

        if linear_velocity == 0:
            self.motor_driver.stop()
            self.motor_driver.activate_all_brakes()
            self.motor_driver.release_all_brakes()
            self.max_left_rpm = 0
            self.max_right_rpm = 0
            self.motor_driver.release_all_analog_brakes()
            self.target_speed = 0
        else:

            temp_dir = motor_direction.FORWARD
            if linear_velocity < 0:
                temp_dir = motor_direction.BACKWARD


            if temp_dir != self.motor_dir:
                self.changed_direction = True

            self.motor_dir = temp_dir


            linear_velocity = linear_velocity * (self.motor_speed / 100)
            self.target_speed = abs(linear_velocity) * 2048

            #self.motor_driver.move(motor_speed, motor_dir)

    
    def publish_motor_status(self, data):
        cont_fl = controller_status()
        cont_fl.rpm = data["front_left"]["rpm"]
        cont_fl.phaseCurrent = data["front_left"]["phaseCurrent"]
        cont_fl.batteryVoltage = data["front_left"]["batteryVoltage"]
        cont_fl.controllerTemp = data["front_left"]["controllerTemp"]
        cont_fl.reverse = data["front_left"]["reverse"]
        cont_fl.brakePedal = data["front_left"]["brakePedal"]
        cont_fl.brakeSwitch = data["front_left"]["brakeSwitch"]
        cont_fl.footSwitch = data["front_left"]["footSwitch"]

        mtr_status = motor_status()
        mtr_status.motor_fl = cont_fl

        self.motor_status_pub.publish(mtr_status)
    
    def start(self):
        while not rospy.is_shutdown():

            motor_data = self.kls.get_motor_status()
            self.publish_motor_status(motor_data)


            if self.changed_direction == True:
                self.changed_direction = False
                self.current_speed = 0


            motor_speed_changed = False

            if self.current_speed > self.target_speed:
                self.current_speed = self.target_speed
                motor_speed_changed = True
            elif self.current_speed < self.target_speed:
                self.current_speed += 10
                motor_speed_changed = True

            rospy.loginfo('current: {0} - target: {1}'.format(self.current_speed, self.target_speed))

            if motor_speed_changed:
                self.motor_driver.move(self.current_speed, self.motor_dir)


            if rospy.is_shutdown():
                break

            self.rate.sleep()

        self.motor_driver.stop()
        self.motor_driver.activate_all_brakes()
    



if __name__ == '__main__':
    rospy.init_node('motor_driver_ros_wrapper')

    motor_wrapper = motor_wrapper()
    motor_wrapper.start()