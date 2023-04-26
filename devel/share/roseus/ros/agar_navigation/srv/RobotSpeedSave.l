;; Auto-generated. Do not edit!


(when (boundp 'agar_navigation::RobotSpeedSave)
  (if (not (find-package "AGAR_NAVIGATION"))
    (make-package "AGAR_NAVIGATION"))
  (shadow 'RobotSpeedSave (find-package "AGAR_NAVIGATION")))
(unless (find-package "AGAR_NAVIGATION::ROBOTSPEEDSAVE")
  (make-package "AGAR_NAVIGATION::ROBOTSPEEDSAVE"))
(unless (find-package "AGAR_NAVIGATION::ROBOTSPEEDSAVEREQUEST")
  (make-package "AGAR_NAVIGATION::ROBOTSPEEDSAVEREQUEST"))
(unless (find-package "AGAR_NAVIGATION::ROBOTSPEEDSAVERESPONSE")
  (make-package "AGAR_NAVIGATION::ROBOTSPEEDSAVERESPONSE"))

(in-package "ROS")





(defclass agar_navigation::RobotSpeedSaveRequest
  :super ros::object
  :slots (_speed _tenk_speed ))

(defmethod agar_navigation::RobotSpeedSaveRequest
  (:init
   (&key
    ((:speed __speed) 0)
    ((:tenk_speed __tenk_speed) 0)
    )
   (send-super :init)
   (setq _speed (round __speed))
   (setq _tenk_speed (round __tenk_speed))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:tenk_speed
   (&optional __tenk_speed)
   (if __tenk_speed (setq _tenk_speed __tenk_speed)) _tenk_speed)
  (:serialization-length
   ()
   (+
    ;; int16 _speed
    2
    ;; int16 _tenk_speed
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _speed
       (write-word _speed s)
     ;; int16 _tenk_speed
       (write-word _tenk_speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _speed
     (setq _speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _tenk_speed
     (setq _tenk_speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass agar_navigation::RobotSpeedSaveResponse
  :super ros::object
  :slots (_saved ))

(defmethod agar_navigation::RobotSpeedSaveResponse
  (:init
   (&key
    ((:saved __saved) nil)
    )
   (send-super :init)
   (setq _saved __saved)
   self)
  (:saved
   (&optional (__saved :null))
   (if (not (eq __saved :null)) (setq _saved __saved)) _saved)
  (:serialization-length
   ()
   (+
    ;; bool _saved
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _saved
       (if _saved (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _saved
     (setq _saved (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass agar_navigation::RobotSpeedSave
  :super ros::object
  :slots ())

(setf (get agar_navigation::RobotSpeedSave :md5sum-) "eaee30a82966f2d54c874e2a0ce23a9b")
(setf (get agar_navigation::RobotSpeedSave :datatype-) "agar_navigation/RobotSpeedSave")
(setf (get agar_navigation::RobotSpeedSave :request) agar_navigation::RobotSpeedSaveRequest)
(setf (get agar_navigation::RobotSpeedSave :response) agar_navigation::RobotSpeedSaveResponse)

(defmethod agar_navigation::RobotSpeedSaveRequest
  (:response () (instance agar_navigation::RobotSpeedSaveResponse :init)))

(setf (get agar_navigation::RobotSpeedSaveRequest :md5sum-) "eaee30a82966f2d54c874e2a0ce23a9b")
(setf (get agar_navigation::RobotSpeedSaveRequest :datatype-) "agar_navigation/RobotSpeedSaveRequest")
(setf (get agar_navigation::RobotSpeedSaveRequest :definition-)
      "int16 speed
int16 tenk_speed
---
bool saved
")

(setf (get agar_navigation::RobotSpeedSaveResponse :md5sum-) "eaee30a82966f2d54c874e2a0ce23a9b")
(setf (get agar_navigation::RobotSpeedSaveResponse :datatype-) "agar_navigation/RobotSpeedSaveResponse")
(setf (get agar_navigation::RobotSpeedSaveResponse :definition-)
      "int16 speed
int16 tenk_speed
---
bool saved
")



(provide :agar_navigation/RobotSpeedSave "eaee30a82966f2d54c874e2a0ce23a9b")


