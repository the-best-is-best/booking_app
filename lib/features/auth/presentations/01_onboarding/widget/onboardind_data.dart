import 'package:booking_app/core/utils/assets_manager.dart';

import 'onboarding_page_view.dart';

class AppData {
  static List<OnBoardingPageView> introPages = [
    const OnBoardingPageView(
        image: ImageAssets.onBoardingLogo1,
        headline: "plan your trips",
        description: " Book one of your unique hotel to escape the ordinary"),
    const OnBoardingPageView(
        image: ImageAssets.onBoardingLogo2,
        headline: " Find best deals ",
        description:
            " Find deals for any season from cosy country homes to city flats"),
    const OnBoardingPageView(
        image: ImageAssets.onBoardingLogo3,
        headline: "Beast tramelling all time ",
        description:
            " Find deals for any season from cosy country homes to city flats"),
  ];
}
