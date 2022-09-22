import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:mit_x/mit_x.dart';

class ContainerEditProfileWidget extends StatelessWidget {
  const ContainerEditProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  AppPadding.p16),
      child: GestureDetector(
        onTap: () {
          MitX.toNamed(Routes.editProfile);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Osama Sabry',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: AppSize.s20),
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                Text(
                  'View and Edit Profile',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: AppSize.s16,
                        color: ColorManager.grey,
                      ),
                ),
              ],
            ),
            CircleAvatar(
              radius: 35,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: const CircleAvatar(
                radius: 33,
                backgroundImage: AssetImage(
                  ImageAssets.appLogo,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
