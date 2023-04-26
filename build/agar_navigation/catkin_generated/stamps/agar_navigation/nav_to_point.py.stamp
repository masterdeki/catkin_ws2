#!/usr/bin/env python3

import tf
import rospy
import math
import tf2_ros

from geometry_msgs.msg import Twist
from std_msgs.msg import String

import json

import agar_common.alvinxy as axy


if __name__ == '__main__':
    rospy.init_node('navigaton_to_point')

    rate = rospy.Rate(20.0)

    tfBuffer = tf2_ros.Buffer()
    listener = tf2_ros.TransformListener(tfBuffer)
    br = tf.TransformBroadcaster()

    total_m = 0
    total_m_added = False

    final_waypoint_reached = False
    heading_reached = False

    waypoint_name_index = 0

    path_list = []
    waypoint_list = []
    point_index = 0
    waypoint_name = 'waypoint_%s' % waypoint_name_index

    max_robot_speed = 1

    count = 0

    def get_xy_based_on_lat_long(lat,lon, name):
        olat = rospy.get_param('agar/gps_latitude', 0)
        olon = rospy.get_param('agar/gps_longitude', 0)

        xa,ya = axy.ll2xy(lat, lon, olat, olon)

        rospy.loginfo("#########  " + name + "  ###########")
        rospy.loginfo("ORIGINAL COORDINATES ==>" + str(olat) + "," + str(olon))
        rospy.loginfo("LAT COORDINATES ==>" + str(lat) + "," + str(lon))  
        rospy.loginfo("COORDINATES AXY==>" + str(xa) + "," + str(ya))

        return xa, ya

    def set_waypoints(data):
        #rospy.loginfo('new waypoints: %s', str(data.data))

        global point_index
        point_index = 0

        global final_waypoint_reached
        final_waypoint_reached = False

        global heading_reached
        heading_reached = False

        global path_list
        path_list = []

        global total_m
        total_m = 0

        global waypoint_list
        waypoint_list = []

        global total_m_added
        total_m_added = False

        global count
        count = 0

        points = json.loads(str(data.data))

        for point in points['waypoints']:
            lat = point['lat']
            lng = point['lng']
            
            xa, ya = get_xy_based_on_lat_long(lat, lng, 'waypoint')
            path_list.append((xa, ya))

            temp_wp = []
            temp_wp.append(lat)
            temp_wp.append(lng)
            temp_wp.append(point['title'])
            temp_wp.append(point['snippet'])
            temp_wp.append(point['reached'])

            #rospy.loginfo('waypoint data: %s', str(temp_wp))
            waypoint_list.append(temp_wp)

        # if len(path_list) > 0:
        #     path_list.append((0, 0))

        # ovo treba posle obrisati - zakucavamo koordinate
        #path_list = []
        #path_list.append((20, 20))
        # do ovde

        #rospy.loginfo('path_list: ' + str(path_list))

    def publish_waypoint_status():
        wp = '{"waypoints":['
        for idx, point in enumerate(waypoint_list):
            wp += '{ "lat": ' + str(point[0]) + ', "lng": ' + str(point[1])
            wp += ', "title": "' + point[2] + '"'
            wp += ', "snippet": "' + point[3] + '"'
            wp += ', "reached": ' + str(point[4]).lower() + ' }'

            if idx < len(waypoint_list) - 1:
                wp += ','

        wp += ']}'
        waypoint_reached_pub.publish(wp)

    rospy.Subscriber("waypoint_sub", String, set_waypoints)

    cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
    waypoint_reached_pub = rospy.Publisher('/waypoint_status', String, queue_size=1)


    msg = Twist()

    linear_speed = 0
    angular_speed = 0

    rospy.loginfo('Ready for receiving waypoints!')
    
    xa, ya = get_xy_based_on_lat_long(43.33108956, 21.89045839, 'waypoint')
    path_list.append((xa, ya))


    while not rospy.is_shutdown():
        is_auto_move = rospy.get_param('agar/auto_move', False)

        #rospy.loginfo('path_list', str(path_list))
        rospy.loginfo('is_auto_move %s', is_auto_move)
        
        if (is_auto_move):
        
            if point_index < len(path_list):    
                # ima waypoints
                temp_x = path_list[point_index][0]
                temp_y = path_list[point_index][1]

                br.sendTransform((temp_x, temp_y, 0), tf.transformations.quaternion_from_euler(0, 0, 0),
                    rospy.Time.now(), waypoint_name, 'base_link')

                try:
                    trans = tfBuffer.lookup_transform('base_link', waypoint_name, rospy.Time())
                    print('trans', trans)
                    distance_in_m = math.sqrt(trans.transform.translation.x ** 2 + trans.transform.translation.y ** 2)
                    angle_in_radian = math.atan2(trans.transform.translation.y, trans.transform.translation.x)

                    angle_in_degrees = angle_in_radian * 180 / math.pi

                    print('distance', distance_in_m, angle_in_radian, angle_in_degrees)

                    # if total_m_added == False:
                    #     total_m += distance_in_m
                    #     total_m_added = True

                    # rospy.loginfo('waypoint: %s, distance in m: %s, total meters: %s', waypoint_name, distance_in_m, total_m)
                    # rospy.loginfo('angle in degrees: %s', angle_in_degrees)

                    # if heading_reached == False:
                    #     linear_speed = 0

                    #     if angle_in_degrees > 5:
                    #         rospy.loginfo('angle_in_degrees > 5')
                    #         angular_speed = max_robot_speed
                    #     elif angle_in_degrees < -5:
                    #         rospy.loginfo('angle_in_degrees < -5')
                    #         angular_speed = max_robot_speed * -1
                    #     elif angle_in_degrees >= -5 and angle_in_degrees <= 5:
                    #         rospy.loginfo('angle_in_degrees > -2 and angle_in_degrees < 2. Heading reached')
                    #         heading_reached = True
                    #         angular_speed = 0
                    #     else:
                    #         rospy.loginfo('angle_in_degrees between 2 and 5')
                    #         angular_speed = 1 * angle_in_radian
                    #         if angular_speed > max_robot_speed:
                    #             angular_speed = max_robot_speed
                    #         elif angular_speed < max_robot_speed * -1:
                    #             angular_speed = max_robot_speed * -1

                    # else:
                    #     if distance_in_m > 1:
                    #         linear_speed = max_robot_speed
                    #     else:
                    #         linear_speed = 0.5 * distance_in_m

                    #     angular_speed = 1 * angle_in_radian
                    #     if angular_speed > max_robot_speed:
                    #         angular_speed = max_robot_speed
                    #     elif angular_speed < max_robot_speed * -1:
                    #         angular_speed = max_robot_speed * -1


                    # #if distance_in_m < 0.03:
                    # if distance_in_m < 0.1:
                    #     angular_speed = 0
                    #     linear_speed = 0

                    #     if point_index < len(waypoint_list):
                    #         point = waypoint_list[point_index]
                    #         point[4] = True

                    #     point_index += 1
                    #     waypoint_name_index += 1
                    #     waypoint_name = 'waypoint_%s' % waypoint_name_index
                    #     heading_reached = False
                    #     total_m_added = False
                    #     rospy.loginfo('waypoint reached, next waypoint: ' + waypoint_name)

                    
                    # rospy.loginfo('linear_speed: %s, angular_speed: ', linear_speed, angular_speed)
                    
                except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException) as e:
                    # print('##################################### error #####################################')
                    # print(e)
                    rospy.logerr('Error occured while calculate robot position')
                    msg.angular.z = 0
                    msg.linear.x = 0
                    cmd_vel_pub.publish(msg)
                    rate.sleep()
                    continue

            else:
                if final_waypoint_reached != True:
                    final_waypoint_reached = True
                    rospy.loginfo('All waypoints reached')
                    
                    publish_waypoint_status()

                    angular_speed = 0
                    linear_speed = 0

            # msg.angular.z = angular_speed
            # #msg.linear.x = linear_speed
            # msg.linear.x = 0
            # cmd_vel_pub.publish(msg)

        if final_waypoint_reached == False:
            if count == 10: #20:
                publish_waypoint_status()
                count = 0
            else:
                count += 1

        if rospy.is_shutdown():
            break

        rate.sleep()

        #rospy.sleep(5)

    rospy.loginfo('Node navigaton_to_point stopped')            
