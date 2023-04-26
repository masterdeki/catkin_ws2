#!/usr/bin/env python

from xmlrpc.client import boolean
import rospy

from agar_navigation.srv import AutoMoveSave, AutoMoveSaveResponse


def handle_save(req):
    #print("Param received", req.auto_move, type(req.auto_move))

    saved = False
    try:
        rospy.set_param('agar/auto_move', req.auto_move)
        saved = True
    except rospy.ROSException as e:
        rospy.logerr(e)

    return AutoMoveSaveResponse(saved)

def auto_move_save_server():
    rospy.init_node('auto_move_save_server')
    s = rospy.Service('auto_move_save_server', AutoMoveSave, handle_save)
    print("Ready to set auto_move param.")
    rospy.spin()

if __name__ == "__main__":
    auto_move_save_server()