import 'dart:io';

import 'package:booking_app/app/constants.dart';
import 'package:booking_app/features/auth/login/data/responses/login_response.dart';
import 'package:booking_app/features/auth/profile/responses/response_profile.dart';
import 'package:booking_app/features/auth/register/data/responses/response_register.dart';
import 'package:booking_app/features/auth/update_profile/responses/response_update_profile.dart';
import 'package:booking_app/features/explore/data/responses/hotel_response.dart';
import 'package:booking_app/features/home/presentation/tabs/features/trips/data/response/response_trips.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl + Constants.apiPath)
abstract class AppServicesClient {
  factory AppServicesClient(Dio dio, {String baseUrl}) =
      _AppServicesClient; // factory

// users api
//login by email and pass
  @POST(Constants.loginUrl)
  Future<LoginResponse> login(
      @Field("email") String email, @Field("password") String password);

  // register
  @POST(Constants.registerUrl)
  Future<RegisterResponse> register(
      {@Field("name") required String name,
      @Field("email") required String email,
      @Field("password") required String password,
      @Field("password_confirmation") required String passwordConfirm});

  @GET(Constants.profileInfoUrl)
  Future<ProfileResponse> getProfileInfo(@Header("token") String token);
  @POST(Constants.updateProfileInfoUrl)
  Future<UpdateProfileResponse> updateProfile({
    @Header("token") required String token,
    @Field("name") required String name,
    @Field("email") required String email,
    @Part() File? image,
  });
  @GET(Constants.hotelsUrl)
  Future<HotelResponse> getHotels(
      {@Query("count") required int count, @Query("page") required int page});
  @GET(Constants.getBookingUrl)
  Future<ResponseTrips> getBooking(
      {@Header("token") required String token,
      @Query("count") required int count,
      @Query("page") required int page,
      @Query("type") required String type});
}
