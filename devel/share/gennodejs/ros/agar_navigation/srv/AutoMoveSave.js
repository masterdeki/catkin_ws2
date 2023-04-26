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

class AutoMoveSaveRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.auto_move = null;
    }
    else {
      if (initObj.hasOwnProperty('auto_move')) {
        this.auto_move = initObj.auto_move
      }
      else {
        this.auto_move = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AutoMoveSaveRequest
    // Serialize message field [auto_move]
    bufferOffset = _serializer.bool(obj.auto_move, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AutoMoveSaveRequest
    let len;
    let data = new AutoMoveSaveRequest(null);
    // Deserialize message field [auto_move]
    data.auto_move = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'agar_navigation/AutoMoveSaveRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0901aaacd54af27e266977a3508c4f87';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool auto_move
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AutoMoveSaveRequest(null);
    if (msg.auto_move !== undefined) {
      resolved.auto_move = msg.auto_move;
    }
    else {
      resolved.auto_move = false
    }

    return resolved;
    }
};

class AutoMoveSaveResponse {
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
    // Serializes a message object of type AutoMoveSaveResponse
    // Serialize message field [saved]
    bufferOffset = _serializer.bool(obj.saved, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AutoMoveSaveResponse
    let len;
    let data = new AutoMoveSaveResponse(null);
    // Deserialize message field [saved]
    data.saved = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'agar_navigation/AutoMoveSaveResponse';
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
    const resolved = new AutoMoveSaveResponse(null);
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
  Request: AutoMoveSaveRequest,
  Response: AutoMoveSaveResponse,
  md5sum() { return '5dc6c5051ad0aa936a5e0abddfc5f32e'; },
  datatype() { return 'agar_navigation/AutoMoveSave'; }
};
