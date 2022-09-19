import 'package:booking_app/app/network/app_api.dart';
import 'package:booking_app/app/network/error_handler.dart';
import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/app/network/network_info.dart';
import 'package:booking_app/features/auth/domain/user_model.dart';
import 'package:booking_app/features/auth/login/data/extension/to_domain.dart';
import 'package:dartz/dartz.dart';

class RepositoryLogin {
  final AppServicesClient appServicesClient;
  final NetworkInfo networkInfo;

  RepositoryLogin(this.appServicesClient, this.networkInfo);
  Future<Either<Failure, UserModel>> login(LoginRequests loginRequests) async {
    if (await networkInfo.isConnected) {
      try {
        var response = await appServicesClient.login(
            loginRequests.email, loginRequests.password);
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

class LoginRequests {
  final String email;
  final String password;

  LoginRequests(this.email, this.password);
}
