;; Auto-generated. Do not edit!


(when (boundp 'agar_navigation::RobotStatusSrv)
  (if (not (find-package "AGAR_NAVIGATION"))
    (make-package "AGAR_NAVIGATION"))
  (shadow 'RobotStatusSrv (find-package "AGAR_NAVIGATION")))
(unless (find-package "AGAR_NAVIGATION::ROBOTSTATUSSRV")
  (make-package "AGAR_NAVIGATION::ROBOTSTATUSSRV"))
(unless (find-package "AGAR_NAVIGATION::ROBOTSTATUSSRVREQUEST")
  (make-package "AGAR_NAVIGATION::ROBOTSTATUSSRVREQUEST"))
(unless (find-package "AGAR_NAVIGATION::ROBOTSTATUSSRVRESPONSE")
  (make-package "AGAR_NAVIGATION::ROBOTSTATUSSRVRESPONSE"))

(in-package "ROS")





(defclass agar_navigation::RobotStatusSrvRequest
  :super ros::object
  :slots ())

(defmethod agar_navigation::RobotStatusSrvRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass agar_navigation::RobotStatusSrvResponse
  :super ros::object
  :slots (_auto_move _robot_speed _tenk_speed _imu_connected _imu_model_name ))

(defmethod agar_navigation::RobotStatusSrvResponse
  (:init
   (&key
    ((:auto_move __auto_move) nil)
    ((:robot_speed __robot_speed) 0)
    ((:tenk_speed __tenk_speed) 0)
    ((:imu_connected __imu_connected) nil)
    ((:imu_model_name __imu_model_name) "")
    )
   (send-super :init)
   (setq _auto_move __auto_move)
   (setq _robot_speed (round __robot_speed))
   (setq _tenk_speed (round __tenk_speed))
   (setq _imu_connected __imu_connected)
   (setq _imu_model_name (string __imu_model_name))
   self)
  (:auto_move
   (&optional (__auto_move :null))
   (if (not (eq __auto_move :null)) (setq _auto_move __auto_move)) _auto_move)
  (:robot_speed
   (&optional __robot_speed)
   (if __robot_speed (setq _robot_speed __robot_speed)) _robot_speed)
  (:tenk_speed
   (&optional __tenk_speed)
   (if __tenk_speed (setq _tenk_speed __tenk_speed)) _tenk_speed)
  (:imu_connected
   (&optional (__imu_connected :null))
   (if (not (eq __imu_connected :null)) (setq _imu_connected __imu_connected)) _imu_connected)
  (:imu_model_name
   (&optional __imu_model_name)
   (if __imu_model_name (setq _imu_model_name __imu_model_name)) _imu_model_name)
  (:serialization-length
   ()
   (+
    ;; bool _auto_move
    1
    ;; int16 _robot_speed
    2
    ;; int16 _tenk_speed
    2
    ;; bool _imu_connected
    1
    ;; string _imu_model_name
    4 (length _imu_model_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _auto_move
       (if _auto_move (write-byte -1 s) (write-byte 0 s))
     ;; int16 _robot_speed
       (write-word _robot_speed s)
     ;; int16 _tenk_speed
       (write-word _tenk_speed s)
     ;; bool _imu_connected
       (if _imu_connected (write-byte -1 s) (write-byte 0 s))
     ;; string _imu_model_name
       (write-long (length _imu_model_name) s) (princ _imu_model_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _auto_move
     (setq _auto_move (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int16 _robot_speed
     (setq _robot_speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _tenk_speed
     (setq _tenk_speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _imu_connected
     (setq _imu_connected (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _imu_model_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _imu_model_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass agar_navigation::RobotStatusSrv
  :super ros::object
  :slots ())

(setf (get agar_navigation::RobotStatusSrv :md5sum-) "a31bc4a504f5eb9e3c4b51e387fba977")
(setf (get agar_navigation::RobotStatusSrv :datatype-) "agar_navigation/RobotStatusSrv")
(setf (get agar_navigation::RobotStatusSrv :request) agar_navigation::RobotStatusSrvRequest)
(setf (get agar_navigation::RobotStatusSrv :response) agar_navigation::RobotStatusSrvResponse)

(defmethod agar_navigation::RobotStatusSrvRequest
  (:response () (instance agar_navigation::RobotStatusSrvResponse :init)))

(setf (get agar_navigation::RobotStatusSrvRequest :md5sum-) "a31bc4a504f5eb9e3c4b51e387fba977")
(setf (get agar_navigation::RobotStatusSrvRequest :datatype-) "agar_navigation/RobotStatusSrvRequest")
(setf (get agar_navigation::RobotStatusSrvRequest :definition-)
      "---
bool auto_move
int16 robot_speed
int16 tenk_speed
bool imu_connected
string imu_model_name

")

(setf (get agar_navigation::RobotStatusSrvResponse :md5sum-) "a31bc4a504f5eb9e3c4b51e387fba977")
(setf (get agar_navigation::RobotStatusSrvResponse :datatype-) "agar_navigation/RobotStatusSrvResponse")
(setf (get agar_navigation::RobotStatusSrvResponse :definition-)
      "---
bool auto_move
int16 robot_speed
int16 tenk_speed
bool imu_connected
string imu_model_name

")



(provide :agar_navigation/RobotStatusSrv "a31bc4a504f5eb9e3c4b51e387fba977")


