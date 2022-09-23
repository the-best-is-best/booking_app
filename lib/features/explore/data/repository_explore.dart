import 'package:booking_app/app/network/app_api.dart';
import 'package:booking_app/app/network/error_handler.dart';
import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/app/network/network_info.dart';
import 'package:booking_app/features/explore/data/extension/to_domain.dart';
import 'package:booking_app/features/explore/domain/hotel_model.dart';
import 'package:dartz/dartz.dart';

class RepositoryExplore {
  final AppServicesClient appServicesClient;
  final NetworkInfo networkInfo;

  RepositoryExplore(this.appServicesClient, this.networkInfo);
  Future<Either<Failure, HotelModel>> getHotel(
      ExploreRequests exploreRequests) async {
    if (await networkInfo.isConnected) {
      try {
        var response = await appServicesClient.getHotels(
            count: exploreRequests.count, page: exploreRequests.page);
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
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //failure
      // return either left
      return Left(DataRes.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

class ExploreRequests {
  final int count;
  final int page;

  ExploreRequests({required this.page, this.count = 10});
}
