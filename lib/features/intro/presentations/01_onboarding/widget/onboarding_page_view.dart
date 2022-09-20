import 'package:booking_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  final String image;
  final String headline;
  final String description;

  // ignore: use_key_in_widget_constructors
  const OnBoardingPageView(
      {required this.image, required this.headline, required this.description});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: size.width * 0.7,
              height: size.height * 0.5,
            ),
            const SizedBox(height: 20),
            Text(headline,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: ColorManager.white),
                textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Text(description,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
