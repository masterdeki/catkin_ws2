;; Auto-generated. Do not edit!


(when (boundp 'agar_navigation::AgarParams)
  (if (not (find-package "AGAR_NAVIGATION"))
    (make-package "AGAR_NAVIGATION"))
  (shadow 'AgarParams (find-package "AGAR_NAVIGATION")))
(unless (find-package "AGAR_NAVIGATION::AGARPARAMS")
  (make-package "AGAR_NAVIGATION::AGARPARAMS"))
(unless (find-package "AGAR_NAVIGATION::AGARPARAMSREQUEST")
  (make-package "AGAR_NAVIGATION::AGARPARAMSREQUEST"))
(unless (find-package "AGAR_NAVIGATION::AGARPARAMSRESPONSE")
  (make-package "AGAR_NAVIGATION::AGARPARAMSRESPONSE"))

(in-package "ROS")





(defclass agar_navigation::AgarParamsRequest
  :super ros::object
  :slots ())

(defmethod agar_navigation::AgarParamsRequest
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

(defclass agar_navigation::AgarParamsResponse
  :super ros::object
  :slots (_auto_move _brake_enabled _robot_speed _tenk_speed ))

(defmethod agar_navigation::AgarParamsResponse
  (:init
   (&key
    ((:auto_move __auto_move) nil)
    ((:brake_enabled __brake_enabled) nil)
    ((:robot_speed __robot_speed) 0)
    ((:tenk_speed __tenk_speed) 0)
    )
   (send-super :init)
   (setq _auto_move __auto_move)
   (setq _brake_enabled __brake_enabled)
   (setq _robot_speed (round __robot_speed))
   (setq _tenk_speed (round __tenk_speed))
   self)
  (:auto_move
   (&optional (__auto_move :null))
   (if (not (eq __auto_move :null)) (setq _auto_move __auto_move)) _auto_move)
  (:brake_enabled
   (&optional (__brake_enabled :null))
   (if (not (eq __brake_enabled :null)) (setq _brake_enabled __brake_enabled)) _brake_enabled)
  (:robot_speed
   (&optional __robot_speed)
   (if __robot_speed (setq _robot_speed __robot_speed)) _robot_speed)
  (:tenk_speed
   (&optional __tenk_speed)
   (if __tenk_speed (setq _tenk_speed __tenk_speed)) _tenk_speed)
  (:serialization-length
   ()
   (+
    ;; bool _auto_move
    1
    ;; bool _brake_enabled
    1
    ;; int16 _robot_speed
    2
    ;; int16 _tenk_speed
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _auto_move
       (if _auto_move (write-byte -1 s) (write-byte 0 s))
     ;; bool _brake_enabled
       (if _brake_enabled (write-byte -1 s) (write-byte 0 s))
     ;; int16 _robot_speed
       (write-word _robot_speed s)
     ;; int16 _tenk_speed
       (write-word _tenk_speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _auto_move
     (setq _auto_move (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _brake_enabled
     (setq _brake_enabled (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int16 _robot_speed
     (setq _robot_speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _tenk_speed
     (setq _tenk_speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass agar_navigation::AgarParams
  :super ros::object
  :slots ())

(setf (get agar_navigation::AgarParams :md5sum-) "2712b85560068525cea20886d2f2a6ea")
(setf (get agar_navigation::AgarParams :datatype-) "agar_navigation/AgarParams")
(setf (get agar_navigation::AgarParams :request) agar_navigation::AgarParamsRequest)
(setf (get agar_navigation::AgarParams :response) agar_navigation::AgarParamsResponse)

(defmethod agar_navigation::AgarParamsRequest
  (:response () (instance agar_navigation::AgarParamsResponse :init)))

(setf (get agar_navigation::AgarParamsRequest :md5sum-) "2712b85560068525cea20886d2f2a6ea")
(setf (get agar_navigation::AgarParamsRequest :datatype-) "agar_navigation/AgarParamsRequest")
(setf (get agar_navigation::AgarParamsRequest :definition-)
      "---
bool auto_move
bool brake_enabled
int16 robot_speed
int16 tenk_speed
")

(setf (get agar_navigation::AgarParamsResponse :md5sum-) "2712b85560068525cea20886d2f2a6ea")
(setf (get agar_navigation::AgarParamsResponse :datatype-) "agar_navigation/AgarParamsResponse")
(setf (get agar_navigation::AgarParamsResponse :definition-)
      "---
bool auto_move
bool brake_enabled
int16 robot_speed
int16 tenk_speed
")



(provide :agar_navigation/AgarParams "2712b85560068525cea20886d2f2a6ea")


