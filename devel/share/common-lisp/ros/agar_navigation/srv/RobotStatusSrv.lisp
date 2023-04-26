; Auto-generated. Do not edit!


(cl:in-package agar_navigation-srv)


;//! \htmlinclude RobotStatusSrv-request.msg.html

(cl:defclass <RobotStatusSrv-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass RobotStatusSrv-request (<RobotStatusSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotStatusSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotStatusSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agar_navigation-srv:<RobotStatusSrv-request> is deprecated: use agar_navigation-srv:RobotStatusSrv-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotStatusSrv-request>) ostream)
  "Serializes a message object of type '<RobotStatusSrv-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotStatusSrv-request>) istream)
  "Deserializes a message object of type '<RobotStatusSrv-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotStatusSrv-request>)))
  "Returns string type for a service object of type '<RobotStatusSrv-request>"
  "agar_navigation/RobotStatusSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotStatusSrv-request)))
  "Returns string type for a service object of type 'RobotStatusSrv-request"
  "agar_navigation/RobotStatusSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotStatusSrv-request>)))
  "Returns md5sum for a message object of type '<RobotStatusSrv-request>"
  "a31bc4a504f5eb9e3c4b51e387fba977")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotStatusSrv-request)))
  "Returns md5sum for a message object of type 'RobotStatusSrv-request"
  "a31bc4a504f5eb9e3c4b51e387fba977")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotStatusSrv-request>)))
  "Returns full string definition for message of type '<RobotStatusSrv-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotStatusSrv-request)))
  "Returns full string definition for message of type 'RobotStatusSrv-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotStatusSrv-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotStatusSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotStatusSrv-request
))
;//! \htmlinclude RobotStatusSrv-response.msg.html

(cl:defclass <RobotStatusSrv-response> (roslisp-msg-protocol:ros-message)
  ((auto_move
    :reader auto_move
    :initarg :auto_move
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
    :initform 0)
   (imu_connected
    :reader imu_connected
    :initarg :imu_connected
    :type cl:boolean
    :initform cl:nil)
   (imu_model_name
    :reader imu_model_name
    :initarg :imu_model_name
    :type cl:string
    :initform ""))
)

(cl:defclass RobotStatusSrv-response (<RobotStatusSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotStatusSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotStatusSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agar_navigation-srv:<RobotStatusSrv-response> is deprecated: use agar_navigation-srv:RobotStatusSrv-response instead.")))

(cl:ensure-generic-function 'auto_move-val :lambda-list '(m))
(cl:defmethod auto_move-val ((m <RobotStatusSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:auto_move-val is deprecated.  Use agar_navigation-srv:auto_move instead.")
  (auto_move m))

(cl:ensure-generic-function 'robot_speed-val :lambda-list '(m))
(cl:defmethod robot_speed-val ((m <RobotStatusSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:robot_speed-val is deprecated.  Use agar_navigation-srv:robot_speed instead.")
  (robot_speed m))

(cl:ensure-generic-function 'tenk_speed-val :lambda-list '(m))
(cl:defmethod tenk_speed-val ((m <RobotStatusSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:tenk_speed-val is deprecated.  Use agar_navigation-srv:tenk_speed instead.")
  (tenk_speed m))

(cl:ensure-generic-function 'imu_connected-val :lambda-list '(m))
(cl:defmethod imu_connected-val ((m <RobotStatusSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:imu_connected-val is deprecated.  Use agar_navigation-srv:imu_connected instead.")
  (imu_connected m))

(cl:ensure-generic-function 'imu_model_name-val :lambda-list '(m))
(cl:defmethod imu_model_name-val ((m <RobotStatusSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:imu_model_name-val is deprecated.  Use agar_navigation-srv:imu_model_name instead.")
  (imu_model_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotStatusSrv-response>) ostream)
  "Serializes a message object of type '<RobotStatusSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'auto_move) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'robot_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'tenk_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'imu_connected) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'imu_model_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'imu_model_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotStatusSrv-response>) istream)
  "Deserializes a message object of type '<RobotStatusSrv-response>"
    (cl:setf (cl:slot-value msg 'auto_move) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_speed) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tenk_speed) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'imu_connected) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'imu_model_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'imu_model_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotStatusSrv-response>)))
  "Returns string type for a service object of type '<RobotStatusSrv-response>"
  "agar_navigation/RobotStatusSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotStatusSrv-response)))
  "Returns string type for a service object of type 'RobotStatusSrv-response"
  "agar_navigation/RobotStatusSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotStatusSrv-response>)))
  "Returns md5sum for a message object of type '<RobotStatusSrv-response>"
  "a31bc4a504f5eb9e3c4b51e387fba977")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotStatusSrv-response)))
  "Returns md5sum for a message object of type 'RobotStatusSrv-response"
  "a31bc4a504f5eb9e3c4b51e387fba977")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotStatusSrv-response>)))
  "Returns full string definition for message of type '<RobotStatusSrv-response>"
  (cl:format cl:nil "bool auto_move~%int16 robot_speed~%int16 tenk_speed~%bool imu_connected~%string imu_model_name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotStatusSrv-response)))
  "Returns full string definition for message of type 'RobotStatusSrv-response"
  (cl:format cl:nil "bool auto_move~%int16 robot_speed~%int16 tenk_speed~%bool imu_connected~%string imu_model_name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotStatusSrv-response>))
  (cl:+ 0
     1
     2
     2
     1
     4 (cl:length (cl:slot-value msg 'imu_model_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotStatusSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotStatusSrv-response
    (cl:cons ':auto_move (auto_move msg))
    (cl:cons ':robot_speed (robot_speed msg))
    (cl:cons ':tenk_speed (tenk_speed msg))
    (cl:cons ':imu_connected (imu_connected msg))
    (cl:cons ':imu_model_name (imu_model_name msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RobotStatusSrv)))
  'RobotStatusSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RobotStatusSrv)))
  'RobotStatusSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotStatusSrv)))
  "Returns string type for a service object of type '<RobotStatusSrv>"
  "agar_navigation/RobotStatusSrv")