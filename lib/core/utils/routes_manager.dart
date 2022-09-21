import 'package:booking_app/app/di.dart';
import 'package:booking_app/features/auth/login/presentation/screen/login_screen.dart';
import 'package:booking_app/features/auth/register/presentaion/screen/register_screen.dart';
import 'package:booking_app/features/home/presentation/screen/home_screen.dart';
import 'package:booking_app/features/intro/presentations/00_splash/screen/splash_screen.dart';
import 'package:booking_app/features/intro/presentations/01_onboarding/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String homeRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => di<GetStorage>().read("userToken") != null
              ? const LoginScreen()
              : const SplashScreen(),
        );
      case Routes.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.onRouteFound),
        ),
        body: const Center(child: Text(AppStrings.onRouteFound)),
      ),
    );
  }
}
