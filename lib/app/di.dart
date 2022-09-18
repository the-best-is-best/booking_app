import 'package:booking_app/app/network/app_api.dart';
import 'package:booking_app/app/network/dio_manager.dart';
import 'package:booking_app/app/network/network_info.dart';
import 'package:booking_app/features/login/data/repository_login.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt di = GetIt.instance;

Future initApp() async {
  await DioManger.init();
  di.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  di.registerLazySingleton<AppServicesClient>(
      () => AppServicesClient(DioManger.dioApi));
  di.registerLazySingleton<RepositoryLogin>(() => RepositoryLogin(di(), di()));
}
