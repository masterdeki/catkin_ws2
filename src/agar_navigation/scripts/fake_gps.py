#!/usr/bin/env python3

import rospy
from std_msgs.msg import Header      
from sensor_msgs.msg import NavSatFix

if __name__ == '__main__':
    rospy.init_node('fake_gps_node')

    rate = rospy.Rate(1)

    gps_pub = rospy.Publisher('/gps/fix', NavSatFix, queue_size=1) 

    while(True):

        header = Header()
        header.stamp = rospy.Time.now()
        header.frame_id = "fake_gps_controller"

        msg = NavSatFix()
        msg.header = header
        msg.latitude = 43.33114325
        msg.longitude = 21.89048167
        msg.altitude = 242.794

        gps_pub.publish(msg)

        if rospy.is_shutdown():
            break

        rate.sleep()

    print("Fake GPS publishing stopped!")