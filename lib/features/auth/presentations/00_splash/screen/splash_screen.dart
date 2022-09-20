import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.backgroundSplash),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p60,
            right: AppPadding.p20,
            left: AppPadding.p20,
            bottom: AppPadding.p30,
          ),
          child: Column(
            children: [
              Container(
                width: AppSize.s100,
                height: AppSize.s100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: ColorManager.white,
                ),
                child: const Image(
                  image: AssetImage(ImageAssets.appLogo),
                  height: AppSize.s60,
                  width: AppSize.s60,
                ),
              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              Text(
                'Motel',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: AppSize.s8,
              ),
              Text(
                'Best hotel deals for your holiday ',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Spacer(),
              MainButton(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.onboardingRoute);
                },
                title: 'Get Started',
              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              Text(
                'Already have account ? Login',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
