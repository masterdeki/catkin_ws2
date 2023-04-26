; Auto-generated. Do not edit!


(cl:in-package agar_navigation-msg)


;//! \htmlinclude controller_status.msg.html

(cl:defclass <controller_status> (roslisp-msg-protocol:ros-message)
  ((rpm
    :reader rpm
    :initarg :rpm
    :type cl:fixnum
    :initform 0)
   (phaseCurrent
    :reader phaseCurrent
    :initarg :phaseCurrent
    :type cl:fixnum
    :initform 0)
   (batteryVoltage
    :reader batteryVoltage
    :initarg :batteryVoltage
    :type cl:fixnum
    :initform 0)
   (controllerTemp
    :reader controllerTemp
    :initarg :controllerTemp
    :type cl:fixnum
    :initform 0)
   (reverse
    :reader reverse
    :initarg :reverse
    :type cl:boolean
    :initform cl:nil)
   (brakePedal
    :reader brakePedal
    :initarg :brakePedal
    :type cl:fixnum
    :initform 0)
   (brakeSwitch
    :reader brakeSwitch
    :initarg :brakeSwitch
    :type cl:fixnum
    :initform 0)
   (footSwitch
    :reader footSwitch
    :initarg :footSwitch
    :type cl:fixnum
    :initform 0))
)

(cl:defclass controller_status (<controller_status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <controller_status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'controller_status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agar_navigation-msg:<controller_status> is deprecated: use agar_navigation-msg:controller_status instead.")))

(cl:ensure-generic-function 'rpm-val :lambda-list '(m))
(cl:defmethod rpm-val ((m <controller_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-msg:rpm-val is deprecated.  Use agar_navigation-msg:rpm instead.")
  (rpm m))

(cl:ensure-generic-function 'phaseCurrent-val :lambda-list '(m))
(cl:defmethod phaseCurrent-val ((m <controller_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-msg:phaseCurrent-val is deprecated.  Use agar_navigation-msg:phaseCurrent instead.")
  (phaseCurrent m))

(cl:ensure-generic-function 'batteryVoltage-val :lambda-list '(m))
(cl:defmethod batteryVoltage-val ((m <controller_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-msg:batteryVoltage-val is deprecated.  Use agar_navigation-msg:batteryVoltage instead.")
  (batteryVoltage m))

(cl:ensure-generic-function 'controllerTemp-val :lambda-list '(m))
(cl:defmethod controllerTemp-val ((m <controller_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-msg:controllerTemp-val is deprecated.  Use agar_navigation-msg:controllerTemp instead.")
  (controllerTemp m))

(cl:ensure-generic-function 'reverse-val :lambda-list '(m))
(cl:defmethod reverse-val ((m <controller_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-msg:reverse-val is deprecated.  Use agar_navigation-msg:reverse instead.")
  (reverse m))

(cl:ensure-generic-function 'brakePedal-val :lambda-list '(m))
(cl:defmethod brakePedal-val ((m <controller_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-msg:brakePedal-val is deprecated.  Use agar_navigation-msg:brakePedal instead.")
  (brakePedal m))

(cl:ensure-generic-function 'brakeSwitch-val :lambda-list '(m))
(cl:defmethod brakeSwitch-val ((m <controller_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-msg:brakeSwitch-val is deprecated.  Use agar_navigation-msg:brakeSwitch instead.")
  (brakeSwitch m))

(cl:ensure-generic-function 'footSwitch-val :lambda-list '(m))
(cl:defmethod footSwitch-val ((m <controller_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-msg:footSwitch-val is deprecated.  Use agar_navigation-msg:footSwitch instead.")
  (footSwitch m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <controller_status>) ostream)
  "Serializes a message object of type '<controller_status>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'phaseCurrent)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'phaseCurrent)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'batteryVoltage)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'controllerTemp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reverse) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'brakePedal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'brakeSwitch)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'footSwitch)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <controller_status>) istream)
  "Deserializes a message object of type '<controller_status>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'phaseCurrent)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'phaseCurrent)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'batteryVoltage)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'controllerTemp)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'reverse) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'brakePedal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'brakeSwitch)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'footSwitch)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<controller_status>)))
  "Returns string type for a message object of type '<controller_status>"
  "agar_navigation/controller_status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'controller_status)))
  "Returns string type for a message object of type 'controller_status"
  "agar_navigation/controller_status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<controller_status>)))
  "Returns md5sum for a message object of type '<controller_status>"
  "f2b5f9baff5f33fa53ee6143b7658a03")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'controller_status)))
  "Returns md5sum for a message object of type 'controller_status"
  "f2b5f9baff5f33fa53ee6143b7658a03")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<controller_status>)))
  "Returns full string definition for message of type '<controller_status>"
  (cl:format cl:nil "uint16 rpm~%uint16 phaseCurrent~%uint8 batteryVoltage~%uint8 controllerTemp~%bool reverse~%uint8 brakePedal~%uint8 brakeSwitch~%uint8 footSwitch~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'controller_status)))
  "Returns full string definition for message of type 'controller_status"
  (cl:format cl:nil "uint16 rpm~%uint16 phaseCurrent~%uint8 batteryVoltage~%uint8 controllerTemp~%bool reverse~%uint8 brakePedal~%uint8 brakeSwitch~%uint8 footSwitch~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <controller_status>))
  (cl:+ 0
     2
     2
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <controller_status>))
  "Converts a ROS message object to a list"
  (cl:list 'controller_status
    (cl:cons ':rpm (rpm msg))
    (cl:cons ':phaseCurrent (phaseCurrent msg))
    (cl:cons ':batteryVoltage (batteryVoltage msg))
    (cl:cons ':controllerTemp (controllerTemp msg))
    (cl:cons ':reverse (reverse msg))
    (cl:cons ':brakePedal (brakePedal msg))
    (cl:cons ':brakeSwitch (brakeSwitch msg))
    (cl:cons ':footSwitch (footSwitch msg))
))
