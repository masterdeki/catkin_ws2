#!/usr/bin/env python3

import tf
import rospy
#import tf2_ros
import math

from nav_msgs.msg import Odometry
from sensor_msgs.msg import NavSatFix

import agar_common.alvinxy as axy

if __name__ == '__main__':
    rospy.init_node('robot_position')


    br = tf.TransformBroadcaster()


    imu_orientation = tf.transformations.quaternion_from_euler(0, 0, 0)
    gps_position = [0, 0, 0]


    def get_xy_based_on_lat_long(lat,lon, name):
        # (olat, olon) = rospy.get_param('initial_gps_position')
        # olat = 43.33169587
        # olon = 21.89413973

        # olat = 43.329881835649694
        # olon = 21.893632601621068

        olat = rospy.get_param('agar/gps_latitude', 0)
        olon = rospy.get_param('agar/gps_longitude', 0)

        # olat = 0
        # olon = 0
        
        xa,ya = axy.ll2xy(lat, lon, olat, olon)

        rospy.loginfo("#########  " + name + "  ###########")  
        rospy.loginfo("ORIGINAL COORDINATES ==>" + str(olat) + "," + str(olon))
        rospy.loginfo("LAT COORDINATES ==>" + str(lat) + "," + str(lon))  
        rospy.loginfo("COORDINATES AXY==>" + str(xa) + "," + str(ya))

        return xa, ya

    def transform_imu_data(msg):
        global imu_orientation
        orientation = msg.pose.pose.orientation

        orientation_list = [orientation.x, orientation.y, orientation.z, orientation.w]
        (roll, pitch, yaw) = tf.transformations.euler_from_quaternion(orientation_list)

        imu_orientation = tf.transformations.quaternion_from_euler(roll, pitch, (yaw - math.pi / 2) * -1)


    def transform_gps_data(msg):
        global gps_position

        lat = msg.latitude
        lng = msg.longitude

        # if rospy.has_param('initial_gps_position') == False: 
        #     rospy.set_param('initial_gps_position', (lat, lng))

        (x, y) = get_xy_based_on_lat_long(lat, lng, 'AgAR')
        gps_position = [x, y, 0]
        #print('gps_position', gps_position)
        




    rospy.Subscriber("/nav/odom", Odometry, transform_imu_data)
    rospy.Subscriber("/gps/fix", NavSatFix, transform_gps_data)


    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        print('Position: ', gps_position, imu_orientation)
        br.sendTransform(gps_position, imu_orientation, rospy.Time.now(), 'base_link', 'odom')
        rate.sleep()

        if rospy.is_shutdown():
            break


    print('Node robot_position stopped')            


#rospy.spin()