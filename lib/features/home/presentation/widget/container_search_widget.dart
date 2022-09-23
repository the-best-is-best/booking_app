import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:mit_x/mit_x.dart';

class ContainerSearchWidget extends StatelessWidget {
  const ContainerSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.07,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m12),
        padding: const EdgeInsets.symmetric(horizontal: AppMargin.m12),
        decoration: BoxDecoration(
          color: ColorManager.darkGrey,
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: InkWell(
          onTap: () {
            MitX.toNamed(Routes.exploreScreen);
          },
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: ColorManager.primary,
                size: AppSize.s25,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Text(
                'Where are you going ?',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: ColorManager.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
