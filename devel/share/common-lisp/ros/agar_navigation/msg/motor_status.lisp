; Auto-generated. Do not edit!


(cl:in-package agar_navigation-msg)


;//! \htmlinclude motor_status.msg.html

(cl:defclass <motor_status> (roslisp-msg-protocol:ros-message)
  ((motor_fl
    :reader motor_fl
    :initarg :motor_fl
    :type agar_navigation-msg:controller_status
    :initform (cl:make-instance 'agar_navigation-msg:controller_status))
   (motor_rl
    :reader motor_rl
    :initarg :motor_rl
    :type agar_navigation-msg:controller_status
    :initform (cl:make-instance 'agar_navigation-msg:controller_status))
   (motor_fr
    :reader motor_fr
    :initarg :motor_fr
    :type agar_navigation-msg:controller_status
    :initform (cl:make-instance 'agar_navigation-msg:controller_status))
   (motor_rr
    :reader motor_rr
    :initarg :motor_rr
    :type agar_navigation-msg:controller_status
    :initform (cl:make-instance 'agar_navigation-msg:controller_status)))
)

(cl:defclass motor_status (<motor_status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motor_status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motor_status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agar_navigation-msg:<motor_status> is deprecated: use agar_navigation-msg:motor_status instead.")))

(cl:ensure-generic-function 'motor_fl-val :lambda-list '(m))
(cl:defmethod motor_fl-val ((m <motor_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-msg:motor_fl-val is deprecated.  Use agar_navigation-msg:motor_fl instead.")
  (motor_fl m))

(cl:ensure-generic-function 'motor_rl-val :lambda-list '(m))
(cl:defmethod motor_rl-val ((m <motor_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-msg:motor_rl-val is deprecated.  Use agar_navigation-msg:motor_rl instead.")
  (motor_rl m))

(cl:ensure-generic-function 'motor_fr-val :lambda-list '(m))
(cl:defmethod motor_fr-val ((m <motor_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-msg:motor_fr-val is deprecated.  Use agar_navigation-msg:motor_fr instead.")
  (motor_fr m))

(cl:ensure-generic-function 'motor_rr-val :lambda-list '(m))
(cl:defmethod motor_rr-val ((m <motor_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-msg:motor_rr-val is deprecated.  Use agar_navigation-msg:motor_rr instead.")
  (motor_rr m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motor_status>) ostream)
  "Serializes a message object of type '<motor_status>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'motor_fl) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'motor_rl) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'motor_fr) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'motor_rr) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motor_status>) istream)
  "Deserializes a message object of type '<motor_status>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'motor_fl) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'motor_rl) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'motor_fr) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'motor_rr) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motor_status>)))
  "Returns string type for a message object of type '<motor_status>"
  "agar_navigation/motor_status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motor_status)))
  "Returns string type for a message object of type 'motor_status"
  "agar_navigation/motor_status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motor_status>)))
  "Returns md5sum for a message object of type '<motor_status>"
  "08247c79e285da734d9f769281d95300")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motor_status)))
  "Returns md5sum for a message object of type 'motor_status"
  "08247c79e285da734d9f769281d95300")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motor_status>)))
  "Returns full string definition for message of type '<motor_status>"
  (cl:format cl:nil "controller_status motor_fl~%controller_status motor_rl~%controller_status motor_fr~%controller_status motor_rr~%================================================================================~%MSG: agar_navigation/controller_status~%uint16 rpm~%uint16 phaseCurrent~%uint8 batteryVoltage~%uint8 controllerTemp~%bool reverse~%uint8 brakePedal~%uint8 brakeSwitch~%uint8 footSwitch~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motor_status)))
  "Returns full string definition for message of type 'motor_status"
  (cl:format cl:nil "controller_status motor_fl~%controller_status motor_rl~%controller_status motor_fr~%controller_status motor_rr~%================================================================================~%MSG: agar_navigation/controller_status~%uint16 rpm~%uint16 phaseCurrent~%uint8 batteryVoltage~%uint8 controllerTemp~%bool reverse~%uint8 brakePedal~%uint8 brakeSwitch~%uint8 footSwitch~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motor_status>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'motor_fl))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'motor_rl))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'motor_fr))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'motor_rr))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motor_status>))
  "Converts a ROS message object to a list"
  (cl:list 'motor_status
    (cl:cons ':motor_fl (motor_fl msg))
    (cl:cons ':motor_rl (motor_rl msg))
    (cl:cons ':motor_fr (motor_fr msg))
    (cl:cons ':motor_rr (motor_rr msg))
))
