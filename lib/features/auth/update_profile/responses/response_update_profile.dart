import 'package:booking_app/app/network/base/status_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'response_update_profile.g.dart';

@JsonSerializable()
class UpdateProfileResponse {
  final StatusResponse status;
  final Data? data;

  UpdateProfileResponse(this.status, this.data);

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return _$UpdateProfileResponseFromJson(json);
  }
}

@JsonSerializable()
class Data {
  final int id;
  final String name;
  final String email;
  @JsonKey(name: "api_token")
  final String apiToken;
  final String? image;

  Data(this.id, this.name, this.email, this.apiToken, this.image);
  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
}
