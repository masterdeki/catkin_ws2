
(cl:in-package :asdf)

(defsystem "reach_rs_driver-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "GpsStatusSrv" :depends-on ("_package_GpsStatusSrv"))
    (:file "_package_GpsStatusSrv" :depends-on ("_package"))
  ))