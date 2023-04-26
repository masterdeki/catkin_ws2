// Generated by gencpp from file agar_navigation/AgarParamsResponse.msg
// DO NOT EDIT!


#ifndef AGAR_NAVIGATION_MESSAGE_AGARPARAMSRESPONSE_H
#define AGAR_NAVIGATION_MESSAGE_AGARPARAMSRESPONSE_H


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
struct AgarParamsResponse_
{
  typedef AgarParamsResponse_<ContainerAllocator> Type;

  AgarParamsResponse_()
    : auto_move(false)
    , brake_enabled(false)
    , robot_speed(0)
    , tenk_speed(0)  {
    }
  AgarParamsResponse_(const ContainerAllocator& _alloc)
    : auto_move(false)
    , brake_enabled(false)
    , robot_speed(0)
    , tenk_speed(0)  {
  (void)_alloc;
    }



   typedef uint8_t _auto_move_type;
  _auto_move_type auto_move;

   typedef uint8_t _brake_enabled_type;
  _brake_enabled_type brake_enabled;

   typedef int16_t _robot_speed_type;
  _robot_speed_type robot_speed;

   typedef int16_t _tenk_speed_type;
  _tenk_speed_type tenk_speed;





  typedef boost::shared_ptr< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> const> ConstPtr;

}; // struct AgarParamsResponse_

typedef ::agar_navigation::AgarParamsResponse_<std::allocator<void> > AgarParamsResponse;

typedef boost::shared_ptr< ::agar_navigation::AgarParamsResponse > AgarParamsResponsePtr;
typedef boost::shared_ptr< ::agar_navigation::AgarParamsResponse const> AgarParamsResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::agar_navigation::AgarParamsResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::agar_navigation::AgarParamsResponse_<ContainerAllocator1> & lhs, const ::agar_navigation::AgarParamsResponse_<ContainerAllocator2> & rhs)
{
  return lhs.auto_move == rhs.auto_move &&
    lhs.brake_enabled == rhs.brake_enabled &&
    lhs.robot_speed == rhs.robot_speed &&
    lhs.tenk_speed == rhs.tenk_speed;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::agar_navigation::AgarParamsResponse_<ContainerAllocator1> & lhs, const ::agar_navigation::AgarParamsResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace agar_navigation

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2712b85560068525cea20886d2f2a6ea";
  }

  static const char* value(const ::agar_navigation::AgarParamsResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2712b85560068525ULL;
  static const uint64_t static_value2 = 0xcea20886d2f2a6eaULL;
};

template<class ContainerAllocator>
struct DataType< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "agar_navigation/AgarParamsResponse";
  }

  static const char* value(const ::agar_navigation::AgarParamsResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool auto_move\n"
"bool brake_enabled\n"
"int16 robot_speed\n"
"int16 tenk_speed\n"
;
  }

  static const char* value(const ::agar_navigation::AgarParamsResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.auto_move);
      stream.next(m.brake_enabled);
      stream.next(m.robot_speed);
      stream.next(m.tenk_speed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AgarParamsResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::agar_navigation::AgarParamsResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::agar_navigation::AgarParamsResponse_<ContainerAllocator>& v)
  {
    s << indent << "auto_move: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.auto_move);
    s << indent << "brake_enabled: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.brake_enabled);
    s << indent << "robot_speed: ";
    Printer<int16_t>::stream(s, indent + "  ", v.robot_speed);
    s << indent << "tenk_speed: ";
    Printer<int16_t>::stream(s, indent + "  ", v.tenk_speed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // AGAR_NAVIGATION_MESSAGE_AGARPARAMSRESPONSE_H
