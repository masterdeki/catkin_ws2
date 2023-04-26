// Generated by gencpp from file agar_navigation/controller_status.msg
// DO NOT EDIT!


#ifndef AGAR_NAVIGATION_MESSAGE_CONTROLLER_STATUS_H
#define AGAR_NAVIGATION_MESSAGE_CONTROLLER_STATUS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace agar_navigation
{
template <class ContainerAllocator>
struct controller_status_
{
  typedef controller_status_<ContainerAllocator> Type;

  controller_status_()
    : rpm(0)
    , phaseCurrent(0)
    , batteryVoltage(0)
    , controllerTemp(0)
    , reverse(false)
    , brakePedal(0)
    , brakeSwitch(0)
    , footSwitch(0)  {
    }
  controller_status_(const ContainerAllocator& _alloc)
    : rpm(0)
    , phaseCurrent(0)
    , batteryVoltage(0)
    , controllerTemp(0)
    , reverse(false)
    , brakePedal(0)
    , brakeSwitch(0)
    , footSwitch(0)  {
  (void)_alloc;
    }



   typedef uint16_t _rpm_type;
  _rpm_type rpm;

   typedef uint16_t _phaseCurrent_type;
  _phaseCurrent_type phaseCurrent;

   typedef uint8_t _batteryVoltage_type;
  _batteryVoltage_type batteryVoltage;

   typedef uint8_t _controllerTemp_type;
  _controllerTemp_type controllerTemp;

   typedef uint8_t _reverse_type;
  _reverse_type reverse;

   typedef uint8_t _brakePedal_type;
  _brakePedal_type brakePedal;

   typedef uint8_t _brakeSwitch_type;
  _brakeSwitch_type brakeSwitch;

   typedef uint8_t _footSwitch_type;
  _footSwitch_type footSwitch;





  typedef boost::shared_ptr< ::agar_navigation::controller_status_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::agar_navigation::controller_status_<ContainerAllocator> const> ConstPtr;

}; // struct controller_status_

typedef ::agar_navigation::controller_status_<std::allocator<void> > controller_status;

typedef boost::shared_ptr< ::agar_navigation::controller_status > controller_statusPtr;
typedef boost::shared_ptr< ::agar_navigation::controller_status const> controller_statusConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::agar_navigation::controller_status_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::agar_navigation::controller_status_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::agar_navigation::controller_status_<ContainerAllocator1> & lhs, const ::agar_navigation::controller_status_<ContainerAllocator2> & rhs)
{
  return lhs.rpm == rhs.rpm &&
    lhs.phaseCurrent == rhs.phaseCurrent &&
    lhs.batteryVoltage == rhs.batteryVoltage &&
    lhs.controllerTemp == rhs.controllerTemp &&
    lhs.reverse == rhs.reverse &&
    lhs.brakePedal == rhs.brakePedal &&
    lhs.brakeSwitch == rhs.brakeSwitch &&
    lhs.footSwitch == rhs.footSwitch;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::agar_navigation::controller_status_<ContainerAllocator1> & lhs, const ::agar_navigation::controller_status_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace agar_navigation

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::agar_navigation::controller_status_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::agar_navigation::controller_status_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::agar_navigation::controller_status_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::agar_navigation::controller_status_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::agar_navigation::controller_status_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::agar_navigation::controller_status_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::agar_navigation::controller_status_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f2b5f9baff5f33fa53ee6143b7658a03";
  }

  static const char* value(const ::agar_navigation::controller_status_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf2b5f9baff5f33faULL;
  static const uint64_t static_value2 = 0x53ee6143b7658a03ULL;
};

template<class ContainerAllocator>
struct DataType< ::agar_navigation::controller_status_<ContainerAllocator> >
{
  static const char* value()
  {
    return "agar_navigation/controller_status";
  }

  static const char* value(const ::agar_navigation::controller_status_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::agar_navigation::controller_status_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint16 rpm\n"
"uint16 phaseCurrent\n"
"uint8 batteryVoltage\n"
"uint8 controllerTemp\n"
"bool reverse\n"
"uint8 brakePedal\n"
"uint8 brakeSwitch\n"
"uint8 footSwitch\n"
;
  }

  static const char* value(const ::agar_navigation::controller_status_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::agar_navigation::controller_status_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.rpm);
      stream.next(m.phaseCurrent);
      stream.next(m.batteryVoltage);
      stream.next(m.controllerTemp);
      stream.next(m.reverse);
      stream.next(m.brakePedal);
      stream.next(m.brakeSwitch);
      stream.next(m.footSwitch);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct controller_status_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::agar_navigation::controller_status_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::agar_navigation::controller_status_<ContainerAllocator>& v)
  {
    s << indent << "rpm: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.rpm);
    s << indent << "phaseCurrent: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.phaseCurrent);
    s << indent << "batteryVoltage: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.batteryVoltage);
    s << indent << "controllerTemp: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.controllerTemp);
    s << indent << "reverse: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.reverse);
    s << indent << "brakePedal: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.brakePedal);
    s << indent << "brakeSwitch: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.brakeSwitch);
    s << indent << "footSwitch: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.footSwitch);
  }
};

} // namespace message_operations
} // namespace ros

#endif // AGAR_NAVIGATION_MESSAGE_CONTROLLER_STATUS_H
