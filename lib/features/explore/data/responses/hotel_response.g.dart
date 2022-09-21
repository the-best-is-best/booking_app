// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelResponse _$HotelResponseFromJson(Map<String, dynamic> json) =>
    HotelResponse(
      status: StatusResponse.fromJson(json['status'] as Map<String, dynamic>),
      total: json['total'] as int?,
      nextPageUrl: json['next_page_url'] as String?,
      data: json['data'] == null
          ? null
          : DataHotelResponse1.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelResponseToJson(HotelResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'total': instance.total,
      'next_page_url': instance.nextPageUrl,
      'data': instance.data,
    };

DataHotelResponse1 _$DataHotelResponse1FromJson(Map<String, dynamic> json) =>
    DataHotelResponse1(
      (json['data'] as List<dynamic>)
          .map((e) => DataHotelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataHotelResponse1ToJson(DataHotelResponse1 instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataHotelResponse _$DataHotelResponseFromJson(Map<String, dynamic> json) =>
    DataHotelResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      address: json['address'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      rate: json['rate'] as String?,
      images: (json['hotel_images'] as List<dynamic>?)
          ?.map((e) => ImagesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotelFacilities: (json['hotelFacilities'] as List<dynamic>?)
          ?.map((e) =>
              HotelFacilitiesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataHotelResponseToJson(DataHotelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'rate': instance.rate,
      'hotel_images': instance.images,
      'hotelFacilities': instance.hotelFacilities,
    };

ImagesResponse _$ImagesResponseFromJson(Map<String, dynamic> json) =>
    ImagesResponse(
      id: json['id'] as int?,
      hotelId: json['hotel_id'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ImagesResponseToJson(ImagesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_id': instance.hotelId,
      'image': instance.image,
    };

HotelFacilitiesResponse _$HotelFacilitiesResponseFromJson(
        Map<String, dynamic> json) =>
    HotelFacilitiesResponse(
      id: json['id'] as int?,
      hotelId: json['hotel_id'] as String?,
      facilityId: json['facility_id'] as int?,
    );

Map<String, dynamic> _$HotelFacilitiesResponseToJson(
        HotelFacilitiesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_id': instance.hotelId,
      'facility_id': instance.facilityId,
    };
