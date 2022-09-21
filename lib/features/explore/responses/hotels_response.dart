import 'package:booking_app/app/network/base/status_response.dart';
import 'package:booking_app/features/explore/domain/hotels_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'hotels_response.g.dart';

@JsonSerializable()
class HotelsResponse {
  final StatusResponse status;
  final HotelsModel data;

  HotelsResponse(this.status, this.data);

  factory HotelsResponse.fromJson(Map<String, dynamic> json) {
    return _$HotelsResponseFromJson(json);
  }
}

// @JsonSerializable()
// class Data {
//   final int id;
//   final String name;
//   final String email;
//   @JsonKey(name: "api_token")
//   final String apiToken;
//   final String? image;

//   Data(this.id, this.name, this.email, this.apiToken, this.image);
//   factory Data.fromJson(Map<String, dynamic> json) {
//     return _$DataFromJson(json);
//   }
// }
