// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilitiesResponse _$FacilitiesResponseFromJson(Map<String, dynamic> json) =>
    FacilitiesResponse(
      StatusResponse.fromJson(json['status'] as Map<String, dynamic>),
      (json['data'] as List<dynamic>?)
          ?.map(
              (e) => FacilitiesDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FacilitiesResponseToJson(FacilitiesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

FacilitiesDataResponse _$FacilitiesDataResponseFromJson(
        Map<String, dynamic> json) =>
    FacilitiesDataResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$FacilitiesDataResponseToJson(
        FacilitiesDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
