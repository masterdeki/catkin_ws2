; Auto-generated. Do not edit!


(cl:in-package reach_rs_driver-srv)


;//! \htmlinclude GpsStatusSrv-request.msg.html

(cl:defclass <GpsStatusSrv-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GpsStatusSrv-request (<GpsStatusSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GpsStatusSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GpsStatusSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name reach_rs_driver-srv:<GpsStatusSrv-request> is deprecated: use reach_rs_driver-srv:GpsStatusSrv-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GpsStatusSrv-request>) ostream)
  "Serializes a message object of type '<GpsStatusSrv-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GpsStatusSrv-request>) istream)
  "Deserializes a message object of type '<GpsStatusSrv-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GpsStatusSrv-request>)))
  "Returns string type for a service object of type '<GpsStatusSrv-request>"
  "reach_rs_driver/GpsStatusSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GpsStatusSrv-request)))
  "Returns string type for a service object of type 'GpsStatusSrv-request"
  "reach_rs_driver/GpsStatusSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GpsStatusSrv-request>)))
  "Returns md5sum for a message object of type '<GpsStatusSrv-request>"
  "1a4db83181fcb1e5355d5efa1e2f87a9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GpsStatusSrv-request)))
  "Returns md5sum for a message object of type 'GpsStatusSrv-request"
  "1a4db83181fcb1e5355d5efa1e2f87a9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GpsStatusSrv-request>)))
  "Returns full string definition for message of type '<GpsStatusSrv-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GpsStatusSrv-request)))
  "Returns full string definition for message of type 'GpsStatusSrv-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GpsStatusSrv-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GpsStatusSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GpsStatusSrv-request
))
;//! \htmlinclude GpsStatusSrv-response.msg.html

(cl:defclass <GpsStatusSrv-response> (roslisp-msg-protocol:ros-message)
  ((gps_connected
    :reader gps_connected
    :initarg :gps_connected
    :type cl:boolean
    :initform cl:nil)
   (latitude
    :reader latitude
    :initarg :latitude
    :type cl:float
    :initform 0.0)
   (longitude
    :reader longitude
    :initarg :longitude
    :type cl:float
    :initform 0.0)
   (status
    :reader status
    :initarg :status
    :type sensor_msgs-msg:NavSatStatus
    :initform (cl:make-instance 'sensor_msgs-msg:NavSatStatus)))
)

(cl:defclass GpsStatusSrv-response (<GpsStatusSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GpsStatusSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GpsStatusSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name reach_rs_driver-srv:<GpsStatusSrv-response> is deprecated: use reach_rs_driver-srv:GpsStatusSrv-response instead.")))

(cl:ensure-generic-function 'gps_connected-val :lambda-list '(m))
(cl:defmethod gps_connected-val ((m <GpsStatusSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader reach_rs_driver-srv:gps_connected-val is deprecated.  Use reach_rs_driver-srv:gps_connected instead.")
  (gps_connected m))

(cl:ensure-generic-function 'latitude-val :lambda-list '(m))
(cl:defmethod latitude-val ((m <GpsStatusSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader reach_rs_driver-srv:latitude-val is deprecated.  Use reach_rs_driver-srv:latitude instead.")
  (latitude m))

(cl:ensure-generic-function 'longitude-val :lambda-list '(m))
(cl:defmethod longitude-val ((m <GpsStatusSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader reach_rs_driver-srv:longitude-val is deprecated.  Use reach_rs_driver-srv:longitude instead.")
  (longitude m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <GpsStatusSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader reach_rs_driver-srv:status-val is deprecated.  Use reach_rs_driver-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GpsStatusSrv-response>) ostream)
  "Serializes a message object of type '<GpsStatusSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gps_connected) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'status) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GpsStatusSrv-response>) istream)
  "Deserializes a message object of type '<GpsStatusSrv-response>"
    (cl:setf (cl:slot-value msg 'gps_connected) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'status) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GpsStatusSrv-response>)))
  "Returns string type for a service object of type '<GpsStatusSrv-response>"
  "reach_rs_driver/GpsStatusSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GpsStatusSrv-response)))
  "Returns string type for a service object of type 'GpsStatusSrv-response"
  "reach_rs_driver/GpsStatusSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GpsStatusSrv-response>)))
  "Returns md5sum for a message object of type '<GpsStatusSrv-response>"
  "1a4db83181fcb1e5355d5efa1e2f87a9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GpsStatusSrv-response)))
  "Returns md5sum for a message object of type 'GpsStatusSrv-response"
  "1a4db83181fcb1e5355d5efa1e2f87a9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GpsStatusSrv-response>)))
  "Returns full string definition for message of type '<GpsStatusSrv-response>"
  (cl:format cl:nil "bool gps_connected~%float64 latitude~%float64 longitude~%sensor_msgs/NavSatStatus status~%~%================================================================================~%MSG: sensor_msgs/NavSatStatus~%# Navigation Satellite fix status for any Global Navigation Satellite System~%~%# Whether to output an augmented fix is determined by both the fix~%# type and the last time differential corrections were received.  A~%# fix is valid when status >= STATUS_FIX.~%~%int8 STATUS_NO_FIX =  -1        # unable to fix position~%int8 STATUS_FIX =      0        # unaugmented fix~%int8 STATUS_SBAS_FIX = 1        # with satellite-based augmentation~%int8 STATUS_GBAS_FIX = 2        # with ground-based augmentation~%~%int8 status~%~%# Bits defining which Global Navigation Satellite System signals were~%# used by the receiver.~%~%uint16 SERVICE_GPS =     1~%uint16 SERVICE_GLONASS = 2~%uint16 SERVICE_COMPASS = 4      # includes BeiDou.~%uint16 SERVICE_GALILEO = 8~%~%uint16 service~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GpsStatusSrv-response)))
  "Returns full string definition for message of type 'GpsStatusSrv-response"
  (cl:format cl:nil "bool gps_connected~%float64 latitude~%float64 longitude~%sensor_msgs/NavSatStatus status~%~%================================================================================~%MSG: sensor_msgs/NavSatStatus~%# Navigation Satellite fix status for any Global Navigation Satellite System~%~%# Whether to output an augmented fix is determined by both the fix~%# type and the last time differential corrections were received.  A~%# fix is valid when status >= STATUS_FIX.~%~%int8 STATUS_NO_FIX =  -1        # unable to fix position~%int8 STATUS_FIX =      0        # unaugmented fix~%int8 STATUS_SBAS_FIX = 1        # with satellite-based augmentation~%int8 STATUS_GBAS_FIX = 2        # with ground-based augmentation~%~%int8 status~%~%# Bits defining which Global Navigation Satellite System signals were~%# used by the receiver.~%~%uint16 SERVICE_GPS =     1~%uint16 SERVICE_GLONASS = 2~%uint16 SERVICE_COMPASS = 4      # includes BeiDou.~%uint16 SERVICE_GALILEO = 8~%~%uint16 service~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GpsStatusSrv-response>))
  (cl:+ 0
     1
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GpsStatusSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GpsStatusSrv-response
    (cl:cons ':gps_connected (gps_connected msg))
    (cl:cons ':latitude (latitude msg))
    (cl:cons ':longitude (longitude msg))
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GpsStatusSrv)))
  'GpsStatusSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GpsStatusSrv)))
  'GpsStatusSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GpsStatusSrv)))
  "Returns string type for a service object of type '<GpsStatusSrv>"
  "reach_rs_driver/GpsStatusSrv")