// Generated by gencpp from file agar_navigation/RobotSpeedSaveRequest.msg
// DO NOT EDIT!


#ifndef AGAR_NAVIGATION_MESSAGE_ROBOTSPEEDSAVEREQUEST_H
#define AGAR_NAVIGATION_MESSAGE_ROBOTSPEEDSAVEREQUEST_H


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
struct RobotSpeedSaveRequest_
{
  typedef RobotSpeedSaveRequest_<ContainerAllocator> Type;

  RobotSpeedSaveRequest_()
    : speed(0)
    , tenk_speed(0)  {
    }
  RobotSpeedSaveRequest_(const ContainerAllocator& _alloc)
    : speed(0)
    , tenk_speed(0)  {
  (void)_alloc;
    }



   typedef int16_t _speed_type;
  _speed_type speed;

   typedef int16_t _tenk_speed_type;
  _tenk_speed_type tenk_speed;





  typedef boost::shared_ptr< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> const> ConstPtr;

}; // struct RobotSpeedSaveRequest_

typedef ::agar_navigation::RobotSpeedSaveRequest_<std::allocator<void> > RobotSpeedSaveRequest;

typedef boost::shared_ptr< ::agar_navigation::RobotSpeedSaveRequest > RobotSpeedSaveRequestPtr;
typedef boost::shared_ptr< ::agar_navigation::RobotSpeedSaveRequest const> RobotSpeedSaveRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator1> & lhs, const ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator2> & rhs)
{
  return lhs.speed == rhs.speed &&
    lhs.tenk_speed == rhs.tenk_speed;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator1> & lhs, const ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace agar_navigation

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fbe4a3a77c41136171cf4e49493c121b";
  }

  static const char* value(const ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xfbe4a3a77c411361ULL;
  static const uint64_t static_value2 = 0x71cf4e49493c121bULL;
};

template<class ContainerAllocator>
struct DataType< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "agar_navigation/RobotSpeedSaveRequest";
  }

  static const char* value(const ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16 speed\n"
"int16 tenk_speed\n"
;
  }

  static const char* value(const ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.speed);
      stream.next(m.tenk_speed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RobotSpeedSaveRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::agar_navigation::RobotSpeedSaveRequest_<ContainerAllocator>& v)
  {
    s << indent << "speed: ";
    Printer<int16_t>::stream(s, indent + "  ", v.speed);
    s << indent << "tenk_speed: ";
    Printer<int16_t>::stream(s, indent + "  ", v.tenk_speed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // AGAR_NAVIGATION_MESSAGE_ROBOTSPEEDSAVEREQUEST_H
