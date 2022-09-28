import 'package:booking_app/app/network/app_api.dart';
import 'package:booking_app/app/network/error_handler.dart';
import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/app/network/network_info.dart';
import 'package:booking_app/features/explore/data/extension/to_domain.dart';
import 'package:booking_app/features/explore/domain/hotel_model.dart';
import 'package:dartz/dartz.dart';

class RepositorySearch {
  final AppServicesClient appServicesClient;
  final NetworkInfo networkInfo;

  RepositorySearch(this.appServicesClient, this.networkInfo);
  Future<Either<Failure, HotelModel>> searchHotel(
      SearchRequests searchRequests) async {
    if (await networkInfo.isConnected) {
      //    try {
      var response = await appServicesClient.searchHotel(
          address: searchRequests.address,
          distance: searchRequests.distance,
          facilities: searchRequests.facilities,
          latitude: searchRequests.latitude,
          longitude: searchRequests.longitude,
          maxPrice: searchRequests.maxPrice,
          minPrice: searchRequests.minPrice,
          name: searchRequests.name,
          count: searchRequests.count,
          page: searchRequests.page);
      if (response.status.type == "1") {
        //success
        // return either right
        // return data
        return Right(response.toDomain());
      } else {
        //failure
        // return either left
        return left(Failure(
            messages: (response.status.title is Map)
                ? response.status.title['en'] ?? ""
                : response.status.title ?? ""));
      }
      //  } catch (error) {
      //    return Left(ErrorHandler.handle(error).failure);
      //  }
    } else {
      //failure
      // return either left
      return Left(DataRes.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

class SearchRequests {
  final String? name;
  final String? address;
  final double? maxPrice;
  final double? minPrice;
  final Map<String, int>? facilities;
  final double? latitude;
  final double? longitude;
  final double? distance;
  final int count;
  final int page;

  SearchRequests(
      {this.name,
      this.address,
      this.maxPrice,
      this.minPrice,
      this.facilities,
      this.latitude,
      this.longitude,
      this.distance,
      this.count = 4,
      this.page = 1});
}
