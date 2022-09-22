import 'package:booking_app/app/network/base/status_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'response_create_booking.g.dart';

@JsonSerializable()
class ResponseCreateBooking {
  final StatusResponse status;

  ResponseCreateBooking(this.status);
  factory ResponseCreateBooking.fromJson(Map<String, dynamic> json) {
    return _$ResponseCreateBookingFromJson(json);
  }
}
