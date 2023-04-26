# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from agar_navigation/motor_status.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import agar_navigation.msg

class motor_status(genpy.Message):
  _md5sum = "08247c79e285da734d9f769281d95300"
  _type = "agar_navigation/motor_status"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """controller_status motor_fl
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
uint8 footSwitch"""
  __slots__ = ['motor_fl','motor_rl','motor_fr','motor_rr']
  _slot_types = ['agar_navigation/controller_status','agar_navigation/controller_status','agar_navigation/controller_status','agar_navigation/controller_status']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       motor_fl,motor_rl,motor_fr,motor_rr

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(motor_status, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.motor_fl is None:
        self.motor_fl = agar_navigation.msg.controller_status()
      if self.motor_rl is None:
        self.motor_rl = agar_navigation.msg.controller_status()
      if self.motor_fr is None:
        self.motor_fr = agar_navigation.msg.controller_status()
      if self.motor_rr is None:
        self.motor_rr = agar_navigation.msg.controller_status()
    else:
      self.motor_fl = agar_navigation.msg.controller_status()
      self.motor_rl = agar_navigation.msg.controller_status()
      self.motor_fr = agar_navigation.msg.controller_status()
      self.motor_rr = agar_navigation.msg.controller_status()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_2H6B2H6B2H6B2H6B().pack(_x.motor_fl.rpm, _x.motor_fl.phaseCurrent, _x.motor_fl.batteryVoltage, _x.motor_fl.controllerTemp, _x.motor_fl.reverse, _x.motor_fl.brakePedal, _x.motor_fl.brakeSwitch, _x.motor_fl.footSwitch, _x.motor_rl.rpm, _x.motor_rl.phaseCurrent, _x.motor_rl.batteryVoltage, _x.motor_rl.controllerTemp, _x.motor_rl.reverse, _x.motor_rl.brakePedal, _x.motor_rl.brakeSwitch, _x.motor_rl.footSwitch, _x.motor_fr.rpm, _x.motor_fr.phaseCurrent, _x.motor_fr.batteryVoltage, _x.motor_fr.controllerTemp, _x.motor_fr.reverse, _x.motor_fr.brakePedal, _x.motor_fr.brakeSwitch, _x.motor_fr.footSwitch, _x.motor_rr.rpm, _x.motor_rr.phaseCurrent, _x.motor_rr.batteryVoltage, _x.motor_rr.controllerTemp, _x.motor_rr.reverse, _x.motor_rr.brakePedal, _x.motor_rr.brakeSwitch, _x.motor_rr.footSwitch))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.motor_fl is None:
        self.motor_fl = agar_navigation.msg.controller_status()
      if self.motor_rl is None:
        self.motor_rl = agar_navigation.msg.controller_status()
      if self.motor_fr is None:
        self.motor_fr = agar_navigation.msg.controller_status()
      if self.motor_rr is None:
        self.motor_rr = agar_navigation.msg.controller_status()
      end = 0
      _x = self
      start = end
      end += 40
      (_x.motor_fl.rpm, _x.motor_fl.phaseCurrent, _x.motor_fl.batteryVoltage, _x.motor_fl.controllerTemp, _x.motor_fl.reverse, _x.motor_fl.brakePedal, _x.motor_fl.brakeSwitch, _x.motor_fl.footSwitch, _x.motor_rl.rpm, _x.motor_rl.phaseCurrent, _x.motor_rl.batteryVoltage, _x.motor_rl.controllerTemp, _x.motor_rl.reverse, _x.motor_rl.brakePedal, _x.motor_rl.brakeSwitch, _x.motor_rl.footSwitch, _x.motor_fr.rpm, _x.motor_fr.phaseCurrent, _x.motor_fr.batteryVoltage, _x.motor_fr.controllerTemp, _x.motor_fr.reverse, _x.motor_fr.brakePedal, _x.motor_fr.brakeSwitch, _x.motor_fr.footSwitch, _x.motor_rr.rpm, _x.motor_rr.phaseCurrent, _x.motor_rr.batteryVoltage, _x.motor_rr.controllerTemp, _x.motor_rr.reverse, _x.motor_rr.brakePedal, _x.motor_rr.brakeSwitch, _x.motor_rr.footSwitch,) = _get_struct_2H6B2H6B2H6B2H6B().unpack(str[start:end])
      self.motor_fl.reverse = bool(self.motor_fl.reverse)
      self.motor_rl.reverse = bool(self.motor_rl.reverse)
      self.motor_fr.reverse = bool(self.motor_fr.reverse)
      self.motor_rr.reverse = bool(self.motor_rr.reverse)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_2H6B2H6B2H6B2H6B().pack(_x.motor_fl.rpm, _x.motor_fl.phaseCurrent, _x.motor_fl.batteryVoltage, _x.motor_fl.controllerTemp, _x.motor_fl.reverse, _x.motor_fl.brakePedal, _x.motor_fl.brakeSwitch, _x.motor_fl.footSwitch, _x.motor_rl.rpm, _x.motor_rl.phaseCurrent, _x.motor_rl.batteryVoltage, _x.motor_rl.controllerTemp, _x.motor_rl.reverse, _x.motor_rl.brakePedal, _x.motor_rl.brakeSwitch, _x.motor_rl.footSwitch, _x.motor_fr.rpm, _x.motor_fr.phaseCurrent, _x.motor_fr.batteryVoltage, _x.motor_fr.controllerTemp, _x.motor_fr.reverse, _x.motor_fr.brakePedal, _x.motor_fr.brakeSwitch, _x.motor_fr.footSwitch, _x.motor_rr.rpm, _x.motor_rr.phaseCurrent, _x.motor_rr.batteryVoltage, _x.motor_rr.controllerTemp, _x.motor_rr.reverse, _x.motor_rr.brakePedal, _x.motor_rr.brakeSwitch, _x.motor_rr.footSwitch))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.motor_fl is None:
        self.motor_fl = agar_navigation.msg.controller_status()
      if self.motor_rl is None:
        self.motor_rl = agar_navigation.msg.controller_status()
      if self.motor_fr is None:
        self.motor_fr = agar_navigation.msg.controller_status()
      if self.motor_rr is None:
        self.motor_rr = agar_navigation.msg.controller_status()
      end = 0
      _x = self
      start = end
      end += 40
      (_x.motor_fl.rpm, _x.motor_fl.phaseCurrent, _x.motor_fl.batteryVoltage, _x.motor_fl.controllerTemp, _x.motor_fl.reverse, _x.motor_fl.brakePedal, _x.motor_fl.brakeSwitch, _x.motor_fl.footSwitch, _x.motor_rl.rpm, _x.motor_rl.phaseCurrent, _x.motor_rl.batteryVoltage, _x.motor_rl.controllerTemp, _x.motor_rl.reverse, _x.motor_rl.brakePedal, _x.motor_rl.brakeSwitch, _x.motor_rl.footSwitch, _x.motor_fr.rpm, _x.motor_fr.phaseCurrent, _x.motor_fr.batteryVoltage, _x.motor_fr.controllerTemp, _x.motor_fr.reverse, _x.motor_fr.brakePedal, _x.motor_fr.brakeSwitch, _x.motor_fr.footSwitch, _x.motor_rr.rpm, _x.motor_rr.phaseCurrent, _x.motor_rr.batteryVoltage, _x.motor_rr.controllerTemp, _x.motor_rr.reverse, _x.motor_rr.brakePedal, _x.motor_rr.brakeSwitch, _x.motor_rr.footSwitch,) = _get_struct_2H6B2H6B2H6B2H6B().unpack(str[start:end])
      self.motor_fl.reverse = bool(self.motor_fl.reverse)
      self.motor_rl.reverse = bool(self.motor_rl.reverse)
      self.motor_fr.reverse = bool(self.motor_fr.reverse)
      self.motor_rr.reverse = bool(self.motor_rr.reverse)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2H6B2H6B2H6B2H6B = None
def _get_struct_2H6B2H6B2H6B2H6B():
    global _struct_2H6B2H6B2H6B2H6B
    if _struct_2H6B2H6B2H6B2H6B is None:
        _struct_2H6B2H6B2H6B2H6B = struct.Struct("<2H6B2H6B2H6B2H6B")
    return _struct_2H6B2H6B2H6B2H6B
