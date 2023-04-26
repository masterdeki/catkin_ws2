; Auto-generated. Do not edit!


(cl:in-package agar_navigation-srv)


;//! \htmlinclude AutoMoveSave-request.msg.html

(cl:defclass <AutoMoveSave-request> (roslisp-msg-protocol:ros-message)
  ((auto_move
    :reader auto_move
    :initarg :auto_move
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AutoMoveSave-request (<AutoMoveSave-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutoMoveSave-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutoMoveSave-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agar_navigation-srv:<AutoMoveSave-request> is deprecated: use agar_navigation-srv:AutoMoveSave-request instead.")))

(cl:ensure-generic-function 'auto_move-val :lambda-list '(m))
(cl:defmethod auto_move-val ((m <AutoMoveSave-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:auto_move-val is deprecated.  Use agar_navigation-srv:auto_move instead.")
  (auto_move m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutoMoveSave-request>) ostream)
  "Serializes a message object of type '<AutoMoveSave-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'auto_move) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutoMoveSave-request>) istream)
  "Deserializes a message object of type '<AutoMoveSave-request>"
    (cl:setf (cl:slot-value msg 'auto_move) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutoMoveSave-request>)))
  "Returns string type for a service object of type '<AutoMoveSave-request>"
  "agar_navigation/AutoMoveSaveRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutoMoveSave-request)))
  "Returns string type for a service object of type 'AutoMoveSave-request"
  "agar_navigation/AutoMoveSaveRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutoMoveSave-request>)))
  "Returns md5sum for a message object of type '<AutoMoveSave-request>"
  "5dc6c5051ad0aa936a5e0abddfc5f32e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutoMoveSave-request)))
  "Returns md5sum for a message object of type 'AutoMoveSave-request"
  "5dc6c5051ad0aa936a5e0abddfc5f32e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutoMoveSave-request>)))
  "Returns full string definition for message of type '<AutoMoveSave-request>"
  (cl:format cl:nil "bool auto_move~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutoMoveSave-request)))
  "Returns full string definition for message of type 'AutoMoveSave-request"
  (cl:format cl:nil "bool auto_move~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutoMoveSave-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutoMoveSave-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AutoMoveSave-request
    (cl:cons ':auto_move (auto_move msg))
))
;//! \htmlinclude AutoMoveSave-response.msg.html

(cl:defclass <AutoMoveSave-response> (roslisp-msg-protocol:ros-message)
  ((saved
    :reader saved
    :initarg :saved
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AutoMoveSave-response (<AutoMoveSave-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutoMoveSave-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutoMoveSave-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agar_navigation-srv:<AutoMoveSave-response> is deprecated: use agar_navigation-srv:AutoMoveSave-response instead.")))

(cl:ensure-generic-function 'saved-val :lambda-list '(m))
(cl:defmethod saved-val ((m <AutoMoveSave-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agar_navigation-srv:saved-val is deprecated.  Use agar_navigation-srv:saved instead.")
  (saved m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutoMoveSave-response>) ostream)
  "Serializes a message object of type '<AutoMoveSave-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'saved) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutoMoveSave-response>) istream)
  "Deserializes a message object of type '<AutoMoveSave-response>"
    (cl:setf (cl:slot-value msg 'saved) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutoMoveSave-response>)))
  "Returns string type for a service object of type '<AutoMoveSave-response>"
  "agar_navigation/AutoMoveSaveResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutoMoveSave-response)))
  "Returns string type for a service object of type 'AutoMoveSave-response"
  "agar_navigation/AutoMoveSaveResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutoMoveSave-response>)))
  "Returns md5sum for a message object of type '<AutoMoveSave-response>"
  "5dc6c5051ad0aa936a5e0abddfc5f32e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutoMoveSave-response)))
  "Returns md5sum for a message object of type 'AutoMoveSave-response"
  "5dc6c5051ad0aa936a5e0abddfc5f32e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutoMoveSave-response>)))
  "Returns full string definition for message of type '<AutoMoveSave-response>"
  (cl:format cl:nil "bool saved~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutoMoveSave-response)))
  "Returns full string definition for message of type 'AutoMoveSave-response"
  (cl:format cl:nil "bool saved~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutoMoveSave-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutoMoveSave-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AutoMoveSave-response
    (cl:cons ':saved (saved msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AutoMoveSave)))
  'AutoMoveSave-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AutoMoveSave)))
  'AutoMoveSave-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutoMoveSave)))
  "Returns string type for a service object of type '<AutoMoveSave>"
  "agar_navigation/AutoMoveSave")