import 'package:booking_app/app/network/base/status_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'facilities_response.g.dart';

@JsonSerializable()
class FacilitiesResponse {
  final StatusResponse status;
  final List<FacilitiesDataResponse>? data;

  FacilitiesResponse(this.status, this.data);
  factory FacilitiesResponse.fromJson(Map<String, dynamic> json) {
    return _$FacilitiesResponseFromJson(json);
  }
}

@JsonSerializable()
class FacilitiesDataResponse {
  final int? id;
  final String? name;
  final String? image;

  FacilitiesDataResponse(this.id, this.name, this.image);
  factory FacilitiesDataResponse.fromJson(Map<String, dynamic> json) {
    return _$FacilitiesDataResponseFromJson(json);
  }
}
