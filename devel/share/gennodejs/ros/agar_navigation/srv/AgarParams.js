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

class AgarParamsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AgarParamsRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AgarParamsRequest
    let len;
    let data = new AgarParamsRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'agar_navigation/AgarParamsRequest';
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
    const resolved = new AgarParamsRequest(null);
    return resolved;
    }
};

class AgarParamsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.auto_move = null;
      this.brake_enabled = null;
      this.robot_speed = null;
      this.tenk_speed = null;
    }
    else {
      if (initObj.hasOwnProperty('auto_move')) {
        this.auto_move = initObj.auto_move
      }
      else {
        this.auto_move = false;
      }
      if (initObj.hasOwnProperty('brake_enabled')) {
        this.brake_enabled = initObj.brake_enabled
      }
      else {
        this.brake_enabled = false;
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AgarParamsResponse
    // Serialize message field [auto_move]
    bufferOffset = _serializer.bool(obj.auto_move, buffer, bufferOffset);
    // Serialize message field [brake_enabled]
    bufferOffset = _serializer.bool(obj.brake_enabled, buffer, bufferOffset);
    // Serialize message field [robot_speed]
    bufferOffset = _serializer.int16(obj.robot_speed, buffer, bufferOffset);
    // Serialize message field [tenk_speed]
    bufferOffset = _serializer.int16(obj.tenk_speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AgarParamsResponse
    let len;
    let data = new AgarParamsResponse(null);
    // Deserialize message field [auto_move]
    data.auto_move = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [brake_enabled]
    data.brake_enabled = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [robot_speed]
    data.robot_speed = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [tenk_speed]
    data.tenk_speed = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a service object
    return 'agar_navigation/AgarParamsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2712b85560068525cea20886d2f2a6ea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool auto_move
    bool brake_enabled
    int16 robot_speed
    int16 tenk_speed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AgarParamsResponse(null);
    if (msg.auto_move !== undefined) {
      resolved.auto_move = msg.auto_move;
    }
    else {
      resolved.auto_move = false
    }

    if (msg.brake_enabled !== undefined) {
      resolved.brake_enabled = msg.brake_enabled;
    }
    else {
      resolved.brake_enabled = false
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

    return resolved;
    }
};

module.exports = {
  Request: AgarParamsRequest,
  Response: AgarParamsResponse,
  md5sum() { return '2712b85560068525cea20886d2f2a6ea'; },
  datatype() { return 'agar_navigation/AgarParams'; }
};
