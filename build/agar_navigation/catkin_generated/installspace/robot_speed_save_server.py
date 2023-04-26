#!/usr/bin/env python3

from xmlrpc.client import boolean
import rospy

from agar_navigation.srv import RobotSpeedSave, RobotSpeedSaveResponse

def handle_save(req):
    #print("Param received", req.speed, req.tenk_speed)

    saved = False
    try:
        rospy.set_param('agar/robot_speed', req.speed)
        rospy.set_param('agar/tenk_speed', req.tenk_speed)

        saved = True
    except rospy.ROSException as e:
        rospy.logerr(e)

    return RobotSpeedSaveResponse(saved)

def auto_move_save_server():
    rospy.init_node('robot_speed_save_server')
    s = rospy.Service('robot_speed_save_server', RobotSpeedSave, handle_save)

    print("Ready to set speed params.")
    rospy.spin()

if __name__ == "__main__":
    auto_move_save_server()