import 'package:booking_app/app/network/base/status_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'response_update_booking.g.dart';

@JsonSerializable()
class ResponseUpdateBooking {
  final StatusResponse status;

  ResponseUpdateBooking(this.status);
  factory ResponseUpdateBooking.fromJson(Map<String, dynamic> json) {
    return _$ResponseUpdateBookingFromJson(json);
  }
}
