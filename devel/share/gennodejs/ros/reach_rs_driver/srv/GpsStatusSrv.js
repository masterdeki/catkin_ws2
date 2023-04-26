// Auto-generated. Do not edit!

// (in-package reach_rs_driver.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class GpsStatusSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GpsStatusSrvRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GpsStatusSrvRequest
    let len;
    let data = new GpsStatusSrvRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'reach_rs_driver/GpsStatusSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GpsStatusSrvRequest(null);
    return resolved;
    }
};

class GpsStatusSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.gps_connected = null;
      this.latitude = null;
      this.longitude = null;
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('gps_connected')) {
        this.gps_connected = initObj.gps_connected
      }
      else {
        this.gps_connected = false;
      }
      if (initObj.hasOwnProperty('latitude')) {
        this.latitude = initObj.latitude
      }
      else {
        this.latitude = 0.0;
      }
      if (initObj.hasOwnProperty('longitude')) {
        this.longitude = initObj.longitude
      }
      else {
        this.longitude = 0.0;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = new sensor_msgs.msg.NavSatStatus();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GpsStatusSrvResponse
    // Serialize message field [gps_connected]
    bufferOffset = _serializer.bool(obj.gps_connected, buffer, bufferOffset);
    // Serialize message field [latitude]
    bufferOffset = _serializer.float64(obj.latitude, buffer, bufferOffset);
    // Serialize message field [longitude]
    bufferOffset = _serializer.float64(obj.longitude, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = sensor_msgs.msg.NavSatStatus.serialize(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GpsStatusSrvResponse
    let len;
    let data = new GpsStatusSrvResponse(null);
    // Deserialize message field [gps_connected]
    data.gps_connected = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [latitude]
    data.latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [longitude]
    data.longitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = sensor_msgs.msg.NavSatStatus.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'reach_rs_driver/GpsStatusSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1a4db83181fcb1e5355d5efa1e2f87a9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GpsStatusSrvResponse(null);
    if (msg.gps_connected !== undefined) {
      resolved.gps_connected = msg.gps_connected;
    }
    else {
      resolved.gps_connected = false
    }

    if (msg.latitude !== undefined) {
      resolved.latitude = msg.latitude;
    }
    else {
      resolved.latitude = 0.0
    }

    if (msg.longitude !== undefined) {
      resolved.longitude = msg.longitude;
    }
    else {
      resolved.longitude = 0.0
    }

    if (msg.status !== undefined) {
      resolved.status = sensor_msgs.msg.NavSatStatus.Resolve(msg.status)
    }
    else {
      resolved.status = new sensor_msgs.msg.NavSatStatus()
    }

    return resolved;
    }
};

module.exports = {
  Request: GpsStatusSrvRequest,
  Response: GpsStatusSrvResponse,
  md5sum() { return '1a4db83181fcb1e5355d5efa1e2f87a9'; },
  datatype() { return 'reach_rs_driver/GpsStatusSrv'; }
};
