import 'package:booking_app/app/cubit/app_cubit.dart';
import 'package:booking_app/app/di.dart';
import 'package:booking_app/app/resources/routes_manager.dart';
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
    /* MitX.toNamed();
    MitX.back();
    MitX.showSnackbar();
    MitX.defaultDialog();
   */
    // Utils Example
    //MitXUtils.isEmail();
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(375, 812),
        builder: (context, widget) {
          return BlocProvider(
              create: (context) => di<AppCubit>(),
              child: MitXMaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                initialRoute: Routes.main,
                onGenerateRoute: RoutesManager.getRoutes,
              ));
        });
  }
}
