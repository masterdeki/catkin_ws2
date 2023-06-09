// Generated by gencpp from file agar_navigation/AutoMoveSave.msg
// DO NOT EDIT!


#ifndef AGAR_NAVIGATION_MESSAGE_AUTOMOVESAVE_H
#define AGAR_NAVIGATION_MESSAGE_AUTOMOVESAVE_H

#include <ros/service_traits.h>


#include <agar_navigation/AutoMoveSaveRequest.h>
#include <agar_navigation/AutoMoveSaveResponse.h>


namespace agar_navigation
{

struct AutoMoveSave
{

typedef AutoMoveSaveRequest Request;
typedef AutoMoveSaveResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct AutoMoveSave
} // namespace agar_navigation


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::agar_navigation::AutoMoveSave > {
  static const char* value()
  {
    return "5dc6c5051ad0aa936a5e0abddfc5f32e";
  }

  static const char* value(const ::agar_navigation::AutoMoveSave&) { return value(); }
};

template<>
struct DataType< ::agar_navigation::AutoMoveSave > {
  static const char* value()
  {
    return "agar_navigation/AutoMoveSave";
  }

  static const char* value(const ::agar_navigation::AutoMoveSave&) { return value(); }
};


// service_traits::MD5Sum< ::agar_navigation::AutoMoveSaveRequest> should match
// service_traits::MD5Sum< ::agar_navigation::AutoMoveSave >
template<>
struct MD5Sum< ::agar_navigation::AutoMoveSaveRequest>
{
  static const char* value()
  {
    return MD5Sum< ::agar_navigation::AutoMoveSave >::value();
  }
  static const char* value(const ::agar_navigation::AutoMoveSaveRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::agar_navigation::AutoMoveSaveRequest> should match
// service_traits::DataType< ::agar_navigation::AutoMoveSave >
template<>
struct DataType< ::agar_navigation::AutoMoveSaveRequest>
{
  static const char* value()
  {
    return DataType< ::agar_navigation::AutoMoveSave >::value();
  }
  static const char* value(const ::agar_navigation::AutoMoveSaveRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::agar_navigation::AutoMoveSaveResponse> should match
// service_traits::MD5Sum< ::agar_navigation::AutoMoveSave >
template<>
struct MD5Sum< ::agar_navigation::AutoMoveSaveResponse>
{
  static const char* value()
  {
    return MD5Sum< ::agar_navigation::AutoMoveSave >::value();
  }
  static const char* value(const ::agar_navigation::AutoMoveSaveResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::agar_navigation::AutoMoveSaveResponse> should match
// service_traits::DataType< ::agar_navigation::AutoMoveSave >
template<>
struct DataType< ::agar_navigation::AutoMoveSaveResponse>
{
  static const char* value()
  {
    return DataType< ::agar_navigation::AutoMoveSave >::value();
  }
  static const char* value(const ::agar_navigation::AutoMoveSaveResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // AGAR_NAVIGATION_MESSAGE_AUTOMOVESAVE_H
