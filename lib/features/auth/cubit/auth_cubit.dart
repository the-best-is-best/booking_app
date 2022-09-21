import 'dart:io';

import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/features/auth/domain/user_model.dart';
import 'package:booking_app/features/auth/login/data/repository_login.dart';
import 'package:booking_app/features/auth/profile/repository_profile.dart';
import 'package:booking_app/features/auth/register/repository_register.dart';
import 'package:booking_app/features/auth/update_profile/repository_profile_update.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mit_x/mit_x.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RepositoryLogin _repositoryLogin;
  final RepositoryRegister _repositoryRegister;
  final RepositoryProfile _repositoryProfile;
  final RepositoryProfileUpdate _repositoryProfileUpdate;

  AuthCubit(this._repositoryLogin, this._repositoryRegister,
      this._repositoryProfile, this._repositoryProfileUpdate)
      : super(AppInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  UserModel userFreezed = UserModel(name: "", email: "", apiToken: "");
  UserModel userModel = UserModel(name: "", email: "", apiToken: "");
  File? userImage;

  void clearUserFreezed() {
    userFreezed = UserModel(name: "", email: "", apiToken: "");
    userImage = null;
  }

  Future<void> login({required String email, required String password}) async {
    Either<Failure, UserModel> response =
        await _repositoryLogin.login(LoginRequests(
      email: email,
      password: password,
    ));
    response.fold(
      (l) {
        debugPrint(l.messages);
      },
      (r) {
        UserModel userModel = r;
        clearUserFreezed();
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
    Either<Failure, UserModel> response = await _repositoryRegister.register(
        ResterRequests(
            email: email,
            name: '$firstName $lastName',
            password: password,
            passwordConfirm: passwordConfirm));
    response.fold(
      (l) {
        debugPrint(l.messages);
      },
      (r) {
        userModel = r;
        clearUserFreezed();
      },
    );
  }

  Future<void> getProfileInfo() async {
    Either<Failure, UserModel> response =
        await _repositoryProfile.getProfileData(ProfileRequests(""));
    response.fold(
      (l) {
        debugPrint(l.messages);
      },
      (r) {
        userModel = r;
        clearUserFreezed();
      },
    );
  }

  Future<void> updateProfile() async {
    Either<Failure, UserModel> response =
        await _repositoryProfileUpdate.updateProfile(UpdateProfileRequests(
            token: userFreezed.apiToken,
            email: userFreezed.email,
            name: userFreezed.name,
            image: userImage));
    response.fold(
      (l) {
        debugPrint(l.messages);
      },
      (r) {
        userModel = r;
        clearUserFreezed();
      },
    );
  }

  // example change model value
  void addEmail(String name) {
    userFreezed = userFreezed.copyWith(name: name);
  }

  void addImage(File image) {
    userImage = image;
  }
}
