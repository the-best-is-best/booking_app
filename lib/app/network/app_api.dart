import 'package:booking_app/app/constants.dart';
import 'package:booking_app/features/login/data/responses/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServicesClient {
  factory AppServicesClient(Dio dio, {String baseUrl}) =
      _AppServicesClient; // factory

// users api
//login by email and pass
  @POST(Constants.loginUrl)
  Future<LoginResponse> login(
      @Field("email") String email, @Field("password") String password);
}
