// Auto-generated. Do not edit!

// (in-package agar_navigation.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class controller_status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rpm = null;
      this.phaseCurrent = null;
      this.batteryVoltage = null;
      this.controllerTemp = null;
      this.reverse = null;
      this.brakePedal = null;
      this.brakeSwitch = null;
      this.footSwitch = null;
    }
    else {
      if (initObj.hasOwnProperty('rpm')) {
        this.rpm = initObj.rpm
      }
      else {
        this.rpm = 0;
      }
      if (initObj.hasOwnProperty('phaseCurrent')) {
        this.phaseCurrent = initObj.phaseCurrent
      }
      else {
        this.phaseCurrent = 0;
      }
      if (initObj.hasOwnProperty('batteryVoltage')) {
        this.batteryVoltage = initObj.batteryVoltage
      }
      else {
        this.batteryVoltage = 0;
      }
      if (initObj.hasOwnProperty('controllerTemp')) {
        this.controllerTemp = initObj.controllerTemp
      }
      else {
        this.controllerTemp = 0;
      }
      if (initObj.hasOwnProperty('reverse')) {
        this.reverse = initObj.reverse
      }
      else {
        this.reverse = false;
      }
      if (initObj.hasOwnProperty('brakePedal')) {
        this.brakePedal = initObj.brakePedal
      }
      else {
        this.brakePedal = 0;
      }
      if (initObj.hasOwnProperty('brakeSwitch')) {
        this.brakeSwitch = initObj.brakeSwitch
      }
      else {
        this.brakeSwitch = 0;
      }
      if (initObj.hasOwnProperty('footSwitch')) {
        this.footSwitch = initObj.footSwitch
      }
      else {
        this.footSwitch = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type controller_status
    // Serialize message field [rpm]
    bufferOffset = _serializer.uint16(obj.rpm, buffer, bufferOffset);
    // Serialize message field [phaseCurrent]
    bufferOffset = _serializer.uint16(obj.phaseCurrent, buffer, bufferOffset);
    // Serialize message field [batteryVoltage]
    bufferOffset = _serializer.uint8(obj.batteryVoltage, buffer, bufferOffset);
    // Serialize message field [controllerTemp]
    bufferOffset = _serializer.uint8(obj.controllerTemp, buffer, bufferOffset);
    // Serialize message field [reverse]
    bufferOffset = _serializer.bool(obj.reverse, buffer, bufferOffset);
    // Serialize message field [brakePedal]
    bufferOffset = _serializer.uint8(obj.brakePedal, buffer, bufferOffset);
    // Serialize message field [brakeSwitch]
    bufferOffset = _serializer.uint8(obj.brakeSwitch, buffer, bufferOffset);
    // Serialize message field [footSwitch]
    bufferOffset = _serializer.uint8(obj.footSwitch, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type controller_status
    let len;
    let data = new controller_status(null);
    // Deserialize message field [rpm]
    data.rpm = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [phaseCurrent]
    data.phaseCurrent = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [batteryVoltage]
    data.batteryVoltage = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [controllerTemp]
    data.controllerTemp = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [reverse]
    data.reverse = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [brakePedal]
    data.brakePedal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [brakeSwitch]
    data.brakeSwitch = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [footSwitch]
    data.footSwitch = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'agar_navigation/controller_status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f2b5f9baff5f33fa53ee6143b7658a03';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new controller_status(null);
    if (msg.rpm !== undefined) {
      resolved.rpm = msg.rpm;
    }
    else {
      resolved.rpm = 0
    }

    if (msg.phaseCurrent !== undefined) {
      resolved.phaseCurrent = msg.phaseCurrent;
    }
    else {
      resolved.phaseCurrent = 0
    }

    if (msg.batteryVoltage !== undefined) {
      resolved.batteryVoltage = msg.batteryVoltage;
    }
    else {
      resolved.batteryVoltage = 0
    }

    if (msg.controllerTemp !== undefined) {
      resolved.controllerTemp = msg.controllerTemp;
    }
    else {
      resolved.controllerTemp = 0
    }

    if (msg.reverse !== undefined) {
      resolved.reverse = msg.reverse;
    }
    else {
      resolved.reverse = false
    }

    if (msg.brakePedal !== undefined) {
      resolved.brakePedal = msg.brakePedal;
    }
    else {
      resolved.brakePedal = 0
    }

    if (msg.brakeSwitch !== undefined) {
      resolved.brakeSwitch = msg.brakeSwitch;
    }
    else {
      resolved.brakeSwitch = 0
    }

    if (msg.footSwitch !== undefined) {
      resolved.footSwitch = msg.footSwitch;
    }
    else {
      resolved.footSwitch = 0
    }

    return resolved;
    }
};

module.exports = controller_status;
