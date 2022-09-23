part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String? message;

  AuthErrorState(this.message);
}

class AuthGetLocalProfileState extends AuthState {}

class AuthGetLocalProfileSuccessState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthChangeShowPasswordState extends AuthState {}

class AuthSelectedImageState extends AuthState {}

class AuthLogoutState extends AuthState {}
