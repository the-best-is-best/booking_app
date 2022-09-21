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

class AuthSuccessState extends AuthState {}
