import 'package:freezed_annotation/freezed_annotation.dart';
part 'trips_model.freezed.dart';
part 'trips_model.g.dart';

@freezed
class TripsModel with _$TripsModel {
  factory TripsModel(
      {required String nextPageUrl,
      required List<DataModelTrips> data}) = _TripsModel;
  factory TripsModel.fromJson(Map<String, dynamic> json) =>
      _$TripsModelFromJson(json);
}

@freezed
class DataModelTrips with _$DataModelTrips {
  factory DataModelTrips(
      {required int id,
      required DataHotelTripsModel dataHotel}) = _DataModelTrips;
  factory DataModelTrips.fromJson(Map<String, dynamic> json) =>
      _$DataModelTripsFromJson(json);
}

@freezed
class DataHotelTripsModel with _$DataHotelTripsModel {
  factory DataHotelTripsModel({
    required int id,
    required String name,
    required String price,
    required String address,
    required String rate,
    required List<ImagesHotelTripsModel> images,
  }) = _DataHotelTripsModel;
  factory DataHotelTripsModel.fromJson(Map<String, dynamic> json) =>
      _$DataHotelTripsModelFromJson(json);
}

@freezed
class ImagesHotelTripsModel with _$ImagesHotelTripsModel {
  factory ImagesHotelTripsModel({
    required String image,
  }) = _ImagesHotelTripsModel;
  factory ImagesHotelTripsModel.fromJson(Map<String, dynamic> json) =>
      _$ImagesHotelTripsModelFromJson(json);
}
