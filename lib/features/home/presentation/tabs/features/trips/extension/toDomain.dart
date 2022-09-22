import 'package:booking_app/app/constants.dart';
import 'package:booking_app/app/extensions.dart';
import 'package:booking_app/features/home/presentation/tabs/features/trips/data/response/response_trips.dart';
import 'package:booking_app/features/home/presentation/tabs/features/trips/domain/trips_model.dart';

extension ExtensionTripsResponse on ResponseTrips? {
  TripsModel toDomain() {
    return TripsModel(
        nextPageUrl: this?.nextPageUrl?.orEmpty() ?? "",
        data: (this?.data?.data?.map((e) => e.toDomain()) ??
                const Iterable.empty())
            .cast<DataModelTrips>()
            .toList());
  }
}

extension on DataTripsResponse? {
  DataModelTrips toDomain() {
    return DataModelTrips(
        id: this?.id?.orEmpty() ?? 0, dataHotel: this!.hotel!.toDomain());
  }
}

extension on DataHotelTripsResponse? {
  DataHotelTripsModel toDomain() {
    return DataHotelTripsModel(
        id: this?.id.orEmpty() ?? 0,
        address: this?.address?.orEmpty() ?? "",
        images: (this?.hotelImage?.map((e) => e.toDomain()) ??
                const Iterable.empty().cast<ImagesHotelTripsModel>())
            .toList(),
        name: this?.name?.orEmpty() ?? "",
        price: this?.price?.orEmpty() ?? "",
        rate: this?.rate?.orEmpty() ?? "");
  }
}

extension on HotelImageTripsResponse? {
  ImagesHotelTripsModel toDomain() {
    return ImagesHotelTripsModel(
        image: "${Constants.baseUrl}/images/${this?.image?.orEmpty()}");
  }
}
