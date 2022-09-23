import 'package:booking_app/app/network/app_api.dart';
import 'package:booking_app/app/network/dio_manager.dart';
import 'package:booking_app/app/network/network_info.dart';
import 'package:booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/login/data/repository_login.dart';
import 'package:booking_app/features/auth/profile/repository_profile.dart';
import 'package:booking_app/features/auth/register/repository_register.dart';
import 'package:booking_app/features/auth/update_profile/repository_profile_update.dart';
import 'package:booking_app/features/explore/data/repository_explore.dart';
import 'package:booking_app/features/explore/data/repository_facilities.dart';
import 'package:booking_app/features/explore/data/repository_search.dart';
import 'package:booking_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:booking_app/features/home/presentation/tabs/trips/data/repository_trips.dart';
import 'package:booking_app/features/home/presentation/tabs/trips/presentation/cubit/trips_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt di = GetIt.instance;

Future initApp() async {
  await GetStorage.init();
  await DioManger.init();
  di.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  di.registerLazySingleton<AppServicesClient>(
      () => AppServicesClient(DioManger.dioApi));
// repo
  di.registerLazySingleton<RepositoryLogin>(() => RepositoryLogin(di(), di()));

  di.registerLazySingleton<RepositoryRegister>(
      () => RepositoryRegister(di(), di()));

  di.registerLazySingleton<RepositoryProfile>(
      () => RepositoryProfile(di(), di()));

  di.registerLazySingleton<RepositoryProfileUpdate>(
      () => RepositoryProfileUpdate(di(), di()));

  di.registerLazySingleton<RepositoryExplore>(
      () => RepositoryExplore(di(), di()));

  di.registerLazySingleton<RepositoryTrips>(() => RepositoryTrips(di(), di()));

  di.registerLazySingleton<RepositoryFacilities>(
      () => RepositoryFacilities(di(), di()));

  di.registerLazySingleton<RepositorySearch>(
      () => RepositorySearch(di(), di()));

  // get Storage
  di.registerLazySingleton<GetStorage>(() => GetStorage());

//cubit
  di.registerLazySingleton<AuthCubit>(
      () => AuthCubit(di(), di(), di(), di(), di()));
  di.registerLazySingleton<ExploreCubit>(() => ExploreCubit(di(), di(), di()));

  di.registerLazySingleton<TripsCubit>(() => TripsCubit(di()));
}
