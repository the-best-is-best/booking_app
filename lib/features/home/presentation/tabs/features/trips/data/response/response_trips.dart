import 'package:booking_app/app/network/base/status_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'response_trips.g.dart';

@JsonSerializable()
class ResponseTrips {
  final StatusResponse status;
  @JsonKey(name: "next_page_url")
  final String? nextPageUrl;
  final DataTrips? data;

  ResponseTrips(this.status, this.nextPageUrl, this.data);
  factory ResponseTrips.fromJson(Map<String, dynamic> json) {
    return _$ResponseTripsFromJson(json);
  }
}

@JsonSerializable()
class DataTrips {
  final List<DataTripsResponse>? data;

  DataTrips(this.data);
  factory DataTrips.fromJson(Map<String, dynamic> json) {
    return _$DataTripsFromJson(json);
  }
}

@JsonSerializable()
class DataTripsResponse {
  final DataHotelTripsResponse? hotel;

  DataTripsResponse(this.hotel);
  factory DataTripsResponse.fromJson(Map<String, dynamic> json) {
    return _$DataTripsResponseFromJson(json);
  }
}

@JsonSerializable()
class DataHotelTripsResponse {
  final int? id;
  final String? name;
  final String? price;
  final String? address;
  final String? rate;
  @JsonKey(name: "hotel_images")
  final List<HotelImageTripsResponse>? hotelImage;

  DataHotelTripsResponse(
      this.id, this.name, this.price, this.address, this.rate, this.hotelImage);
  factory DataHotelTripsResponse.fromJson(Map<String, dynamic> json) {
    return _$DataHotelTripsResponseFromJson(json);
  }
}

@JsonSerializable()
class HotelImageTripsResponse {
  final String? image;

  HotelImageTripsResponse(this.image);
  factory HotelImageTripsResponse.fromJson(Map<String, dynamic> json) {
    return _$HotelImageTripsResponseFromJson(json);
  }
}
