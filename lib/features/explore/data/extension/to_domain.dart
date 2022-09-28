import 'package:booking_app/app/constants.dart';
import 'package:booking_app/app/extensions.dart';
import 'package:booking_app/features/explore/data/responses/facilities_response.dart';
import 'package:booking_app/features/explore/data/responses/hotel_response.dart';
import 'package:booking_app/features/explore/domain/facilities_models.dart';
import 'package:booking_app/features/explore/domain/hotel_model.dart';

extension ExtensionToDomain on HotelResponse? {
  HotelModel toDomain() {
    return HotelModel(
        nextPageUrl: this?.nextPageUrl?.orEmpty() ?? "",
        total: this?.total?.orEmpty() ?? 0,
        data: (this?.data?.data?.map((e) => e.toDomain()) ??
                const Iterable.empty())
            .cast<DataHotelModel>()
            .toList());
  }
}

extension ExtensionDataHotelToDomain on DataHotelResponse? {
  DataHotelModel toDomain() {
    return DataHotelModel(
      id: this?.id?.orEmpty() ?? 0,
      name: this?.name?.orEmpty() ?? "",
      description: this?.description?.orEmpty() ?? "",
      price: this?.price?.orEmpty() ?? "0",
      address: this?.address?.orEmpty() ?? "",
      longitude: this?.longitude?.orEmpty() ?? "0",
      latitude: this?.latitude?.orEmpty() ?? "0",
      rate: this?.rate.orEmpty() ?? "0",
      images: (this?.images?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<ImagesHotelModel>()
          .toList(),
      hotelFacilities: (this?.hotelFacilities?.map((e) => e.toDomain()) ??
              const Iterable.empty())
          .cast<HotelFacilitiesModel>()
          .toList(),
    );
  }
}

extension ExtensionImageToDomain on ImagesResponse? {
  ImagesHotelModel toDomain() {
    return ImagesHotelModel(
        id: this?.id?.orEmpty() ?? 0,
        hotelId: this?.hotelId?.orEmpty() ?? "0",
        image: "${Constants.baseUrl}images/${this?.image?.orEmpty() ?? ""}");
  }
}

extension ExtensionFacilitiesToDomain on HotelFacilitiesResponse? {
  HotelFacilitiesModel toDomain() {
    return HotelFacilitiesModel(
        id: this?.id?.orEmpty() ?? 0,
        hotelId: this?.hotelId?.orEmpty() ?? "0",
        facilityId: this?.facilityId?.orEmpty() ?? "0");
  }
}

extension ExtensionFacilitiesResponse on FacilitiesResponse? {
  List<FacilitiesModels> toDomain() {
    return (this?.data?.map((e) => e.toDomain()) ??
            const Iterable.empty().cast<FacilitiesModels>())
        .toList();
  }
}

extension on FacilitiesDataResponse? {
  FacilitiesModels toDomain() {
    return FacilitiesModels(
      id: this?.id?.orEmpty() ?? 0,
      image: this?.image?.orEmpty() ?? "",
      name: this?.name?.orEmpty() ?? "",
    );
  }
}
