#!/usr/bin/env python3

import rospy

from sensor_msgs.msg import BatteryState
from std_msgs.msg import Header

from dalybms import DalyBMS as DalyBMSDriver

bms_port = "/dev/ttyUSB-BATTERY"  

if __name__ == '__main__':
    rospy.init_node('battery_controller')

    rate = rospy.Rate(60)


    daly_bms = DalyBMSDriver()
    daly_bms.connect(bms_port)  

    battery_pub = rospy.Publisher('/battery_state', BatteryState, queue_size=1) 

    while(True):
        try:
            soc_data = daly_bms.get_soc()
            #cell_voltage_range = daly_bms.get_cell_voltage_range()
            temperature_range = daly_bms.get_temperature_range()
            mosfet_status = daly_bms.get_mosfet_status()
            #status = daly_bms.get_status()
            #cells_voltages = daly_bms.get_cell_voltages()
            #temperatures = daly_bms.get_temperatures()
            # balancing_status = daly_bms.get_balancing_status()
            # errors = daly_bms.get_errors()

            # data = {
            #     "soc": soc_data,
            #     "cell_voltage_range": cell_voltage_range,
            #     "temperature_range": temperature_range,
            #     "mosfet_status": mosfet_status,
            #     "status": status,
            #     "cells_data": cells_voltages,
            #     "temperatures": temperatures,
            #     # "balancing_status": balancing_status,
            #     # "errors": errors
            # }

            header = Header()
            header.stamp = rospy.Time.now()
            header.frame_id = "battery_controller"

            msg = BatteryState()
            msg.header = header
            msg.voltage = soc_data["total_voltage"]
            msg.temperature = temperature_range["highest_temperature"]
            msg.current = soc_data["current"]
            msg.capacity = mosfet_status["capacity_ah"]
            msg.percentage = soc_data["soc_percent"]

            battery_pub.publish(msg)

        except:
            print("error") 


        rate.sleep()