// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_trips.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseTrips _$ResponseTripsFromJson(Map<String, dynamic> json) =>
    ResponseTrips(
      StatusResponse.fromJson(json['status'] as Map<String, dynamic>),
      json['next_page_url'] as String?,
      json['data'] == null
          ? null
          : DataTrips.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseTripsToJson(ResponseTrips instance) =>
    <String, dynamic>{
      'status': instance.status,
      'next_page_url': instance.nextPageUrl,
      'data': instance.data,
    };

DataTrips _$DataTripsFromJson(Map<String, dynamic> json) => DataTrips(
      (json['data'] as List<dynamic>?)
          ?.map((e) => DataTripsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataTripsToJson(DataTrips instance) => <String, dynamic>{
      'data': instance.data,
    };

DataTripsResponse _$DataTripsResponseFromJson(Map<String, dynamic> json) =>
    DataTripsResponse(
      json['hotel'] == null
          ? null
          : DataHotelTripsResponse.fromJson(
              json['hotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataTripsResponseToJson(DataTripsResponse instance) =>
    <String, dynamic>{
      'hotel': instance.hotel,
    };

DataHotelTripsResponse _$DataHotelTripsResponseFromJson(
        Map<String, dynamic> json) =>
    DataHotelTripsResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['price'] as String?,
      json['address'] as String?,
      json['rate'] as String?,
      (json['hotel_images'] as List<dynamic>?)
          ?.map((e) =>
              HotelImageTripsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataHotelTripsResponseToJson(
        DataHotelTripsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'address': instance.address,
      'rate': instance.rate,
      'hotel_images': instance.hotelImage,
    };

HotelImageTripsResponse _$HotelImageTripsResponseFromJson(
        Map<String, dynamic> json) =>
    HotelImageTripsResponse(
      json['image'] as String?,
    );

Map<String, dynamic> _$HotelImageTripsResponseToJson(
        HotelImageTripsResponse instance) =>
    <String, dynamic>{
      'image': instance.image,
    };
