#!/usr/bin/env python

import rospy

from agar_navigation.srv import AgarParams, AgarParamsResponse

def handle_get(req):

    response = AgarParamsResponse()
    try:
        response.auto_move = rospy.get_param('agar/auto_move', False)
        response.robot_speed = rospy.get_param('agar/robot_speed', 50)
        response.tenk_speed = rospy.get_param('agar/tenk_speed', 50)
        response.brake_enabled = rospy.get_param('agar/brake_enabled', False)

    except rospy.ROSException as e:
        rospy.logerr(e)

    return response

def agar_params_server():
    rospy.init_node('agar_params_server')
    s = rospy.Service('agar_params_server', AgarParams, handle_get)
    print("Ready to get agar parameters.")
    rospy.spin()

if __name__ == "__main__":
    agar_params_server()