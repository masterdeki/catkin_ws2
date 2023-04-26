
(cl:in-package :asdf)

(defsystem "agar_navigation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "controller_status" :depends-on ("_package_controller_status"))
    (:file "_package_controller_status" :depends-on ("_package"))
    (:file "motor_status" :depends-on ("_package_motor_status"))
    (:file "_package_motor_status" :depends-on ("_package"))
  ))