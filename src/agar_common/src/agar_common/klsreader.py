#!/usr/bin/env python3

# import time
# from pprint import pprint
from serial import Serial
from agar_common.controllerdata import *
from agar_common.controllercommand import *
# from sys import platform
# import datetime

class ControllerConnector(object):
    def __init__(self, serialport):
        self.serialport = serialport

    def startSerial(self):
        self.connection = Serial(self.serialport, 19200, timeout=5)

    def getBytes(self, *commands):
        ser = self.connection
        packets = []
        for command in commands:
            ser.write(command.encode())
            packet = ser.read(19)
            packets.append(packet)
        return packets

class KLSReader(object):
    def __init__(self, serialport):
        self.connector = ControllerConnector(serialport)
        self.connector.startSerial()
        self.command = ControllerCommand()

    def getData(self):
        packet_a, packet_b = self.connector.getBytes(self.command.a, self.command.b)
        data = ControllerData(packet_a, packet_b)
        return data.__dict__

class klsreader():
    def __init__(self):
        self.serialport_fl = '/dev/ttyUSB-MOTOR-1.1'
        self.controller_fl = KLSReader(self.serialport_fl)

        # self.serialport_rl = '/dev/ttyUSB-MOTOR-1.2.3'
        # self.controller_rl = KLSReader(self.serialport_rl)

        # self.serialport_fr = '/dev/ttyUSB-MOTOR-1.2.4.4'
        # self.controller_fr = KLSReader(self.serialport_fr)

        # self.serialport_rr = '/dev/ttyUSB-MOTOR-1.2.1'
        # self.controller_rr = KLSReader(self.serialport_rr)

    # def get_left_motor_status(self):
    #     data_rl = self.controller_rl.getData()
    #     return data_rl

    # def get_right_motor_status(self):
    #     data_rr = self.controller_rr.getData()

    #     return data_rr


    def get_motor_status(self):
        data_fl = self.controller_fl.getData()
        # data_rl = self.controller_rl.getData()
        # data_fr = self.controller_fr.getData()
        # data_rr = self.controller_rr.getData()
        
        data = {
            "front_left": data_fl,
            # "rear_left": data_rl,
            # "front_right": data_fr,
            # "rear_right": data_rr
        }

        return data