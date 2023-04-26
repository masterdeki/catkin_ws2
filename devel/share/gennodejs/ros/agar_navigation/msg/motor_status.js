// Auto-generated. Do not edit!

// (in-package agar_navigation.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let controller_status = require('./controller_status.js');

//-----------------------------------------------------------

class motor_status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motor_fl = null;
      this.motor_rl = null;
      this.motor_fr = null;
      this.motor_rr = null;
    }
    else {
      if (initObj.hasOwnProperty('motor_fl')) {
        this.motor_fl = initObj.motor_fl
      }
      else {
        this.motor_fl = new controller_status();
      }
      if (initObj.hasOwnProperty('motor_rl')) {
        this.motor_rl = initObj.motor_rl
      }
      else {
        this.motor_rl = new controller_status();
      }
      if (initObj.hasOwnProperty('motor_fr')) {
        this.motor_fr = initObj.motor_fr
      }
      else {
        this.motor_fr = new controller_status();
      }
      if (initObj.hasOwnProperty('motor_rr')) {
        this.motor_rr = initObj.motor_rr
      }
      else {
        this.motor_rr = new controller_status();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type motor_status
    // Serialize message field [motor_fl]
    bufferOffset = controller_status.serialize(obj.motor_fl, buffer, bufferOffset);
    // Serialize message field [motor_rl]
    bufferOffset = controller_status.serialize(obj.motor_rl, buffer, bufferOffset);
    // Serialize message field [motor_fr]
    bufferOffset = controller_status.serialize(obj.motor_fr, buffer, bufferOffset);
    // Serialize message field [motor_rr]
    bufferOffset = controller_status.serialize(obj.motor_rr, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type motor_status
    let len;
    let data = new motor_status(null);
    // Deserialize message field [motor_fl]
    data.motor_fl = controller_status.deserialize(buffer, bufferOffset);
    // Deserialize message field [motor_rl]
    data.motor_rl = controller_status.deserialize(buffer, bufferOffset);
    // Deserialize message field [motor_fr]
    data.motor_fr = controller_status.deserialize(buffer, bufferOffset);
    // Deserialize message field [motor_rr]
    data.motor_rr = controller_status.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'agar_navigation/motor_status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '08247c79e285da734d9f769281d95300';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    controller_status motor_fl
    controller_status motor_rl
    controller_status motor_fr
    controller_status motor_rr
    ================================================================================
    MSG: agar_navigation/controller_status
    uint16 rpm
    uint16 phaseCurrent
    uint8 batteryVoltage
    uint8 controllerTemp
    bool reverse
    uint8 brakePedal
    uint8 brakeSwitch
    uint8 footSwitch
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new motor_status(null);
    if (msg.motor_fl !== undefined) {
      resolved.motor_fl = controller_status.Resolve(msg.motor_fl)
    }
    else {
      resolved.motor_fl = new controller_status()
    }

    if (msg.motor_rl !== undefined) {
      resolved.motor_rl = controller_status.Resolve(msg.motor_rl)
    }
    else {
      resolved.motor_rl = new controller_status()
    }

    if (msg.motor_fr !== undefined) {
      resolved.motor_fr = controller_status.Resolve(msg.motor_fr)
    }
    else {
      resolved.motor_fr = new controller_status()
    }

    if (msg.motor_rr !== undefined) {
      resolved.motor_rr = controller_status.Resolve(msg.motor_rr)
    }
    else {
      resolved.motor_rr = new controller_status()
    }

    return resolved;
    }
};

module.exports = motor_status;
