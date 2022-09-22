// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_create_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseCreateBooking _$ResponseCreateBookingFromJson(
        Map<String, dynamic> json) =>
    ResponseCreateBooking(
      StatusResponse.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseCreateBookingToJson(
        ResponseCreateBooking instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
