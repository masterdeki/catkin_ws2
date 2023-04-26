#!/usr/bin/env python3

import rospy
import time
from std_msgs.msg import UInt64
from agar_common.motor_commands import motor_commands

class agar_init(object):
    def __init__(self):
        self.motor = motor_commands()
        self.stop_robot()
        rospy.set_param("agar/brake_enabled", True)
        
        self.rate = rospy.Rate(10)
        self.last_milliseconds = 0
        self.curr_milliseconds = 0

        def check_client_time(msg):
            self.last_milliseconds = self.curr_milliseconds = msg.data / 1000.0
        rospy.Subscriber("/connected_client_time", UInt64, check_client_time, queue_size=1) 

    def stop_robot(self):
        self.motor.stop()
        self.motor.brake_all()

    def start(self):
        while not rospy.is_shutdown():
            brake_enabled = rospy.get_param("agar/brake_enabled", False)
            if brake_enabled == False:
                diff = self.curr_milliseconds - self.last_milliseconds
                #print('Current Time: {0}, last time: {1}, diff: {2}, brake: {3}'.format(self.curr_milliseconds, self.last_milliseconds, diff, brake_enabled))
                if diff > 0.5:
                    self.stop_robot()  
                    rospy.loginfo('Current Time: %s, last time: %s, diff: %s, brake: %s', self.curr_milliseconds, self.last_milliseconds, diff, brake_enabled)
                    rospy.loginfo('Controller disconnected. Panic active. Time: %s', diff)
                    rospy.set_param("agar/brake_enabled", True)
                self.curr_milliseconds += 0.1
            self.rate.sleep()

        rospy.logdebug('Node agar_initialization stopped')

if __name__ == '__main__':
    rospy.init_node("agar_initialization", anonymous=True)
    robot = agar_init()
    robot.start()