;; Auto-generated. Do not edit!


(when (boundp 'agar_navigation::controller_status)
  (if (not (find-package "AGAR_NAVIGATION"))
    (make-package "AGAR_NAVIGATION"))
  (shadow 'controller_status (find-package "AGAR_NAVIGATION")))
(unless (find-package "AGAR_NAVIGATION::CONTROLLER_STATUS")
  (make-package "AGAR_NAVIGATION::CONTROLLER_STATUS"))

(in-package "ROS")
;;//! \htmlinclude controller_status.msg.html


(defclass agar_navigation::controller_status
  :super ros::object
  :slots (_rpm _phaseCurrent _batteryVoltage _controllerTemp _reverse _brakePedal _brakeSwitch _footSwitch ))

(defmethod agar_navigation::controller_status
  (:init
   (&key
    ((:rpm __rpm) 0)
    ((:phaseCurrent __phaseCurrent) 0)
    ((:batteryVoltage __batteryVoltage) 0)
    ((:controllerTemp __controllerTemp) 0)
    ((:reverse __reverse) nil)
    ((:brakePedal __brakePedal) 0)
    ((:brakeSwitch __brakeSwitch) 0)
    ((:footSwitch __footSwitch) 0)
    )
   (send-super :init)
   (setq _rpm (round __rpm))
   (setq _phaseCurrent (round __phaseCurrent))
   (setq _batteryVoltage (round __batteryVoltage))
   (setq _controllerTemp (round __controllerTemp))
   (setq _reverse __reverse)
   (setq _brakePedal (round __brakePedal))
   (setq _brakeSwitch (round __brakeSwitch))
   (setq _footSwitch (round __footSwitch))
   self)
  (:rpm
   (&optional __rpm)
   (if __rpm (setq _rpm __rpm)) _rpm)
  (:phaseCurrent
   (&optional __phaseCurrent)
   (if __phaseCurrent (setq _phaseCurrent __phaseCurrent)) _phaseCurrent)
  (:batteryVoltage
   (&optional __batteryVoltage)
   (if __batteryVoltage (setq _batteryVoltage __batteryVoltage)) _batteryVoltage)
  (:controllerTemp
   (&optional __controllerTemp)
   (if __controllerTemp (setq _controllerTemp __controllerTemp)) _controllerTemp)
  (:reverse
   (&optional (__reverse :null))
   (if (not (eq __reverse :null)) (setq _reverse __reverse)) _reverse)
  (:brakePedal
   (&optional __brakePedal)
   (if __brakePedal (setq _brakePedal __brakePedal)) _brakePedal)
  (:brakeSwitch
   (&optional __brakeSwitch)
   (if __brakeSwitch (setq _brakeSwitch __brakeSwitch)) _brakeSwitch)
  (:footSwitch
   (&optional __footSwitch)
   (if __footSwitch (setq _footSwitch __footSwitch)) _footSwitch)
  (:serialization-length
   ()
   (+
    ;; uint16 _rpm
    2
    ;; uint16 _phaseCurrent
    2
    ;; uint8 _batteryVoltage
    1
    ;; uint8 _controllerTemp
    1
    ;; bool _reverse
    1
    ;; uint8 _brakePedal
    1
    ;; uint8 _brakeSwitch
    1
    ;; uint8 _footSwitch
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _rpm
       (write-word _rpm s)
     ;; uint16 _phaseCurrent
       (write-word _phaseCurrent s)
     ;; uint8 _batteryVoltage
       (write-byte _batteryVoltage s)
     ;; uint8 _controllerTemp
       (write-byte _controllerTemp s)
     ;; bool _reverse
       (if _reverse (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _brakePedal
       (write-byte _brakePedal s)
     ;; uint8 _brakeSwitch
       (write-byte _brakeSwitch s)
     ;; uint8 _footSwitch
       (write-byte _footSwitch s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _rpm
     (setq _rpm (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _phaseCurrent
     (setq _phaseCurrent (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _batteryVoltage
     (setq _batteryVoltage (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _controllerTemp
     (setq _controllerTemp (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _reverse
     (setq _reverse (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _brakePedal
     (setq _brakePedal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _brakeSwitch
     (setq _brakeSwitch (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _footSwitch
     (setq _footSwitch (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get agar_navigation::controller_status :md5sum-) "f2b5f9baff5f33fa53ee6143b7658a03")
(setf (get agar_navigation::controller_status :datatype-) "agar_navigation/controller_status")
(setf (get agar_navigation::controller_status :definition-)
      "uint16 rpm
uint16 phaseCurrent
uint8 batteryVoltage
uint8 controllerTemp
bool reverse
uint8 brakePedal
uint8 brakeSwitch
uint8 footSwitch
")



(provide :agar_navigation/controller_status "f2b5f9baff5f33fa53ee6143b7658a03")


