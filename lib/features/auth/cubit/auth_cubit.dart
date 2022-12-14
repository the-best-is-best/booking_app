import 'dart:io';

import 'package:booking_app/app/constants.dart';
import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/features/auth/domain/user_model.dart';
import 'package:booking_app/features/auth/login/data/repository_login.dart';
import 'package:booking_app/features/auth/profile/repository_profile.dart';
import 'package:booking_app/features/auth/register/repository_register.dart';
import 'package:booking_app/features/auth/update_profile/repository_profile_update.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RepositoryLogin _repositoryLogin;
  final RepositoryRegister _repositoryRegister;
  final RepositoryProfile _repositoryProfile;
  final RepositoryProfileUpdate _repositoryProfileUpdate;
  final GetStorage box;

  AuthCubit(this._repositoryLogin, this._repositoryRegister,
      this._repositoryProfile, this._repositoryProfileUpdate, this.box)
      : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);
  bool isShowPassword = false;
  bool isShowPasswordAgin = false;

  void showPassword() {
    isShowPassword = !isShowPassword;
    emit(AuthChangeShowPasswordState());
  }

  void showPasswordAgin() {
    isShowPasswordAgin = !isShowPasswordAgin;
    emit(AuthChangeShowPasswordState());
  }

  void resetShowPassword() {
    isShowPassword = false;
    isShowPasswordAgin = false;
  }

  UserModel userModel = UserModel(name: "", email: "", apiToken: "");
  XFile? userImage;

  void successAuth() {
    box.write(Constants.userCache, userModel.apiToken);
    userImage = null;
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());

    Either<Failure, UserModel> response =
        await _repositoryLogin.login(LoginRequests(
      email: email,
      password: password,
    ));
    response.fold(
      (l) {
        emit(AuthErrorState(l.messages));
        debugPrint(l.messages);
      },
      (r) {
        userModel = r;
        successAuth();
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String passwordConfirm,
    required String firstName,
    required String lastName,
  }) async {
    emit(AuthLoadingState());
    Either<Failure, UserModel> response = await _repositoryRegister.register(
        ResterRequests(
            email: email,
            name: '$firstName $lastName',
            password: password,
            passwordConfirm: passwordConfirm));
    response.fold(
      (l) {
        emit(AuthErrorState(l.messages));
      },
      (r) {
        userModel = r;
        successAuth();
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> getProfileInfo() async {
    if (box.read(Constants.userCache) != null) {
      emit(AuthGetLocalProfileState());
      Either<Failure, UserModel> response = await _repositoryProfile
          .getProfileData(ProfileRequests(box.read(Constants.userCache)));
      response.fold(
        (l) {
          emit(AuthErrorState(""));
        },
        (r) {
          userModel = r;
          successAuth();
          emit(AuthGetLocalProfileSuccessState());
        },
      );
    }
  }

  Future<void> updateProfile({
    required String userName,
    required String email,
  }) async {
    emit(AuthLoadingState());
    Either<Failure, UserModel> response =
        await _repositoryProfileUpdate.updateProfile(UpdateProfileRequests(
            token: userModel.apiToken,
            email: email,
            name: userName,
            image: userImage != null ? File(userImage!.path) : null));
    response.fold(
      (l) {
        emit(AuthErrorState(l.messages));
      },
      (r) {
        userModel = r;
        successAuth();
        emit(AuthSuccessState());
      },
    );
  }

  void addImage(XFile? image) {
    userImage = image;
    emit(AuthSelectedImageState());
  }

  Future logout() async {
    userModel = UserModel(name: "", email: "", apiToken: "");
    await box.remove(Constants.userCache);
    emit(AuthLogoutState());
  }
}
