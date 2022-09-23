import 'package:booking_app/app/di.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/utils/theme_manager.dart';
import 'package:booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:booking_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:booking_app/features/home/presentation/tabs/trips/presentation/cubit/trips_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // use MitX Like GetX
    /* MitX.offNamed();
    MitX.back();
    MitX.showSnackbar();
    MitX.defaultDialog();
   */
    // Utils Example
    //MitXUtils.isEmail();
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(480, 360),
        builder: (context, widget) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => di<AuthCubit>(),
                ),
                BlocProvider(
                  create: (context) => di<TripsCubit>(),
                ),
                BlocProvider(
                  create: (context) => di<ExploreCubit>(),
                )
              ],
              child: MitXMaterialApp(
                title: 'Flutter Demo',
                theme: getApplicationTheme(),
                initialRoute: Routes.splashRoute,
                onGenerateRoute: RouteGenerator.getRoute,
              ));
        });
  }
}
