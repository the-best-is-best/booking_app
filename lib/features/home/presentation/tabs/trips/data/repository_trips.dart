import 'package:booking_app/app/network/app_api.dart';
import 'package:booking_app/app/network/error_handler.dart';
import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/app/network/network_info.dart';
import 'package:booking_app/features/home/presentation/tabs/trips/domain/trips_model.dart';
import 'package:booking_app/features/home/presentation/tabs/trips/extension/toDomain.dart';
import 'package:dartz/dartz.dart';

class RepositoryTrips {
  final AppServicesClient appServicesClient;
  final NetworkInfo networkInfo;

  RepositoryTrips(this.appServicesClient, this.networkInfo);
  Future<Either<Failure, TripsModel>> getTrips(TripRequest tripRequest) async {
    if (await networkInfo.isConnected) {
      try {
        var response = await appServicesClient.getBooking(
            count: tripRequest.count,
            page: tripRequest.page,
            type: tripRequest.type,
            token: tripRequest.token);
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

  Future<Either<Failure, bool>> createTrip(
      CreateTripRequest createTripRequest) async {
    if (await networkInfo.isConnected) {
      try {
        var response = await appServicesClient.createBooking(
            hotelId: createTripRequest.hotelId, token: createTripRequest.token);
        if (response.status.type == "1") {
          //success
          // return either right
          // return data
          return const Right(true);
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

class TripRequest {
  final int count;
  final int page;
  final String type;
  final String token;

  TripRequest({
    required this.page,
    this.count = 10,
    required this.type,
    required this.token,
  });
}

class CreateTripRequest {
  final int hotelId;

  final String token;

  CreateTripRequest({required this.hotelId, required this.token});
}
