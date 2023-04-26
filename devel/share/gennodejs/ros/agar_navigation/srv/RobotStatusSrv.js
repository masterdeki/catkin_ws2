// Auto-generated. Do not edit!

// (in-package agar_navigation.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class RobotStatusSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotStatusSrvRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotStatusSrvRequest
    let len;
    let data = new RobotStatusSrvRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'agar_navigation/RobotStatusSrvRequest';
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
    const resolved = new RobotStatusSrvRequest(null);
    return resolved;
    }
};

class RobotStatusSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.auto_move = null;
      this.robot_speed = null;
      this.tenk_speed = null;
      this.imu_connected = null;
      this.imu_model_name = null;
    }
    else {
      if (initObj.hasOwnProperty('auto_move')) {
        this.auto_move = initObj.auto_move
      }
      else {
        this.auto_move = false;
      }
      if (initObj.hasOwnProperty('robot_speed')) {
        this.robot_speed = initObj.robot_speed
      }
      else {
        this.robot_speed = 0;
      }
      if (initObj.hasOwnProperty('tenk_speed')) {
        this.tenk_speed = initObj.tenk_speed
      }
      else {
        this.tenk_speed = 0;
      }
      if (initObj.hasOwnProperty('imu_connected')) {
        this.imu_connected = initObj.imu_connected
      }
      else {
        this.imu_connected = false;
      }
      if (initObj.hasOwnProperty('imu_model_name')) {
        this.imu_model_name = initObj.imu_model_name
      }
      else {
        this.imu_model_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotStatusSrvResponse
    // Serialize message field [auto_move]
    bufferOffset = _serializer.bool(obj.auto_move, buffer, bufferOffset);
    // Serialize message field [robot_speed]
    bufferOffset = _serializer.int16(obj.robot_speed, buffer, bufferOffset);
    // Serialize message field [tenk_speed]
    bufferOffset = _serializer.int16(obj.tenk_speed, buffer, bufferOffset);
    // Serialize message field [imu_connected]
    bufferOffset = _serializer.bool(obj.imu_connected, buffer, bufferOffset);
    // Serialize message field [imu_model_name]
    bufferOffset = _serializer.string(obj.imu_model_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotStatusSrvResponse
    let len;
    let data = new RobotStatusSrvResponse(null);
    // Deserialize message field [auto_move]
    data.auto_move = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [robot_speed]
    data.robot_speed = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [tenk_speed]
    data.tenk_speed = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [imu_connected]
    data.imu_connected = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [imu_model_name]
    data.imu_model_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.imu_model_name);
    return length + 10;
  }

  static datatype() {
    // Returns string type for a service object
    return 'agar_navigation/RobotStatusSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a31bc4a504f5eb9e3c4b51e387fba977';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool auto_move
    int16 robot_speed
    int16 tenk_speed
    bool imu_connected
    string imu_model_name
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotStatusSrvResponse(null);
    if (msg.auto_move !== undefined) {
      resolved.auto_move = msg.auto_move;
    }
    else {
      resolved.auto_move = false
    }

    if (msg.robot_speed !== undefined) {
      resolved.robot_speed = msg.robot_speed;
    }
    else {
      resolved.robot_speed = 0
    }

    if (msg.tenk_speed !== undefined) {
      resolved.tenk_speed = msg.tenk_speed;
    }
    else {
      resolved.tenk_speed = 0
    }

    if (msg.imu_connected !== undefined) {
      resolved.imu_connected = msg.imu_connected;
    }
    else {
      resolved.imu_connected = false
    }

    if (msg.imu_model_name !== undefined) {
      resolved.imu_model_name = msg.imu_model_name;
    }
    else {
      resolved.imu_model_name = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: RobotStatusSrvRequest,
  Response: RobotStatusSrvResponse,
  md5sum() { return 'a31bc4a504f5eb9e3c4b51e387fba977'; },
  datatype() { return 'agar_navigation/RobotStatusSrv'; }
};
