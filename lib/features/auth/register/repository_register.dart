import 'package:booking_app/app/network/app_api.dart';
import 'package:booking_app/app/network/error_handler.dart';
import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/app/network/network_info.dart';
import 'package:booking_app/features/auth/domain/user_model.dart';
import 'package:booking_app/features/auth/register/extension/to_domain.dart';
import 'package:dartz/dartz.dart';

class RepositoryRegister {
  final AppServicesClient appServicesClient;
  final NetworkInfo networkInfo;

  RepositoryRegister(this.appServicesClient, this.networkInfo);
  Future<Either<Failure, UserModel>> register(
      ResterRequests resterRequests) async {
    if (await networkInfo.isConnected) {
      try {
        var response = await appServicesClient.register(
            name: resterRequests.name,
            email: resterRequests.email,
            password: resterRequests.password,
            passwordConfirm: resterRequests.passwordConfirm);
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

class ResterRequests {
  final String name;
  final String email;
  final String password;
  final String passwordConfirm;

  ResterRequests(
      {required this.email,
      required this.password,
      required this.name,
      required this.passwordConfirm});
}
