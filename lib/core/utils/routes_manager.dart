import 'package:booking_app/app/di.dart';
import 'package:booking_app/features/auth/login/data/presentation/screen/login_screen.dart';
import 'package:booking_app/features/auth/update_profile/presentation/edit_profile_screen.dart';
import 'package:booking_app/features/auth/register/presentation/screen/register_screen.dart';
import 'package:booking_app/features/explore/presentation/screen/explore_screen.dart';
import 'package:booking_app/features/intro/presentations/00_splash/screen/splash_screen.dart';
import 'package:booking_app/features/intro/presentations/01_onboarding/screen/onboarding_screen.dart';
import 'package:booking_app/features/home/presentation/tabs/settings/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../features/home/presentation/screen/main_screen.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String homeRoute = '/main';
  static const String settings = '/settings';
  static const String editProfile = '/editProfile';
  static const String exploreScreen = '/exploreScreen';
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
          builder: (_) => const MainScreen(),
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfileScreen(),
        );
      case Routes.exploreScreen:
        return MaterialPageRoute(
          builder: (_) => const ExploreScreen(),
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
