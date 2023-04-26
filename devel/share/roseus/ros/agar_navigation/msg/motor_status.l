;; Auto-generated. Do not edit!


(when (boundp 'agar_navigation::motor_status)
  (if (not (find-package "AGAR_NAVIGATION"))
    (make-package "AGAR_NAVIGATION"))
  (shadow 'motor_status (find-package "AGAR_NAVIGATION")))
(unless (find-package "AGAR_NAVIGATION::MOTOR_STATUS")
  (make-package "AGAR_NAVIGATION::MOTOR_STATUS"))

(in-package "ROS")
;;//! \htmlinclude motor_status.msg.html


(defclass agar_navigation::motor_status
  :super ros::object
  :slots (_motor_fl _motor_rl _motor_fr _motor_rr ))

(defmethod agar_navigation::motor_status
  (:init
   (&key
    ((:motor_fl __motor_fl) (instance agar_navigation::controller_status :init))
    ((:motor_rl __motor_rl) (instance agar_navigation::controller_status :init))
    ((:motor_fr __motor_fr) (instance agar_navigation::controller_status :init))
    ((:motor_rr __motor_rr) (instance agar_navigation::controller_status :init))
    )
   (send-super :init)
   (setq _motor_fl __motor_fl)
   (setq _motor_rl __motor_rl)
   (setq _motor_fr __motor_fr)
   (setq _motor_rr __motor_rr)
   self)
  (:motor_fl
   (&rest __motor_fl)
   (if (keywordp (car __motor_fl))
       (send* _motor_fl __motor_fl)
     (progn
       (if __motor_fl (setq _motor_fl (car __motor_fl)))
       _motor_fl)))
  (:motor_rl
   (&rest __motor_rl)
   (if (keywordp (car __motor_rl))
       (send* _motor_rl __motor_rl)
     (progn
       (if __motor_rl (setq _motor_rl (car __motor_rl)))
       _motor_rl)))
  (:motor_fr
   (&rest __motor_fr)
   (if (keywordp (car __motor_fr))
       (send* _motor_fr __motor_fr)
     (progn
       (if __motor_fr (setq _motor_fr (car __motor_fr)))
       _motor_fr)))
  (:motor_rr
   (&rest __motor_rr)
   (if (keywordp (car __motor_rr))
       (send* _motor_rr __motor_rr)
     (progn
       (if __motor_rr (setq _motor_rr (car __motor_rr)))
       _motor_rr)))
  (:serialization-length
   ()
   (+
    ;; agar_navigation/controller_status _motor_fl
    (send _motor_fl :serialization-length)
    ;; agar_navigation/controller_status _motor_rl
    (send _motor_rl :serialization-length)
    ;; agar_navigation/controller_status _motor_fr
    (send _motor_fr :serialization-length)
    ;; agar_navigation/controller_status _motor_rr
    (send _motor_rr :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; agar_navigation/controller_status _motor_fl
       (send _motor_fl :serialize s)
     ;; agar_navigation/controller_status _motor_rl
       (send _motor_rl :serialize s)
     ;; agar_navigation/controller_status _motor_fr
       (send _motor_fr :serialize s)
     ;; agar_navigation/controller_status _motor_rr
       (send _motor_rr :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; agar_navigation/controller_status _motor_fl
     (send _motor_fl :deserialize buf ptr-) (incf ptr- (send _motor_fl :serialization-length))
   ;; agar_navigation/controller_status _motor_rl
     (send _motor_rl :deserialize buf ptr-) (incf ptr- (send _motor_rl :serialization-length))
   ;; agar_navigation/controller_status _motor_fr
     (send _motor_fr :deserialize buf ptr-) (incf ptr- (send _motor_fr :serialization-length))
   ;; agar_navigation/controller_status _motor_rr
     (send _motor_rr :deserialize buf ptr-) (incf ptr- (send _motor_rr :serialization-length))
   ;;
   self)
  )

(setf (get agar_navigation::motor_status :md5sum-) "08247c79e285da734d9f769281d95300")
(setf (get agar_navigation::motor_status :datatype-) "agar_navigation/motor_status")
(setf (get agar_navigation::motor_status :definition-)
      "controller_status motor_fl
controller_status motor_rl
controller_status motor_fr
controller_status motor_rr
================================================================================
MSG: agar_navigation/controller_status
uint16 rpm
uint16 phaseCurrent
uint8 batteryVoltage
uint8 controllerTemp
bool reverse
uint8 brakePedal
uint8 brakeSwitch
uint8 footSwitch
")



(provide :agar_navigation/motor_status "08247c79e285da734d9f769281d95300")


