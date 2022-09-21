import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:booking_app/features/presentations/01_onboarding/widget/onboardind_data.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController onboardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: onboardController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => AppData.introPages[index],
                onPageChanged: (index) {
                  if (index == AppData.introPages.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemCount: AppData.introPages.length,
              ),
            ),
            const SizedBox(height: 10),
            SmoothPageIndicator(
              controller: onboardController,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: ColorManager.primary,
                expansionFactor: 3,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 10,
              ),
              count: AppData.introPages.length,
            ),
            const SizedBox(height: 15),
            MainButton(
              onTap: () {
                if (isLast) {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                } else {
                  onboardController.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                }
              },
              title: isLast ? 'Login' : 'Next',
            ),
            const SizedBox(height: 15),
            MainButton(
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.registerRoute);
              },
              title: 'Create account',
              color: ColorManager.grey,
              colorBorder: ColorManager.grey,
            ),
            // SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
