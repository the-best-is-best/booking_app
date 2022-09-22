// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_update_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUpdateBooking _$ResponseUpdateBookingFromJson(
        Map<String, dynamic> json) =>
    ResponseUpdateBooking(
      StatusResponse.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseUpdateBookingToJson(
        ResponseUpdateBooking instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
