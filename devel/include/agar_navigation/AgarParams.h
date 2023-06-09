// Generated by gencpp from file agar_navigation/AgarParams.msg
// DO NOT EDIT!


#ifndef AGAR_NAVIGATION_MESSAGE_AGARPARAMS_H
#define AGAR_NAVIGATION_MESSAGE_AGARPARAMS_H

#include <ros/service_traits.h>


#include <agar_navigation/AgarParamsRequest.h>
#include <agar_navigation/AgarParamsResponse.h>


namespace agar_navigation
{

struct AgarParams
{

typedef AgarParamsRequest Request;
typedef AgarParamsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct AgarParams
} // namespace agar_navigation


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::agar_navigation::AgarParams > {
  static const char* value()
  {
    return "2712b85560068525cea20886d2f2a6ea";
  }

  static const char* value(const ::agar_navigation::AgarParams&) { return value(); }
};

template<>
struct DataType< ::agar_navigation::AgarParams > {
  static const char* value()
  {
    return "agar_navigation/AgarParams";
  }

  static const char* value(const ::agar_navigation::AgarParams&) { return value(); }
};


// service_traits::MD5Sum< ::agar_navigation::AgarParamsRequest> should match
// service_traits::MD5Sum< ::agar_navigation::AgarParams >
template<>
struct MD5Sum< ::agar_navigation::AgarParamsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::agar_navigation::AgarParams >::value();
  }
  static const char* value(const ::agar_navigation::AgarParamsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::agar_navigation::AgarParamsRequest> should match
// service_traits::DataType< ::agar_navigation::AgarParams >
template<>
struct DataType< ::agar_navigation::AgarParamsRequest>
{
  static const char* value()
  {
    return DataType< ::agar_navigation::AgarParams >::value();
  }
  static const char* value(const ::agar_navigation::AgarParamsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::agar_navigation::AgarParamsResponse> should match
// service_traits::MD5Sum< ::agar_navigation::AgarParams >
template<>
struct MD5Sum< ::agar_navigation::AgarParamsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::agar_navigation::AgarParams >::value();
  }
  static const char* value(const ::agar_navigation::AgarParamsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::agar_navigation::AgarParamsResponse> should match
// service_traits::DataType< ::agar_navigation::AgarParams >
template<>
struct DataType< ::agar_navigation::AgarParamsResponse>
{
  static const char* value()
  {
    return DataType< ::agar_navigation::AgarParams >::value();
  }
  static const char* value(const ::agar_navigation::AgarParamsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // AGAR_NAVIGATION_MESSAGE_AGARPARAMS_H
