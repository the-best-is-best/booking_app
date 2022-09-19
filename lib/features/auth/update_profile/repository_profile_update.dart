import 'dart:io';
import 'package:booking_app/app/network/app_api.dart';
import 'package:booking_app/app/network/error_handler.dart';
import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/app/network/network_info.dart';
import 'package:booking_app/features/auth/domain/user_model.dart';
import 'package:booking_app/features/auth/update_profile/extension/to_domain.dart';
import 'package:dartz/dartz.dart';

class RepositoryProfileUpdate {
  final AppServicesClient appServicesClient;
  final NetworkInfo networkInfo;

  RepositoryProfileUpdate(this.appServicesClient, this.networkInfo);
  Future<Either<Failure, UserModel>> updateProfile(
      UpdateProfileRequests updateProfileRequests) async {
    if (await networkInfo.isConnected) {
      try {
        var response = await appServicesClient.updateProfile(
            token: updateProfileRequests.token,
            email: updateProfileRequests.email,
            name: updateProfileRequests.name,
            image: updateProfileRequests.image);
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

class UpdateProfileRequests {
  final String token;
  final String name;
  final String email;
  final File? image;

  UpdateProfileRequests({
    required this.token,
    required this.name,
    required this.email,
    required this.image,
  });
}
