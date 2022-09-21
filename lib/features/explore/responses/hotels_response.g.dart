// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotels_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelsResponse _$HotelsResponseFromJson(Map<String, dynamic> json) =>
    HotelsResponse(
      StatusResponse.fromJson(json['status'] as Map<String, dynamic>),
      HotelsModel.fromJson(json),
    );

Map<String, dynamic> _$HotelsResponseToJson(HotelsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
