
(cl:in-package :asdf)

(defsystem "agar_navigation-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AgarParams" :depends-on ("_package_AgarParams"))
    (:file "_package_AgarParams" :depends-on ("_package"))
    (:file "AutoMoveSave" :depends-on ("_package_AutoMoveSave"))
    (:file "_package_AutoMoveSave" :depends-on ("_package"))
    (:file "RobotSpeedSave" :depends-on ("_package_RobotSpeedSave"))
    (:file "_package_RobotSpeedSave" :depends-on ("_package"))
    (:file "RobotStatusSrv" :depends-on ("_package_RobotStatusSrv"))
    (:file "_package_RobotStatusSrv" :depends-on ("_package"))
  ))