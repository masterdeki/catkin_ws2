;; Auto-generated. Do not edit!


(when (boundp 'reach_rs_driver::GpsStatusSrv)
  (if (not (find-package "REACH_RS_DRIVER"))
    (make-package "REACH_RS_DRIVER"))
  (shadow 'GpsStatusSrv (find-package "REACH_RS_DRIVER")))
(unless (find-package "REACH_RS_DRIVER::GPSSTATUSSRV")
  (make-package "REACH_RS_DRIVER::GPSSTATUSSRV"))
(unless (find-package "REACH_RS_DRIVER::GPSSTATUSSRVREQUEST")
  (make-package "REACH_RS_DRIVER::GPSSTATUSSRVREQUEST"))
(unless (find-package "REACH_RS_DRIVER::GPSSTATUSSRVRESPONSE")
  (make-package "REACH_RS_DRIVER::GPSSTATUSSRVRESPONSE"))

(in-package "ROS")



(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass reach_rs_driver::GpsStatusSrvRequest
  :super ros::object
  :slots ())

(defmethod reach_rs_driver::GpsStatusSrvRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass reach_rs_driver::GpsStatusSrvResponse
  :super ros::object
  :slots (_gps_connected _latitude _longitude _status ))

(defmethod reach_rs_driver::GpsStatusSrvResponse
  (:init
   (&key
    ((:gps_connected __gps_connected) nil)
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:status __status) (instance sensor_msgs::NavSatStatus :init))
    )
   (send-super :init)
   (setq _gps_connected __gps_connected)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _status __status)
   self)
  (:gps_connected
   (&optional (__gps_connected :null))
   (if (not (eq __gps_connected :null)) (setq _gps_connected __gps_connected)) _gps_connected)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:status
   (&rest __status)
   (if (keywordp (car __status))
       (send* _status __status)
     (progn
       (if __status (setq _status (car __status)))
       _status)))
  (:serialization-length
   ()
   (+
    ;; bool _gps_connected
    1
    ;; float64 _latitude
    8
    ;; float64 _longitude
    8
    ;; sensor_msgs/NavSatStatus _status
    (send _status :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _gps_connected
       (if _gps_connected (write-byte -1 s) (write-byte 0 s))
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; sensor_msgs/NavSatStatus _status
       (send _status :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _gps_connected
     (setq _gps_connected (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; sensor_msgs/NavSatStatus _status
     (send _status :deserialize buf ptr-) (incf ptr- (send _status :serialization-length))
   ;;
   self)
  )

(defclass reach_rs_driver::GpsStatusSrv
  :super ros::object
  :slots ())

(setf (get reach_rs_driver::GpsStatusSrv :md5sum-) "1a4db83181fcb1e5355d5efa1e2f87a9")
(setf (get reach_rs_driver::GpsStatusSrv :datatype-) "reach_rs_driver/GpsStatusSrv")
(setf (get reach_rs_driver::GpsStatusSrv :request) reach_rs_driver::GpsStatusSrvRequest)
(setf (get reach_rs_driver::GpsStatusSrv :response) reach_rs_driver::GpsStatusSrvResponse)

(defmethod reach_rs_driver::GpsStatusSrvRequest
  (:response () (instance reach_rs_driver::GpsStatusSrvResponse :init)))

(setf (get reach_rs_driver::GpsStatusSrvRequest :md5sum-) "1a4db83181fcb1e5355d5efa1e2f87a9")
(setf (get reach_rs_driver::GpsStatusSrvRequest :datatype-) "reach_rs_driver/GpsStatusSrvRequest")
(setf (get reach_rs_driver::GpsStatusSrvRequest :definition-)
      "---
bool gps_connected
float64 latitude
float64 longitude
sensor_msgs/NavSatStatus status

================================================================================
MSG: sensor_msgs/NavSatStatus
# Navigation Satellite fix status for any Global Navigation Satellite System

# Whether to output an augmented fix is determined by both the fix
# type and the last time differential corrections were received.  A
# fix is valid when status >= STATUS_FIX.

int8 STATUS_NO_FIX =  -1        # unable to fix position
int8 STATUS_FIX =      0        # unaugmented fix
int8 STATUS_SBAS_FIX = 1        # with satellite-based augmentation
int8 STATUS_GBAS_FIX = 2        # with ground-based augmentation

int8 status

# Bits defining which Global Navigation Satellite System signals were
# used by the receiver.

uint16 SERVICE_GPS =     1
uint16 SERVICE_GLONASS = 2
uint16 SERVICE_COMPASS = 4      # includes BeiDou.
uint16 SERVICE_GALILEO = 8

uint16 service
")

(setf (get reach_rs_driver::GpsStatusSrvResponse :md5sum-) "1a4db83181fcb1e5355d5efa1e2f87a9")
(setf (get reach_rs_driver::GpsStatusSrvResponse :datatype-) "reach_rs_driver/GpsStatusSrvResponse")
(setf (get reach_rs_driver::GpsStatusSrvResponse :definition-)
      "---
bool gps_connected
float64 latitude
float64 longitude
sensor_msgs/NavSatStatus status

================================================================================
MSG: sensor_msgs/NavSatStatus
# Navigation Satellite fix status for any Global Navigation Satellite System

# Whether to output an augmented fix is determined by both the fix
# type and the last time differential corrections were received.  A
# fix is valid when status >= STATUS_FIX.

int8 STATUS_NO_FIX =  -1        # unable to fix position
int8 STATUS_FIX =      0        # unaugmented fix
int8 STATUS_SBAS_FIX = 1        # with satellite-based augmentation
int8 STATUS_GBAS_FIX = 2        # with ground-based augmentation

int8 status

# Bits defining which Global Navigation Satellite System signals were
# used by the receiver.

uint16 SERVICE_GPS =     1
uint16 SERVICE_GLONASS = 2
uint16 SERVICE_COMPASS = 4      # includes BeiDou.
uint16 SERVICE_GALILEO = 8

uint16 service
")



(provide :reach_rs_driver/GpsStatusSrv "1a4db83181fcb1e5355d5efa1e2f87a9")


