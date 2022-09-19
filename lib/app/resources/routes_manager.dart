import 'package:flutter/material.dart';
import 'package:mit_x/mit_x.dart';

import '../../test_screen/test_screen.dart';

class Routes {
  static const String main = "/";
  // static const String selectLanguageViw = "/selectLanguageViw";
  // static const String onBoarding = "/onBoarding";
}

class RoutesManager {
  static Route<dynamic>? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return mitXMaterialPageRoute(page: const TestScreen());
    }
    return null;
  }
}
