import 'package:booking_app/app/app.dart';
import 'package:booking_app/app/di.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await initApp();
  di<GetStorage>().remove("userToken");
  runApp(const MyApp());
}
