import 'package:booking_app/app/app.dart';
import 'package:booking_app/app/di.dart';
import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/features/auth/domain/user_model.dart';
import 'package:booking_app/features/auth/register/repository_register.dart';
import 'package:dartz/dartz.dart' as z;
import 'package:flutter/material.dart';
import 'package:mit_x/mit_x.dart';

void main() async {
  await initApp();
  // z.Either<Failure, UserModel> response = await di<RepositoryRegister>()
  //     .register(ResterRequests(
  //         email: "test@testing.test",
  //         name: "testing12",
  //         password: "123456",
  //         passwordConfirm: "123456"));
  // response.fold(
  //   (l) => print(l.messages),
  //   (r) => print(r),
  // );
  runApp(const MyApp());
}
