import 'package:freezed_annotation/freezed_annotation.dart';
part 'hotel_model.freezed.dart';
part 'hotel_model.g.dart';

@freezed
class HotelModel with _$HotelModel {
  factory HotelModel(
      {required int total,
      required String nextPageUrl,
      required List<DataHotelModel> data}) = _HotelModel;
  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);
}

@freezed
class DataHotelModel with _$DataHotelModel {
  factory DataHotelModel({
    required int id,
    required String name,
    required String description,
    required String price,
    required String address,
    required String longitude,
    required String latitude,
    required String rate,
    required List<ImagesHotelModel> images,
    required List<HotelFacilitiesModel> hotelFacilities,
  }) = _DataHotelModel;
  factory DataHotelModel.fromJson(Map<String, dynamic> json) =>
      _$DataHotelModelFromJson(json);
}

@freezed
class ImagesHotelModel with _$ImagesHotelModel {
  factory ImagesHotelModel({
    required int id,
    required String hotelId,
    required String image,
  }) = _ImagesHotelModel;
  factory ImagesHotelModel.fromJson(Map<String, dynamic> json) =>
      _$ImagesHotelModelFromJson(json);
}

@freezed
class HotelFacilitiesModel with _$HotelFacilitiesModel {
  factory HotelFacilitiesModel(
      {required int id,
      required String hotelId,
      required int facilityId}) = _HotelFacilitiesModel;
  factory HotelFacilitiesModel.fromJson(Map<String, dynamic> json) =>
      _$HotelFacilitiesModelFromJson(json);
}
