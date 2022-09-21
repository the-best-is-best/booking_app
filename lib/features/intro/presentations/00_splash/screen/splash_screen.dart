import 'package:booking_app/app/di.dart';
import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mit_x/mit_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
                  MitX.offNamed(Routes.onboardingRoute);
                },
                title: 'Get Started',
              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have account ?   ',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorManager.white)),
                  GestureDetector(
                      onTap: () {
                        MitX.toNamed(Routes.loginRoute);
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: ColorManager.primary),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
