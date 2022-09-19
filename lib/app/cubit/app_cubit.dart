import 'package:bloc/bloc.dart';
import 'package:booking_app/app/di.dart';
import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/features/auth/domain/user_model.dart';
import 'package:booking_app/features/auth/login/data/repository_login.dart';
import 'package:booking_app/features/auth/register/repository_register.dart';
import 'package:dartz/dartz.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final RepositoryLogin repositoryLogin;
  final RepositoryRegister repositoryRegister;
  AppCubit(this.repositoryLogin, this.repositoryRegister) : super(AppInitial());

  Future<void> login() async {
    Either<Failure, UserModel> response =
        await repositoryLogin.login(LoginRequests(
      email: "test@testing.test",
      password: "123456",
    ));
    response.fold(
      (l) => print(l.messages),
      (r) => print(r),
    );
  }

  Future<void> register() async {
    Either<Failure, UserModel> response = await repositoryRegister.register(
        ResterRequests(
            email: "test@testing.test",
            name: "testing12",
            password: "123456",
            passwordConfirm: "123456"));
    response.fold(
      (l) => print(l.messages),
      (r) => print(r),
    );
  }
}
