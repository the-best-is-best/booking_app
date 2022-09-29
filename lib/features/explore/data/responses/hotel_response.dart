import 'package:booking_app/app/network/base/status_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hotel_response.g.dart';

@JsonSerializable()
class HotelResponse {
  final StatusResponse status;

  final DataHotelResponse1? data;

  HotelResponse({required this.status, this.data});
  factory HotelResponse.fromJson(Map<String, dynamic> json) {
    return _$HotelResponseFromJson(json);
  }
}

@JsonSerializable()
class DataHotelResponse1 {
  final List<DataHotelResponse>? data;
  final int? total;
  @JsonKey(name: "next_page_url")
  final String? nextPageUrl;
  factory DataHotelResponse1.fromJson(Map<String, dynamic> json) {
    return _$DataHotelResponse1FromJson(json);
  }

  DataHotelResponse1({this.total, this.nextPageUrl, this.data});
}

@JsonSerializable()
class DataHotelResponse {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final String? address;
  final String? longitude;
  final String? latitude;
  final String? rate;
  @JsonKey(name: "hotel_images")
  final List<ImagesResponse>? images;
  @JsonKey(name: "hotel_facilities")
  final List<HotelFacilitiesResponse>? hotelFacilities;

  DataHotelResponse(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.address,
      this.longitude,
      this.latitude,
      this.rate,
      this.images,
      this.hotelFacilities});
  factory DataHotelResponse.fromJson(Map<String, dynamic> json) {
    return _$DataHotelResponseFromJson(json);
  }
}

@JsonSerializable()
class ImagesResponse {
  final int? id;
  @JsonKey(name: "hotel_id")
  final String? hotelId;
  final String? image;

  ImagesResponse({this.id, this.hotelId, this.image});
  factory ImagesResponse.fromJson(Map<String, dynamic> json) {
    return _$ImagesResponseFromJson(json);
  }
}

@JsonSerializable()
class HotelFacilitiesResponse {
  final int? id;
  @JsonKey(name: "hotel_id")
  final String? hotelId;
  @JsonKey(name: "facility_id")
  final String? facilityId;

  HotelFacilitiesResponse({this.id, this.hotelId, this.facilityId});
  factory HotelFacilitiesResponse.fromJson(Map<String, dynamic> json) {
    return _$HotelFacilitiesResponseFromJson(json);
  }
}
