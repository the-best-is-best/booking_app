import 'package:freezed_annotation/freezed_annotation.dart';
part 'facilities_models.freezed.dart';
part 'facilities_models.g.dart';

@Freezed()
class FacilitiesModels with _$FacilitiesModels {
  factory FacilitiesModels({
    required int id,
    required String name,
    required String image,
  }) = _FacilitiesModels;
  factory FacilitiesModels.fromJson(Map<String, dynamic> json) =>
      _$FacilitiesModelsFromJson(json);
}
