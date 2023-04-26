#! /usr/bin/env python

# Software License Agreement (BSD License)
#
# Copyright (c) 2018, Enway GmbH
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the names of the authors nor the names of their
#    affiliated organizations may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

__copyright__ = "Enway GmbH - All Rights reserved."
__license__ = "BSD"

import rospy
import socket
import diagnostic_updater
import diagnostic_msgs
import enway_reach_rs_driver.driver
from sensor_msgs.msg import NavSatFix, NavSatStatus 
from std_msgs.msg import String
from datetime import datetime

#from reach_rs_driver.srv import GpsStatusSrv, GpsStatusSrvResponse

import time
import calendar
import struct

FixStatus = {-1 : 'No Fix',
              0 : 'Single Fix',
              1 : 'SBAS Fix',
              2 : 'GBAS Fix'}

class ReachRsDriver(object):
    def __init__(self):

        #host = rospy.get_param('~reach_host', 'reach.local') # '192.168.0.196' '192.168.2.15' '192.168.2.102'
        #host = rospy.get_param('reach_host', '192.168.43.44')
        host = rospy.get_param('/agar/reach_host', '192.168.2.15')
        port = rospy.get_param('/agar/reach_port', 9001)
        self.address = (host, port)

        self.socket = None

        self.frame_id = rospy.get_param('~reach_frame_id', 'reach_rs')
        self.fix_timeout = rospy.get_param('~fix_timeout', 0.5)
        
        self.driver = enway_reach_rs_driver.driver.RosNMEADriver()
        
        self.diagnostics = diagnostic_updater.Updater()
        self.diagnostics.setHardwareID('Emlid Reach RS')
        self.diagnostics.add('Receiver Status', self.add_diagnotics)
        
        self.connected = False
        self.connection_status = 'not connected'
        self.last_fix = None


        # def get_gps_status(req):

        #     navsat = NavSatStatus()
        #     navsat.status = 1
        #     navsat.service = 1

        #     response = GpsStatusSrvResponse()
        #     response.gps_connected = True
        #     response.status = navsat

            

        #     return response

        # s = rospy.Service('gps_status_service', GpsStatusSrv, get_gps_status)



    def __del__(self):
        if self.socket:
            self.socket.close()
        
    def update(self):
        self.diagnostics.update()
        #print("")
    
    def receives_fixes(self):
        if not self.last_fix:
            return False
        #print("f")
        duration = (rospy.Time.now() - self.last_fix.header.stamp)
        return duration.to_sec() < self.fix_timeout
        
    def add_diagnotics(self, stat):
        if self.connected and self.receives_fixes():
            stat.summary(diagnostic_msgs.msg.DiagnosticStatus.OK, 'Reach RS driver is connected and has a fix')
        elif self.connected:
            stat.summary(diagnostic_msgs.msg.DiagnosticStatus.WARN, 'Reach RS driver is connected but has no fix')
        else:
            stat.summary(diagnostic_msgs.msg.DiagnosticStatus.ERROR, 'Reach RS driver has a connection problem')
            
        stat.add('Connected', self.connected)
        stat.add('Connection status', self.connection_status)
        #print('##### diagnostics:', stat.summary)
        
        if self.last_fix:
            stat.add("Fix status", FixStatus[self.last_fix.status.status])
            stat.add("Seconds since last fix", (rospy.Time.now() - self.last_fix.header.stamp).to_sec())
        else:
            stat.add("Fix status", FixStatus[NavSatStatus.STATUS_NO_FIX])
            stat.add("Seconds since last fix", '-')
        
    def connect_to_device(self):
        rospy.loginfo('Connecting to {0}:{1}...'.format(*self.address))
        
        while not rospy.is_shutdown():
            self.update()
            
            if self.socket:
                self.socket.close()
                self.socket = None

            self.connected = False
            self.connection_status = 'not connected'

            self.socket = socket.socket()

            try:
                self.socket.settimeout(5)
                self.socket.connect(self.address)
                self.connected = True
                self.connection_status = 'connected'
                rospy.loginfo('Successfully connected to device!')
                return
            except socket.timeout:
                self.connection_status = 'connect timeout'
                rospy.loginfo(self.connection_status)
            except socket.error as msg:
                self.connection_status = 'connect error ({0})'.format(msg)
                rospy.loginfo(self.connection_status)
            
        exit()
        
    def run(self):

        self.connect_to_device()
        
        #self.pub = rospy.Publisher('/fix', String, queue_size = 1)
        self.pub = rospy.Publisher('/gps/fix', NavSatFix, queue_size = 1)


        #rospy.init_node('publisher_LLH', anonymous = True)
        #rate = rospy.Rate(10)
        
        while not rospy.is_shutdown():
            self.update()
            
            try:
                self.socket.settimeout(self.fix_timeout)
                data = self.socket.recv(1024)
                
                if data == '':
                    rospy.logwarn('Lost connection. Trying to reconnect...')
                    self.connect_to_device()
                else:
                    #print(str(data))
                    self.parse_data(data)
                    self.connection_status = 'receiving NMEA messages'
            except socket.timeout as t:
                self.connection_status = 'no NMEA messages received'
            except socket.error:
                pass
     
            
        
    def parse_data(self, data):
        data = data.strip().split()
        
        str_time = "{0} {1}".format(data[0].decode("UTF-8"), data[1].decode("UTF-8"))
        temp_time = datetime.strptime(str_time, "%Y/%m/%d %H:%M:%S.%f")
        time = rospy.Time.from_sec(temp_time.timestamp())

        msg = NavSatFix()
        msg.header.frame_id = 'gps_link'
        msg.header.stamp = time

        msg.status.status = 0
        msg.status.service = 1

        msg.latitude = float(data[2])
        msg.longitude = float(data[3])
        msg.altitude = float(data[4])

        self.pub.publish(msg)

        
        #print('pozicija', struct.unpack('f', data[2]), struct.unpack('f', data[3]))

        for sentence in data:
            #print(sentence, type(sentence))

            if b'GGA' in sentence or b'RMC' in sentence:
                try:
                    print(type(sentence), sentence)
                    fix = self.driver.add_sentence(sentence, self.frame_id)
                    #fix =0
                    if fix:
                        self.last_fix = fix
                        print('#### Fix is there')
                except ValueError as e:
                    rospy.logwarn("Value error, likely due to missing fields in the NMEA message. Error was: %s. Please report this issue at github.com/ros-drivers/nmea_navsat_driver, including a bag file with the NMEA sentences that caused it." % e)
            # else:
            #     print('sadasdasdasda')
