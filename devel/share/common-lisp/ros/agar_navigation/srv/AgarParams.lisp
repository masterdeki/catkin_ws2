; Auto-generated. Do not edit!


(cl:in-package agar_navigation-srv)


;//! \htmlinclude AgarParams-request.msg.html

(cl:defclass <AgarParams-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass AgarParams-request (<AgarParams-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AgarParams-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AgarParams-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agar_navigation-srv:<AgarParams-request> is deprecated: use agar_navigation-srv:AgarParams-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AgarParams-request>) ostream)
  "Serializes a message object of type '<AgarParams-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AgarParams-request>) istream)
  "Deserializes a message object of type '<AgarParams-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AgarParams-request>)))
  "Returns string type for a service object of type '<AgarParams-request>"
  "agar_navigation/AgarParamsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AgarParams-request)))
  "Returns string type for a service object of type 'AgarParams-request"
  "agar_navigation/AgarParamsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AgarParams-request>)))
  "Returns md5sum for a message object of type '<AgarParams-request>"
  "2712b85560068525cea20886d2f2a6ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AgarParams-request)))
  "Returns md5sum for a message object of type 'AgarParams-request"
  "2712b85560068525cea20886d2f2a6ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AgarParams-request>)))
  "Returns full string definition for message of type '<AgarParams-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AgarParams-request)))
  "Returns full string definition for message of type 'AgarParams-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AgarParams-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AgarParams-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AgarParams-request
))
;//! \htmlinclude AgarParams-response.msg.html

(cl:defclass <AgarParams-response> (roslisp-msg-protocol:ros-message)
  ((auto_move
    :reader auto_move
    :initarg :auto_move
    :type cl:boolean
    :initform cl:nil)
   (brake_enabled
    :reader brake_enabled
    :initarg :brake_enabled
    :type cl:boolean
    :initform cl:nil)
   (robot_speed
    :reader robot_speed
    :initarg :robot_speed
    :type cl:fixnum
    :initform 0)
   (tenk_speed
    :reader tenk_speed
    :initarg :tenk_speed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass AgarParams-response (<AgarParams-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AgarParams-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AgarParams-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agar_navigation-srv:<AgarParams-response> is deprecated: use agar_navigation-srv:AgarParams-response instead.")))

(cl:ensure-generic-function 'auto_move-val :lambda-list '(m))
(cl:defmethod auto_move-val ((m <AgarParams-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:auto_move-val is deprecated.  Use agar_navigation-srv:auto_move instead.")
  (auto_move m))

(cl:ensure-generic-function 'brake_enabled-val :lambda-list '(m))
(cl:defmethod brake_enabled-val ((m <AgarParams-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:brake_enabled-val is deprecated.  Use agar_navigation-srv:brake_enabled instead.")
  (brake_enabled m))

(cl:ensure-generic-function 'robot_speed-val :lambda-list '(m))
(cl:defmethod robot_speed-val ((m <AgarParams-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:robot_speed-val is deprecated.  Use agar_navigation-srv:robot_speed instead.")
  (robot_speed m))

(cl:ensure-generic-function 'tenk_speed-val :lambda-list '(m))
(cl:defmethod tenk_speed-val ((m <AgarParams-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:tenk_speed-val is deprecated.  Use agar_navigation-srv:tenk_speed instead.")
  (tenk_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AgarParams-response>) ostream)
  "Serializes a message object of type '<AgarParams-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'auto_move) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'brake_enabled) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'robot_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'tenk_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AgarParams-response>) istream)
  "Deserializes a message object of type '<AgarParams-response>"
    (cl:setf (cl:slot-value msg 'auto_move) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'brake_enabled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_speed) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tenk_speed) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AgarParams-response>)))
  "Returns string type for a service object of type '<AgarParams-response>"
  "agar_navigation/AgarParamsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AgarParams-response)))
  "Returns string type for a service object of type 'AgarParams-response"
  "agar_navigation/AgarParamsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AgarParams-response>)))
  "Returns md5sum for a message object of type '<AgarParams-response>"
  "2712b85560068525cea20886d2f2a6ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AgarParams-response)))
  "Returns md5sum for a message object of type 'AgarParams-response"
  "2712b85560068525cea20886d2f2a6ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AgarParams-response>)))
  "Returns full string definition for message of type '<AgarParams-response>"
  (cl:format cl:nil "bool auto_move~%bool brake_enabled~%int16 robot_speed~%int16 tenk_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AgarParams-response)))
  "Returns full string definition for message of type 'AgarParams-response"
  (cl:format cl:nil "bool auto_move~%bool brake_enabled~%int16 robot_speed~%int16 tenk_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AgarParams-response>))
  (cl:+ 0
     1
     1
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AgarParams-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AgarParams-response
    (cl:cons ':auto_move (auto_move msg))
    (cl:cons ':brake_enabled (brake_enabled msg))
    (cl:cons ':robot_speed (robot_speed msg))
    (cl:cons ':tenk_speed (tenk_speed msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AgarParams)))
  'AgarParams-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AgarParams)))
  'AgarParams-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AgarParams)))
  "Returns string type for a service object of type '<AgarParams>"
  "agar_navigation/AgarParams")