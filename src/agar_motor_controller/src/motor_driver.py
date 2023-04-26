#!/usr/bin/env python3

import rospy

from enum import Enum
from rpiplc_lib import rpiplc
from threading import Thread
from threading import Event
import time

class motor_direction(Enum):
    FORWARD = 0
    BACKWARD = 1
    # NEUTRAL = 2
    # TENK_LEFT = 3
    # TENK_RIGHT = 4
    # LEFT = 5
    # RIGHT = 6

class motor_driver(object):
    def __init__(self, motor_speed = 512, analog_brake_fl = 0):
        rpiplc.init("RPIPLC_53ARR")

        self.pin_spd_fl = "A2.2"
        self.pin_frw_fl = "Q1.0"
        self.pin_bkw_fl = "Q1.1"
        self.pin_bra_fl = "A2.0"
        self.pin_brd_fl = "Q0.2"

        # self.pin_spd_rl = "A0.5"
        # self.pin_frw_rl = "R1.2"
        # self.pin_bkw_rl = "R1.1"
        # self.pin_bra_rl = "A2.1"
        # self.pin_brd_rl = "Q0.1"

        # self.pin_spd_fr = "A1.0"
        # self.pin_frw_fr = "R2.4"
        # self.pin_bkw_fr = "R2.5"
        # self.pin_bra_fr = "A0.7"
        # self.pin_brd_fr = "Q0.3"

        # self.pin_spd_rr = "A0.6"
        # self.pin_frw_rr = "R2.2"
        # self.pin_bkw_rr = "R2.1"
        # self.pin_bra_rr = "A1.2"
        # self.pin_brd_rr = "Q0.0"

        # self.pin_beeper = "Q2.2"
        # #self.back_drive_activated = False
        # rpiplc.pin_mode(self.pin_beeper, rpiplc.OUTPUT)
        # rpiplc.digital_write(self.pin_beeper, rpiplc.LOW)
        # self.thread_beeper = None
        # self.event_beeper = Event()
        


        self.__init_pin(self.pin_spd_fl, self.pin_frw_fl, self.pin_bkw_fl, self.pin_bra_fl, self.pin_brd_fl)
        # self.__init_pin(self.pin_spd_rl, self.pin_frw_rl, self.pin_bkw_rl, self.pin_bra_rl, self.pin_brd_rl)
        # self.__init_pin(self.pin_spd_fr, self.pin_frw_fr, self.pin_bkw_fr, self.pin_bra_fr, self.pin_brd_fr)
        # self.__init_pin(self.pin_spd_rr, self.pin_frw_rr, self.pin_bkw_rr, self.pin_bra_rr, self.pin_brd_rr)

        self.max_speed = 1024
        self.min_speed = 200

        self.motor_speed = motor_speed
        # self.tank_speed = tank_speed

        self.analog_brake_fl = analog_brake_fl
        # self.analog_brake_rl = analog_brake_rl
        # self.analog_brake_fr = analog_brake_fr
        # self.analog_brake_rr = analog_brake_rr

        self.release_all_brakes()
        self.release_all_analog_brakes()


    # def run_beeper_thread(self):
    #     while(True):
    #         if self.event_beeper.is_set():
    #             break

    #         rpiplc.digital_write(self.pin_beeper, rpiplc.HIGH)
    #         time.sleep(0.35)
    #         rpiplc.digital_write(self.pin_beeper, rpiplc.LOW)
    #         time.sleep(0.45)
            

    def __init_pin(self, speed, forward, backward, analog_brake, digital_brake):
        rpiplc.pin_mode(speed, rpiplc.OUTPUT)
        rpiplc.pin_mode(forward, rpiplc.OUTPUT)
        rpiplc.pin_mode(backward, rpiplc.OUTPUT)
        rpiplc.pin_mode(analog_brake, rpiplc.OUTPUT)
        rpiplc.pin_mode(digital_brake, rpiplc.OUTPUT)

    def __control_motor(self, speed, direction, pin_speed, pin_forward, pin_backward):
        if speed == 0:
            rpiplc.digital_write(pin_forward, rpiplc.LOW)
            rpiplc.digital_write(pin_backward, rpiplc.LOW)
            rpiplc.analog_write(pin_speed, 0)
        elif direction == motor_direction.BACKWARD:
            rpiplc.digital_write(pin_forward, rpiplc.LOW)
            rpiplc.digital_write(pin_backward, rpiplc.HIGH)
            rpiplc.analog_write(pin_speed, int(speed))
        else:
            rpiplc.digital_write(pin_forward, rpiplc.HIGH)
            rpiplc.digital_write(pin_backward, rpiplc.LOW)
            rpiplc.analog_write(pin_speed, int(speed))

    def __control_digital_brake(self, brake, brake_pin):
        if brake == True:
            rpiplc.digital_write(brake_pin, rpiplc.HIGH)
        else:
            rpiplc.digital_write(brake_pin, rpiplc.LOW)

    def __control_analog_brake(self, brake, brake_pin):
        if brake == 0:
            rpiplc.analog_write(brake_pin, 0)
        else:
            rpiplc.analog_write(brake_pin, brake)


    def set_speed(self, motor_speed, min_speed):
        print('New speeds received. Motor speed: {0}, minimum speed: {1}'.format(motor_speed, min_speed))
        self.motor_speed = motor_speed
        # self.tank_speed = tank_speed
        self.min_speed = min_speed

    def set_analog_brakes_speed(self, front_left = 0):
        print('New analog brakes received. Front left: {0}'
              .format(front_left))
        self.analog_brake_fl = front_left
        # self.analog_brake_rl = rear_left
        # self.analog_brake_fr = front_right
        # self.analog_brake_rr = rear_right

    def stop(self):
        # self.event_beeper.set()
        self.move(0, 0)

    def brake(self, front_left):
        self.__control_digital_brake(front_left, self.pin_brd_fl)
        # self.__control_digital_brake(rear_left, self.pin_brd_rl)
        # self.__control_digital_brake(front_right, self.pin_brd_fr)
        # self.__control_digital_brake(rear_right, self.pin_brd_rr)

    def brake_analog(self, front_left_strength):
        self.__control_analog_brake(front_left_strength, self.pin_bra_fl)
        # self.__control_analog_brake(rear_left_strength, self.pin_bra_rl)
        # self.__control_analog_brake(front_right_strength, self.pin_bra_fr)
        # self.__control_analog_brake(rear_right_strength, self.pin_bra_rr)

    def brake_analog_by_speed(self, front_left, extra_speed):
        self.__control_analog_brake(self.analog_brake_fl + extra_speed if front_left == True else 0, self.pin_bra_fl)
        # self.__control_analog_brake(self.analog_brake_rl + extra_speed if rear_left == True else 0, self.pin_bra_rl)
        # self.__control_analog_brake(self.analog_brake_fr + extra_speed if front_right == True else 0, self.pin_bra_fr)
        # self.__control_analog_brake(self.analog_brake_rr + extra_speed if rear_right == True else 0, self.pin_bra_rr)

    def activate_all_brakes(self):
        self.brake(True)

    def release_all_brakes(self):
        self.brake(False)

    def activate_all_analog_brakes(self):
        self.brake(self.max_speed)

    def release_all_analog_brakes(self):
        self.brake_analog(0)

    # def move_by_side(self, left_speed, left_direction, right_speed, right_direction):
    #     if right_direction == motor_direction.BACKWARD and left_direction == motor_direction.BACKWARD:
    #         if self.thread_beeper == None or self.thread_beeper.is_alive() == False:
    #             self.event_beeper.clear()
    #             self.thread_beeper = Thread(target = self.run_beeper_thread)
    #             self.thread_beeper.start()
    #     else:
    #         self.event_beeper.set()

    #     self.move(left_speed, left_direction, left_speed, left_direction)

    def move(self, front_left_speed, front_left_direction):
        self.__control_motor(front_left_speed, front_left_direction, self.pin_spd_fl, self.pin_frw_fl, self.pin_bkw_fl)
        # self.__control_motor(rear_left_speed, rear_left_direction, self.pin_spd_rl, self.pin_frw_rl, self.pin_bkw_rl)
        # self.__control_motor(front_right_speed, front_right_direction, self.pin_spd_fr, self.pin_frw_fr, self.pin_bkw_fr)
        # self.__control_motor(rear_right_speed, rear_right_direction, self.pin_spd_rr, self.pin_frw_rr, self.pin_bkw_rr)