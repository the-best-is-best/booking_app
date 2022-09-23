// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TripsModel _$$_TripsModelFromJson(Map<String, dynamic> json) =>
    _$_TripsModel(
      nextPageUrl: json['nextPageUrl'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DataModelTrips.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TripsModelToJson(_$_TripsModel instance) =>
    <String, dynamic>{
      'nextPageUrl': instance.nextPageUrl,
      'data': instance.data,
    };

_$_DataModelTrips _$$_DataModelTripsFromJson(Map<String, dynamic> json) =>
    _$_DataModelTrips(
      id: json['id'] as int,
      dataHotel: DataHotelTripsModel.fromJson(
          json['dataHotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataModelTripsToJson(_$_DataModelTrips instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dataHotel': instance.dataHotel,
    };

_$_DataHotelTripsModel _$$_DataHotelTripsModelFromJson(
        Map<String, dynamic> json) =>
    _$_DataHotelTripsModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as String,
      address: json['address'] as String,
      rate: json['rate'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImagesHotelTripsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DataHotelTripsModelToJson(
        _$_DataHotelTripsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'address': instance.address,
      'rate': instance.rate,
      'images': instance.images,
    };

_$_ImagesHotelTripsModel _$$_ImagesHotelTripsModelFromJson(
        Map<String, dynamic> json) =>
    _$_ImagesHotelTripsModel(
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_ImagesHotelTripsModelToJson(
        _$_ImagesHotelTripsModel instance) =>
    <String, dynamic>{
      'image': instance.image,
    };
