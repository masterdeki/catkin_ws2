; Auto-generated. Do not edit!


(cl:in-package agar_navigation-srv)


;//! \htmlinclude RobotSpeedSave-request.msg.html

(cl:defclass <RobotSpeedSave-request> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:fixnum
    :initform 0)
   (tenk_speed
    :reader tenk_speed
    :initarg :tenk_speed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RobotSpeedSave-request (<RobotSpeedSave-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotSpeedSave-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotSpeedSave-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agar_navigation-srv:<RobotSpeedSave-request> is deprecated: use agar_navigation-srv:RobotSpeedSave-request instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <RobotSpeedSave-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:speed-val is deprecated.  Use agar_navigation-srv:speed instead.")
  (speed m))

(cl:ensure-generic-function 'tenk_speed-val :lambda-list '(m))
(cl:defmethod tenk_speed-val ((m <RobotSpeedSave-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:tenk_speed-val is deprecated.  Use agar_navigation-srv:tenk_speed instead.")
  (tenk_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotSpeedSave-request>) ostream)
  "Serializes a message object of type '<RobotSpeedSave-request>"
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'tenk_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotSpeedSave-request>) istream)
  "Deserializes a message object of type '<RobotSpeedSave-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tenk_speed) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotSpeedSave-request>)))
  "Returns string type for a service object of type '<RobotSpeedSave-request>"
  "agar_navigation/RobotSpeedSaveRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotSpeedSave-request)))
  "Returns string type for a service object of type 'RobotSpeedSave-request"
  "agar_navigation/RobotSpeedSaveRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotSpeedSave-request>)))
  "Returns md5sum for a message object of type '<RobotSpeedSave-request>"
  "eaee30a82966f2d54c874e2a0ce23a9b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotSpeedSave-request)))
  "Returns md5sum for a message object of type 'RobotSpeedSave-request"
  "eaee30a82966f2d54c874e2a0ce23a9b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotSpeedSave-request>)))
  "Returns full string definition for message of type '<RobotSpeedSave-request>"
  (cl:format cl:nil "int16 speed~%int16 tenk_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotSpeedSave-request)))
  "Returns full string definition for message of type 'RobotSpeedSave-request"
  (cl:format cl:nil "int16 speed~%int16 tenk_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotSpeedSave-request>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotSpeedSave-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotSpeedSave-request
    (cl:cons ':speed (speed msg))
    (cl:cons ':tenk_speed (tenk_speed msg))
))
;//! \htmlinclude RobotSpeedSave-response.msg.html

(cl:defclass <RobotSpeedSave-response> (roslisp-msg-protocol:ros-message)
  ((saved
    :reader saved
    :initarg :saved
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RobotSpeedSave-response (<RobotSpeedSave-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotSpeedSave-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotSpeedSave-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agar_navigation-srv:<RobotSpeedSave-response> is deprecated: use agar_navigation-srv:RobotSpeedSave-response instead.")))

(cl:ensure-generic-function 'saved-val :lambda-list '(m))
(cl:defmethod saved-val ((m <RobotSpeedSave-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:saved-val is deprecated.  Use agar_navigation-srv:saved instead.")
  (saved m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotSpeedSave-response>) ostream)
  "Serializes a message object of type '<RobotSpeedSave-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'saved) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotSpeedSave-response>) istream)
  "Deserializes a message object of type '<RobotSpeedSave-response>"
    (cl:setf (cl:slot-value msg 'saved) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotSpeedSave-response>)))
  "Returns string type for a service object of type '<RobotSpeedSave-response>"
  "agar_navigation/RobotSpeedSaveResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotSpeedSave-response)))
  "Returns string type for a service object of type 'RobotSpeedSave-response"
  "agar_navigation/RobotSpeedSaveResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotSpeedSave-response>)))
  "Returns md5sum for a message object of type '<RobotSpeedSave-response>"
  "eaee30a82966f2d54c874e2a0ce23a9b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotSpeedSave-response)))
  "Returns md5sum for a message object of type 'RobotSpeedSave-response"
  "eaee30a82966f2d54c874e2a0ce23a9b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotSpeedSave-response>)))
  "Returns full string definition for message of type '<RobotSpeedSave-response>"
  (cl:format cl:nil "bool saved~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotSpeedSave-response)))
  "Returns full string definition for message of type 'RobotSpeedSave-response"
  (cl:format cl:nil "bool saved~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotSpeedSave-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotSpeedSave-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotSpeedSave-response
    (cl:cons ':saved (saved msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RobotSpeedSave)))
  'RobotSpeedSave-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RobotSpeedSave)))
  'RobotSpeedSave-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotSpeedSave)))
  "Returns string type for a service object of type '<RobotSpeedSave>"
  "agar_navigation/RobotSpeedSave")