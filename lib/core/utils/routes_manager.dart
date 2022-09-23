import 'package:booking_app/features/auth/login/data/presentation/screen/login_screen.dart';
import 'package:booking_app/features/auth/register/presentaion/screen/register_screen.dart';
import 'package:booking_app/features/explore/presentation/explore/cubit/explore_view.dart';
import 'package:booking_app/features/explore/presentation/filter/cubit/filter_view.dart';
import 'package:booking_app/features/home/presentation/screen/home_screen.dart';
import 'package:booking_app/features/intro/presentations/00_splash/screen/splash_screen.dart';
import 'package:booking_app/features/intro/presentations/01_onboarding/screen/onboarding_screen.dart';

import 'package:flutter/material.dart';

import 'strings_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String homeRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
  static const String exploreRoute = '/exploreDetails';
  static const String filterRoute = '/filterDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
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
      case Routes.exploreRoute:
        return MaterialPageRoute(
          builder: (_) => const ExploreView(),
        );
      case Routes.filterRoute:
        return MaterialPageRoute(
          builder: (_) => const FilterView(),
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
