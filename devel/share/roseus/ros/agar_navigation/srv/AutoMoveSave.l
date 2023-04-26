;; Auto-generated. Do not edit!


(when (boundp 'agar_navigation::AutoMoveSave)
  (if (not (find-package "AGAR_NAVIGATION"))
    (make-package "AGAR_NAVIGATION"))
  (shadow 'AutoMoveSave (find-package "AGAR_NAVIGATION")))
(unless (find-package "AGAR_NAVIGATION::AUTOMOVESAVE")
  (make-package "AGAR_NAVIGATION::AUTOMOVESAVE"))
(unless (find-package "AGAR_NAVIGATION::AUTOMOVESAVEREQUEST")
  (make-package "AGAR_NAVIGATION::AUTOMOVESAVEREQUEST"))
(unless (find-package "AGAR_NAVIGATION::AUTOMOVESAVERESPONSE")
  (make-package "AGAR_NAVIGATION::AUTOMOVESAVERESPONSE"))

(in-package "ROS")





(defclass agar_navigation::AutoMoveSaveRequest
  :super ros::object
  :slots (_auto_move ))

(defmethod agar_navigation::AutoMoveSaveRequest
  (:init
   (&key
    ((:auto_move __auto_move) nil)
    )
   (send-super :init)
   (setq _auto_move __auto_move)
   self)
  (:auto_move
   (&optional (__auto_move :null))
   (if (not (eq __auto_move :null)) (setq _auto_move __auto_move)) _auto_move)
  (:serialization-length
   ()
   (+
    ;; bool _auto_move
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _auto_move
       (if _auto_move (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _auto_move
     (setq _auto_move (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass agar_navigation::AutoMoveSaveResponse
  :super ros::object
  :slots (_saved ))

(defmethod agar_navigation::AutoMoveSaveResponse
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

(defclass agar_navigation::AutoMoveSave
  :super ros::object
  :slots ())

(setf (get agar_navigation::AutoMoveSave :md5sum-) "5dc6c5051ad0aa936a5e0abddfc5f32e")
(setf (get agar_navigation::AutoMoveSave :datatype-) "agar_navigation/AutoMoveSave")
(setf (get agar_navigation::AutoMoveSave :request) agar_navigation::AutoMoveSaveRequest)
(setf (get agar_navigation::AutoMoveSave :response) agar_navigation::AutoMoveSaveResponse)

(defmethod agar_navigation::AutoMoveSaveRequest
  (:response () (instance agar_navigation::AutoMoveSaveResponse :init)))

(setf (get agar_navigation::AutoMoveSaveRequest :md5sum-) "5dc6c5051ad0aa936a5e0abddfc5f32e")
(setf (get agar_navigation::AutoMoveSaveRequest :datatype-) "agar_navigation/AutoMoveSaveRequest")
(setf (get agar_navigation::AutoMoveSaveRequest :definition-)
      "bool auto_move
---
bool saved
")

(setf (get agar_navigation::AutoMoveSaveResponse :md5sum-) "5dc6c5051ad0aa936a5e0abddfc5f32e")
(setf (get agar_navigation::AutoMoveSaveResponse :datatype-) "agar_navigation/AutoMoveSaveResponse")
(setf (get agar_navigation::AutoMoveSaveResponse :definition-)
      "bool auto_move
---
bool saved
")



(provide :agar_navigation/AutoMoveSave "5dc6c5051ad0aa936a5e0abddfc5f32e")


