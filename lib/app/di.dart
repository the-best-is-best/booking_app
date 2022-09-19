import 'package:booking_app/app/cubit/app_cubit.dart';
import 'package:booking_app/app/network/app_api.dart';
import 'package:booking_app/app/network/dio_manager.dart';
import 'package:booking_app/app/network/network_info.dart';
import 'package:booking_app/features/auth/login/data/repository_login.dart';
import 'package:booking_app/features/auth/profile/repository_profile.dart';
import 'package:booking_app/features/auth/profile/responses/response_profile.dart';
import 'package:booking_app/features/auth/register/repository_register.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt di = GetIt.instance;

Future initApp() async {
  await DioManger.init();
  di.registerFactory<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  di.registerFactory<AppServicesClient>(
      () => AppServicesClient(DioManger.dioApi));
  di.registerFactory<RepositoryLogin>(() => RepositoryLogin(di(), di()));
  di.registerFactory<RepositoryRegister>(() => RepositoryRegister(di(), di()));
  di.registerFactory<RepositoryProfile>(() => RepositoryProfile(di(), di()));
  di.registerFactory<AppCubit>(() => AppCubit(di(), di(), di()));
}
