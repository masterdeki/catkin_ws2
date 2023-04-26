#!/usr/bin/env python3

from rpiplc_lib import rpiplc

class motor_commands():

    def __init__(self):
        rpiplc.init("RPIPLC_53ARR")

        self.pin_spd_fl = "A2.2"
        self.pin_frw_fl = "Q1.0"
        self.pin_bkw_fl = "Q1.1"
        self.pin_bra_fl = "A2.0"
        self.pin_brd_fl = "Q0.2"

        # self.pin_spd_fr = "A1.0"
        # self.pin_frw_fr = "R2.4"
        # self.pin_bkw_fr = "R2.5"
        # self.pin_bra_fr = "A0.7"
        # self.pin_brd_fr = "Q0.3"

        # self.pin_spd_rl = "A0.5"
        # self.pin_frw_rl = "R1.2"
        # self.pin_bkw_rl = "R1.1"
        # self.pin_bra_rl = "A2.1"
        # self.pin_brd_rl = "Q0.1"

        # self.pin_spd_rr = "A0.6"
        # self.pin_frw_rr = "R2.2"
        # self.pin_bkw_rr = "R2.1"
        # self.pin_bra_rr = "A1.2"
        # self.pin_brd_rr = "Q0.0"

        rpiplc.pin_mode(self.pin_spd_fl, rpiplc.OUTPUT)
        rpiplc.pin_mode(self.pin_frw_fl, rpiplc.OUTPUT)
        rpiplc.pin_mode(self.pin_bkw_fl, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_bra_fl, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_brd_fl, rpiplc.OUTPUT)

        # rpiplc.pin_mode(self.pin_spd_fr, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_frw_fr, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_bkw_fr, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_bra_fr, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_brd_fr, rpiplc.OUTPUT)

        # rpiplc.pin_mode(self.pin_spd_rl, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_frw_rl, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_bkw_rl, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_bra_rl, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_brd_rl, rpiplc.OUTPUT)

        # rpiplc.pin_mode(self.pin_spd_rr, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_frw_rr, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_bkw_rr, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_bra_rr, rpiplc.OUTPUT)
        # rpiplc.pin_mode(self.pin_brd_rr, rpiplc.OUTPUT)

        self.brake(False)


    def move(self, speed_fl, dir_fl):

        #print(speed_fl, dir_fl, speed_fr, dir_fr, speed_rl, dir_rl, speed_rr, dir_rr)

        if speed_fl == 0:
            rpiplc.digital_write(self.pin_frw_fl, rpiplc.LOW)
            rpiplc.digital_write(self.pin_bkw_fl, rpiplc.LOW)
            rpiplc.analog_write(self.pin_spd_fl, 0)
        elif dir_fl == 1:
            rpiplc.digital_write(self.pin_frw_fl, rpiplc.LOW)
            rpiplc.digital_write(self.pin_bkw_fl, rpiplc.HIGH)
            rpiplc.analog_write(self.pin_spd_fl, int(speed_fl))
        else:
            rpiplc.digital_write(self.pin_bkw_fl, rpiplc.LOW)
            rpiplc.digital_write(self.pin_frw_fl, rpiplc.HIGH)
            rpiplc.analog_write(self.pin_spd_fl, int(speed_fl))

        # if speed_fr == 0:
        #     rpiplc.digital_write(self.pin_frw_fr, rpiplc.LOW)
        #     rpiplc.digital_write(self.pin_bkw_fr, rpiplc.LOW)
        #     rpiplc.analog_write(self.pin_spd_fr, 0)
        # elif dir_fr == 1:
        #     rpiplc.digital_write(self.pin_frw_fr, rpiplc.LOW)
        #     rpiplc.digital_write(self.pin_bkw_fr, rpiplc.HIGH)
        #     rpiplc.analog_write(self.pin_spd_fr, int(speed_fr))
        # else:
        #     rpiplc.digital_write(self.pin_bkw_fr, rpiplc.LOW)
        #     rpiplc.digital_write(self.pin_frw_fr, rpiplc.HIGH)
        #     rpiplc.analog_write(self.pin_spd_fr, int(speed_fr))

        # if speed_rl == 0:
        #     rpiplc.digital_write(self.pin_frw_rl, rpiplc.LOW)
        #     rpiplc.digital_write(self.pin_bkw_rl, rpiplc.LOW)
        #     rpiplc.analog_write(self.pin_spd_rl, 0)
        # elif dir_rl == 1:
        #     rpiplc.digital_write(self.pin_frw_rl, rpiplc.LOW)
        #     rpiplc.digital_write(self.pin_bkw_rl, rpiplc.HIGH)
        #     rpiplc.analog_write(self.pin_spd_rl, int(speed_rl))
        # else:
        #     rpiplc.digital_write(self.pin_bkw_rl, rpiplc.LOW)
        #     rpiplc.digital_write(self.pin_frw_rl, rpiplc.HIGH)
        #     rpiplc.analog_write(self.pin_spd_rl, int(speed_rl))

        # if speed_rr == 0:
        #     rpiplc.digital_write(self.pin_frw_rr, rpiplc.LOW)
        #     rpiplc.digital_write(self.pin_bkw_rr, rpiplc.LOW)
        #     rpiplc.analog_write(self.pin_spd_rr, 0)
        # elif dir_rr == 1:
        #     rpiplc.digital_write(self.pin_frw_rr, rpiplc.LOW)
        #     rpiplc.digital_write(self.pin_bkw_rr, rpiplc.HIGH)
        #     rpiplc.analog_write(self.pin_spd_rr, int(speed_rr))
        # else:
        #     rpiplc.digital_write(self.pin_bkw_rr, rpiplc.LOW)
        #     rpiplc.digital_write(self.pin_frw_rr, rpiplc.HIGH)
        #     rpiplc.analog_write(self.pin_spd_rr, int(speed_rr))


    def move_side(self, speed_left, dir_left):
        self.move(speed_left, dir_left, speed_left, dir_left)

    def stop(self):

        rpiplc.digital_write(self.pin_frw_fl, rpiplc.LOW)
        rpiplc.digital_write(self.pin_bkw_fl, rpiplc.LOW)
        rpiplc.analog_write(self.pin_spd_fl, 0)

        # rpiplc.digital_write(self.pin_frw_fr, rpiplc.LOW)
        # rpiplc.digital_write(self.pin_bkw_fr, rpiplc.LOW)
        # rpiplc.analog_write(self.pin_spd_fr, 0)

        # rpiplc.digital_write(self.pin_frw_rl, rpiplc.LOW)
        # rpiplc.digital_write(self.pin_bkw_rl, rpiplc.LOW)
        # rpiplc.analog_write(self.pin_spd_rl, 0)

        # rpiplc.digital_write(self.pin_frw_rr, rpiplc.LOW)
        # rpiplc.digital_write(self.pin_bkw_rr, rpiplc.LOW)
        # rpiplc.analog_write(self.pin_spd_rr, 0)


    def brake(self, brake_fl):

        if brake_fl == True:
            rpiplc.digital_write(self.pin_brd_fl, rpiplc.HIGH)
        else:
            rpiplc.analog_write(self.pin_bra_fl, 0)
            rpiplc.digital_write(self.pin_brd_fl, rpiplc.LOW)

        # if brake_fr == True:
        #     rpiplc.digital_write(self.pin_brd_fr, rpiplc.HIGH)
        # else:
        #     rpiplc.analog_write(self.pin_bra_fr, 0)
        #     rpiplc.digital_write(self.pin_brd_fr, rpiplc.LOW)

        # if brake_rl == True:
        #     rpiplc.digital_write(self.pin_brd_rl, rpiplc.HIGH)
        # else:
        #     rpiplc.analog_write(self.pin_bra_rl, 0)
        #     rpiplc.digital_write(self.pin_brd_rl, rpiplc.LOW)

        # if brake_rr == True:
        #     rpiplc.digital_write(self.pin_brd_rr, rpiplc.HIGH)
        # else:
        #     rpiplc.analog_write(self.pin_bra_rr, 0)
        #     rpiplc.digital_write(self.pin_brd_rr, rpiplc.LOW)

    def brake_all(self):
        self.brake(True)

    def remove_brakes(self):
        self.brake(False)


    def brake_analog(self, brake_fl):

        if brake_fl == 0:
            rpiplc.analog_write(self.pin_bra_fl, 0)
        else:
            rpiplc.analog_write(self.pin_bra_fl, brake_fl)

        # if brake_fr == 0:
        #     rpiplc.analog_write(self.pin_bra_fr, 0)
        # else:
        #     rpiplc.analog_write(self.pin_bra_fr, brake_fr)

        # if brake_rl == 0:
        #     rpiplc.analog_write(self.pin_bra_rl, 0)
        # else:
        #     rpiplc.analog_write(self.pin_bra_rl, brake_rl)

        # if brake_rr == 0:
        #     rpiplc.analog_write(self.pin_bra_rr, 0)
        # else:
        #     rpiplc.analog_write(self.pin_bra_rr, brake_rr)


