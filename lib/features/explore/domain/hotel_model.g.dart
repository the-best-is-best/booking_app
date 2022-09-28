// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HotelModel _$$_HotelModelFromJson(Map<String, dynamic> json) =>
    _$_HotelModel(
      total: json['total'] as int,
      nextPageUrl: json['nextPageUrl'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DataHotelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HotelModelToJson(_$_HotelModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'nextPageUrl': instance.nextPageUrl,
      'data': instance.data,
    };

_$_DataHotelModel _$$_DataHotelModelFromJson(Map<String, dynamic> json) =>
    _$_DataHotelModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      address: json['address'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      rate: json['rate'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImagesHotelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotelFacilities: (json['hotelFacilities'] as List<dynamic>)
          .map((e) => HotelFacilitiesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DataHotelModelToJson(_$_DataHotelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'rate': instance.rate,
      'images': instance.images,
      'hotelFacilities': instance.hotelFacilities,
    };

_$_ImagesHotelModel _$$_ImagesHotelModelFromJson(Map<String, dynamic> json) =>
    _$_ImagesHotelModel(
      id: json['id'] as int,
      hotelId: json['hotelId'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_ImagesHotelModelToJson(_$_ImagesHotelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotelId': instance.hotelId,
      'image': instance.image,
    };

_$_HotelFacilitiesModel _$$_HotelFacilitiesModelFromJson(
        Map<String, dynamic> json) =>
    _$_HotelFacilitiesModel(
      id: json['id'] as int,
      hotelId: json['hotelId'] as String,
      facilityId: json['facilityId'] as String,
    );

Map<String, dynamic> _$$_HotelFacilitiesModelToJson(
        _$_HotelFacilitiesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotelId': instance.hotelId,
      'facilityId': instance.facilityId,
    };
