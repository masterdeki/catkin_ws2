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

class RobotSpeedSaveRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.speed = null;
      this.tenk_speed = null;
    }
    else {
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0;
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
    // Serializes a message object of type RobotSpeedSaveRequest
    // Serialize message field [speed]
    bufferOffset = _serializer.int16(obj.speed, buffer, bufferOffset);
    // Serialize message field [tenk_speed]
    bufferOffset = _serializer.int16(obj.tenk_speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotSpeedSaveRequest
    let len;
    let data = new RobotSpeedSaveRequest(null);
    // Deserialize message field [speed]
    data.speed = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [tenk_speed]
    data.tenk_speed = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'agar_navigation/RobotSpeedSaveRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fbe4a3a77c41136171cf4e49493c121b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 speed
    int16 tenk_speed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotSpeedSaveRequest(null);
    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0
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

class RobotSpeedSaveResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.saved = null;
    }
    else {
      if (initObj.hasOwnProperty('saved')) {
        this.saved = initObj.saved
      }
      else {
        this.saved = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotSpeedSaveResponse
    // Serialize message field [saved]
    bufferOffset = _serializer.bool(obj.saved, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotSpeedSaveResponse
    let len;
    let data = new RobotSpeedSaveResponse(null);
    // Deserialize message field [saved]
    data.saved = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'agar_navigation/RobotSpeedSaveResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b0d3810ee720d0cb544e6a5f0d6991e9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool saved
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotSpeedSaveResponse(null);
    if (msg.saved !== undefined) {
      resolved.saved = msg.saved;
    }
    else {
      resolved.saved = false
    }

    return resolved;
    }
};

module.exports = {
  Request: RobotSpeedSaveRequest,
  Response: RobotSpeedSaveResponse,
  md5sum() { return 'eaee30a82966f2d54c874e2a0ce23a9b'; },
  datatype() { return 'agar_navigation/RobotSpeedSave'; }
};
