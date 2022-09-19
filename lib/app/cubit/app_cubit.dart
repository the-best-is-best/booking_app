import 'package:bloc/bloc.dart';
import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/features/auth/domain/user_model.dart';
import 'package:booking_app/features/auth/login/data/repository_login.dart';
import 'package:booking_app/features/auth/profile/repository_profile.dart';
import 'package:booking_app/features/auth/register/repository_register.dart';
import 'package:dartz/dartz.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final RepositoryLogin repositoryLogin;
  final RepositoryRegister repositoryRegister;
  final RepositoryProfile repositoryProfile;
  AppCubit(
      this.repositoryLogin, this.repositoryRegister, this.repositoryProfile)
      : super(AppInitial());
  UserModel userModel = UserModel(name: "", email: "", apiToken: "");
  Future<void> login() async {
    Either<Failure, UserModel> response =
        await repositoryLogin.login(LoginRequests(
      email: userModel.email,
      password: userModel.password!,
    ));
    response.fold(
      (l) {
        print(l.messages);
      },
      (r) {
        return userModel = r;
      },
    );
  }

  Future<void> register() async {
    Either<Failure, UserModel> response = await repositoryRegister.register(
        ResterRequests(
            email: userModel.email,
            name: userModel.name,
            password: userModel.password!,
            passwordConfirm: userModel.passwordConfirm!));
    response.fold(
      (l) {
        print(l.messages);
      },
      (r) {
        return userModel = r;
      },
    );
  }

  Future<void> getProfileInfo() async {
    Either<Failure, UserModel> response = await repositoryProfile
        .getProfileData(ProfileRequests(userModel.apiToken));
    response.fold(
      (l) {
        print(l.messages);
      },
      (r) {
        return userModel = r;
      },
    );
  }

  // example change model value
  void addEmail(String name) {
    userModel = userModel.copyWith(name: name);
  }
}
