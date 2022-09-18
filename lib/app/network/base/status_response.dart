import 'package:freezed_annotation/freezed_annotation.dart';
part 'status_response.g.dart';

@JsonSerializable()
class StatusResponse {
  final String type;
  final dynamic title;

  StatusResponse(this.type, this.title);
  factory StatusResponse.fromJson(Map<String, dynamic> json) {
    return _$StatusResponseFromJson(json);
  }
}
