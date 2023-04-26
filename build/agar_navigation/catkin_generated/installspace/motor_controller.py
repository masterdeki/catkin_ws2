#!/usr/bin/env python3

import rospy
import math 
import time

from enum import Enum

from geometry_msgs.msg import Twist
from std_msgs.msg import Int32MultiArray
from std_msgs.msg import UInt64
from threading import Thread

from klsreader import klsreader
from motor_commands import motor_commands

from agar_navigation.msg import motor_status
from agar_navigation.msg import controller_status 
    
class Robot_DIR(Enum):
    FORWARD = 0
    BACKWARD = 1
    NEUTRAL = 2
    TENK_LEFT = 3
    TENK_RIGHT = 4
    LEFT = 5
    RIGHT = 6

if __name__ == '__main__':
    rospy.init_node('motor_controller')

    rate = rospy.Rate(60)
    cmd_x = 0
    cmd_z = 0

    actuator_control = False

    default_speed = 1024
    max_speed = 512
    tenk_speed = 512
    actuator_speed = 150    

    target_speed_x = 0
    target_speed_left = 0
    target_speed_right = 0

    current_speed_left = 0
    current_speed_right = 0

    robot_direction = Robot_DIR.NEUTRAL
    robot_turning = Robot_DIR.NEUTRAL

    left_wheels_direction = 0
    right_wheels_direction = 0    

    acceleration_speed = 50

    rpm_rr = 0
    rpm_limit = 0

    safe_brake_active = False


    motor_acceleration = False
    brake_wheels = False

    kls = klsreader()
    motor = motor_commands()

    def onshutdown_hook():
        motor.stop()
        print("on shutdown")

    rospy.on_shutdown(onshutdown_hook) 

    def calculate_speed_x():
        global target_speed_x
        global max_speed
        max_speed_param = rospy.get_param("/agar/robot_speed")
        max_speed = (max_speed_param / 100) * default_speed
        target_speed_x = abs(cmd_x) * max_speed
        
    def calculate_tenk_speed():
        global tenk_speed
        tenk_speed_param = rospy.get_param("/agar/tenk_speed")
        tenk_speed = (tenk_speed_param / 100) * default_speed
        #print("tenk speed", tenk_speed)  



    def run_acceleration_thread():
        global motor_acceleration

        global target_speed_left
        global target_speed_right

        global current_speed_left
        global current_speed_right

        global left_wheels_direction
        global right_wheels_direction

        #print("left_wheels_direction, right_wheels_direction", left_wheels_direction.value, right_wheels_direction.value)
        #print("Thread is running", motor_acceleration)

        while(True):
            if motor_acceleration == False:
                #print("breaking thread")
                break

            if current_speed_left == target_speed_left and current_speed_right == target_speed_right:
                #print("breaking thread")
                break

            #print("Accelerate")
            
            if current_speed_left < target_speed_left:
                if current_speed_left < 0:
                    current_speed_left = 0
                else:
                    current_speed_left += acceleration_speed
            else:
                current_speed_left = target_speed_left

            if current_speed_right < target_speed_right:
                if current_speed_right < 0:
                    current_speed_right = 0
                else:
                    current_speed_right += acceleration_speed
            else:
                current_speed_right = target_speed_right

            motor.move_side(current_speed_left, left_wheels_direction.value, current_speed_right, right_wheels_direction.value)
            time.sleep(0.1)
    thread = Thread(target = run_acceleration_thread)

    def brake_left_thread():
        global robot_direction
        global brake_wheels
        global rpm_rl

        while(True):
            if brake_wheels == False:
                #print("breaking thread")
                motor.remove_brakes()
                break

            if rpm_rl > 400:
                motor.brake(False, False, True, False)
            else:
                motor.remove_brakes()
    thread_brake_left = Thread(target = brake_left_thread)

    def brake_right_thread():
        global robot_direction
        global brake_wheels
        global rpm_rr

        while(True):
            if brake_wheels == False:
                #print("breaking thread")
                motor.remove_brakes()
                break

            #print("rpm_rr", rpm_rr)

            if rpm_rr > 400:
                motor.brake(False, False, False, True)
            else:
                motor.remove_brakes()
    thread_brake_right = Thread(target = brake_right_thread)



    def brake_robot(msg):
        print("msg", msg)
        global safe_brake_active

        if msg.data == 1:
            rospy.set_param("agar/brake_enabled", True)
            safe_brake_active = True
            motor.stop()
            motor.brake_all()
            #motor.remove_brakes()
        else: 
            rospy.set_param("agar/brake_enabled", False)
            safe_brake_active = False
            motor.remove_brakes()
    rospy.Subscriber("/brake_status", UInt64, brake_robot, queue_size=1) 

    
    def move_actuators(msg):
        global actuator_control
        actuator_control = True
        #print(msg)

        is_any_active = False

        fl_speed = actuator_speed
        fr_speed = actuator_speed
        rl_speed = actuator_speed
        rr_speed = actuator_speed

        fl_dir = Robot_DIR.NEUTRAL
        fr_dir = Robot_DIR.NEUTRAL
        rl_dir = Robot_DIR.NEUTRAL
        rr_dir = Robot_DIR.NEUTRAL

        if msg.data[0] == 1:
            is_any_active = True
            fl_dir = Robot_DIR.FORWARD
        elif msg.data[0] == -1:
            is_any_active = True
            fl_dir = Robot_DIR.BACKWARD
        else:
            fl_speed = 0

        if msg.data[1] == 1:
            is_any_active = True
            fr_dir = Robot_DIR.FORWARD
        elif msg.data[1] == -1:
            is_any_active = True
            fr_dir = Robot_DIR.BACKWARD
        else:
            fr_speed = 0

        if msg.data[2] == 1:
            is_any_active = True
            rl_dir = Robot_DIR.BACKWARD
        elif msg.data[2] == -1:
            is_any_active = True
            rl_dir = Robot_DIR.FORWARD
        else:
            rl_speed = 0

        if msg.data[3] == 1:
            is_any_active = True
            rr_dir = Robot_DIR.BACKWARD
        elif msg.data[3] == -1:
            is_any_active = True
            rr_dir = Robot_DIR.FORWARD
        else:
            rr_speed = 0

        #command = "sudo ~/workspace/motor_controller/./motor_controller {0} {1} {2} {3} {4} {5} {6} {7}".format(fl_speed, fl_dir, fr_speed, fr_dir, rl_speed, rl_dir, rr_speed, rr_dir)

        motor.move(fl_speed, fl_dir.value, fr_speed, fr_dir.value, rl_speed, rl_dir.value, rr_speed, rr_dir.value)


        if is_any_active == False:
            actuator_control = False
    rospy.Subscriber("/actuators", Int32MultiArray, move_actuators, queue_size=1) 




    def dir_stop():
        global motor_acceleration
        global brake_wheels
        global current_speed_left
        global current_speed_right
        global robot_direction

        motor_acceleration = False
        brake_wheels = False
        robot_direction = Robot_DIR.NEUTRAL
        current_speed_left = current_speed_right = 0
        motor.brake_all()
        motor.stop()
        time.sleep(0.3)
        motor.remove_brakes()

    def move_frw_bck():
        #print("napred nazad")

        global cmd_x

        global thread
        global target_speed_x
        global robot_direction  
        global motor_acceleration
        global brake_wheels

        global target_speed_left
        global target_speed_right

        global left_wheels_direction
        global right_wheels_direction

        brake_wheels = False
        
        #print('target_speed_x', target_speed_x)
        #print('robot_direction', robot_direction)

        target_speed_left = target_speed_right = target_speed_x

        if cmd_x > 0:
            if robot_direction != Robot_DIR.FORWARD:
                dir_stop()

            robot_direction = Robot_DIR.FORWARD
            left_wheels_direction = right_wheels_direction = Robot_DIR.FORWARD
        else:
            if robot_direction != Robot_DIR.BACKWARD:
                dir_stop()
                

            robot_direction = Robot_DIR.BACKWARD
            left_wheels_direction = right_wheels_direction = Robot_DIR.BACKWARD

        motor_acceleration = True

        if thread == None or thread.is_alive() == False:
            #print("run thread")
            thread = Thread(target = run_acceleration_thread)
            thread.start()

    def move_tenk(tenk_direction):

        global thread
        global robot_direction
        global motor_acceleration
        global brake_wheels

        global target_speed_left
        global target_speed_right

        global left_wheels_direction
        global right_wheels_direction

        brake_wheels = False

        if robot_direction != tenk_direction:
            dir_stop()

        target_speed_left = target_speed_right = tenk_speed

        if tenk_direction == Robot_DIR.TENK_LEFT:
            left_wheels_direction = Robot_DIR.BACKWARD
            right_wheels_direction = Robot_DIR.FORWARD
            robot_direction = Robot_DIR.TENK_LEFT
        else:
            left_wheels_direction = Robot_DIR.FORWARD
            right_wheels_direction = Robot_DIR.BACKWARD
            robot_direction = Robot_DIR.TENK_RIGHT

        motor_acceleration = True

        if thread == None or thread.is_alive() == False:
            #print("run thread")
            thread = Thread(target = run_acceleration_thread)
            thread.start()

    def move_left():
        global cmd_x

        global thread
        global thread_brake_left

        global target_speed_x
        global robot_direction  
        global motor_acceleration
        global brake_wheels

        global target_speed_left
        global target_speed_right

        global left_wheels_direction
        global right_wheels_direction

        joy_angle = (math.atan2(abs(cmd_x), abs(cmd_z)) * 180) / math.pi

        target_speed_right = max_speed

        wheel_proportion = 0.5

        target_speed_left = max_speed * wheel_proportion

        if target_speed_left < 0:
            target_speed_left = 0
        if target_speed_right < 0:
            target_speed_right = 0

        if cmd_x > 0:
            if robot_direction != Robot_DIR.FORWARD:
                dir_stop()

            robot_direction = Robot_DIR.FORWARD
            left_wheels_direction = right_wheels_direction = Robot_DIR.FORWARD
        else:
            if robot_direction != Robot_DIR.BACKWARD:
                dir_stop()

            robot_direction = Robot_DIR.BACKWARD
            left_wheels_direction = right_wheels_direction = Robot_DIR.BACKWARD

        motor_acceleration = True
        brake_wheels = True

        if joy_angle >= 55 and joy_angle < 90:
            brake_wheels = False

        if (thread_brake_left == None or thread_brake_left.is_alive() == False) and brake_wheels == True:
            thread_brake_left = Thread(target = brake_left_thread)
            thread_brake_left.start()


        if thread == None or thread.is_alive() == False:
            thread = Thread(target = run_acceleration_thread)
            thread.start()

    def move_right():
        global cmd_x

        global thread
        global thread_brake_right

        global target_speed_x
        global robot_direction  
        global motor_acceleration
        global brake_wheels

        global target_speed_left
        global target_speed_right

        global left_wheels_direction
        global right_wheels_direction

        joy_angle = (math.atan2(abs(cmd_x), abs(cmd_z)) * 180) / math.pi
        #print("joy_angle", joy_angle)

        target_speed_left = max_speed

        #wheel_proportion = 1
        # if joy_angle >= 67.5 and joy_angle < 90:
        #     wheel_proportion = 0.8
        # elif joy_angle >= 45 and joy_angle < 67.5:
        #     wheel_proportion = 0.6
        # elif joy_angle >= 22.5 and joy_angle < 45:
        #     wheel_proportion = 0.4
        # else:
        wheel_proportion = 0.5

        target_speed_right = max_speed * wheel_proportion

        if target_speed_left < 0:
            target_speed_left = 0
        if target_speed_right < 0:
            target_speed_right = 0

        if cmd_x > 0:
            if robot_direction != Robot_DIR.FORWARD:
                dir_stop()

            robot_direction = Robot_DIR.FORWARD
            left_wheels_direction = right_wheels_direction = Robot_DIR.FORWARD
        else:
            if robot_direction != Robot_DIR.BACKWARD:
                dir_stop()

            robot_direction = Robot_DIR.BACKWARD
            left_wheels_direction = right_wheels_direction = Robot_DIR.BACKWARD

        motor_acceleration = True
        brake_wheels = True

        if joy_angle >= 55 and joy_angle < 90:
            brake_wheels = False
    
        if (thread_brake_right == None or thread_brake_right.is_alive() == False) and brake_wheels == True:
            thread_brake_right = Thread(target = brake_right_thread)
            thread_brake_right.start()


        if thread == None or thread.is_alive() == False:
            thread = Thread(target = run_acceleration_thread)
            thread.start()


    def move_robot(msg):
        global actuator_control
        if actuator_control == True:
            return

        global safe_brake_active
        if safe_brake_active == True:
            return

        global motor_acceleration
        global current_speed_left
        global current_speed_right

        global cmd_x
        global cmd_z
        
        cmd_x = msg.linear.x
        cmd_z = msg.angular.z

        #print("cmd_x, cmd_z", cmd_x, cmd_z)

        calculate_speed_x()
        calculate_tenk_speed()

        motor.remove_brakes()

        if cmd_x == 0 and cmd_z == 0:
            #print('stop motor')
            motor_acceleration = False
            current_speed_left = 0
            current_speed_right = 0
            motor.stop()

        elif cmd_x == 0 and cmd_z > 0:
            #print("Tenk left")
            move_tenk(Robot_DIR.TENK_LEFT)

        elif cmd_x == 0 and cmd_z < 0:
            #print("Tenk right")
            move_tenk(Robot_DIR.TENK_RIGHT)

        elif cmd_x != 0 and cmd_z > 0:
            #print("Go left")
            move_left()

        elif cmd_x != 0 and cmd_z < 0:
            #print("Go right")
            move_right()

        elif cmd_x != 0 and cmd_z == 0:
            #print("Forward/Backward")
            move_frw_bck()

        else:
            dir_stop()





    rospy.Subscriber("/cmd_vel", Twist, move_robot)
    print("Motor controller started")


    motor_status_pub = rospy.Publisher('/motor_status', motor_status, queue_size=1)    
    def publish_motor_status(data):
        #print(data_rr)

        cont_rl = controller_status()
        cont_rl.rpm = data["rear_left"]["rpm"]
        cont_rl.phaseCurrent = data["rear_left"]["phaseCurrent"]
        cont_rl.batteryVoltage = data["rear_left"]["batteryVoltage"]
        cont_rl.controllerTemp = data["rear_left"]["controllerTemp"]
        cont_rl.reverse = data["rear_left"]["reverse"]
        cont_rl.brakePedal = data["rear_left"]["brakePedal"]
        cont_rl.brakeSwitch = data["rear_left"]["brakeSwitch"]
        cont_rl.footSwitch = data["rear_left"]["footSwitch"]

        cont_rr = controller_status()
        cont_rr.rpm = data["rear_right"]["rpm"]
        cont_rr.phaseCurrent = data["rear_right"]["phaseCurrent"]
        cont_rr.batteryVoltage = data["rear_right"]["batteryVoltage"]
        cont_rr.controllerTemp = data["rear_right"]["controllerTemp"]
        cont_rr.reverse = data["rear_right"]["reverse"]
        cont_rr.brakePedal = data["rear_right"]["brakePedal"]
        cont_rr.brakeSwitch = data["rear_right"]["brakeSwitch"]
        cont_rr.footSwitch = data["rear_right"]["footSwitch"]


        mtr_status = motor_status()
        mtr_status.motor_rl = cont_rl
        mtr_status.motor_rr = cont_rr

        motor_status_pub.publish(mtr_status)

    #motor.move(512, 0)

    def set_brake_status(brake_status):
        msg = UInt64()
        msg.data = 0
        if brake_status == True:
            msg.data = 1

        brake_robot(msg)


    while not rospy.is_shutdown():

        try:
            
            brake_enabled = rospy.get_param("agar/brake_enabled", True)
            if brake_enabled == True and safe_brake_active == False:
                safe_brake_active = True
                set_brake_status(True)

            elif brake_enabled == False and safe_brake_active == True:
                safe_brake_active = False
                set_brake_status(False)



            motor_data = kls.get_motor_status()
            publish_motor_status(motor_data)

            #print('motor_data', motor_data)


            # data_rr = kls.get_right_motor_status()
            # print(data_rr)

            # publish_motor_status(data_rr)

            #print("data", data)
            rpm_rl = motor_data["rear_left"]["rpm"]
            rpm_rr = motor_data["rear_right"]["rpm"]

            # if rpm_rr != 0:
            #     print("RPM:", rpm_rr)
        except:
            print('RPM Cannot be read')

        if rospy.is_shutdown():
            break


    motor.stop()
    print('Node motor_controller stopped')
