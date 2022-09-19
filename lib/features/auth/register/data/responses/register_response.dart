import 'package:booking_app/app/network/base/status_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final StatusResponse status;
  final Data? data;

  RegisterResponse(this.status, this.data);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseFromJson(json);
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
