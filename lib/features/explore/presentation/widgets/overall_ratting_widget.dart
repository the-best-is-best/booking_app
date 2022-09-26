import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/font_manager.dart';
import 'package:booking_app/core/utils/styles_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverallRattingWidget extends StatelessWidget {
  final String rate;
  const OverallRattingWidget({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: double.infinity,
      margin: const EdgeInsets.all(AppMargin.m12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s18),
        color: ColorManager.darkGrey,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    rate,
                    style: getBoldStyle(
                        fontSize: FontSize.s32.sp, color: ColorManager.primary),
                  ),
                  Text(
                    ' Overall rating',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: FontSize.s20.sp,
                          color: ColorManager.grey,
                        ),
                  )
                ],
              ),
            ),
            overallRattingWidget(
              context: context,
              title: 'Room',
              width: size.width - 170,
            ),
            overallRattingWidget(
              context: context,
              title: 'Services',
              width: size.width - 250,
            ),
            overallRattingWidget(
              context: context,
              title: 'Location',
              width: size.width - 300,
            ),
            overallRattingWidget(
              context: context,
              title: 'Price',
              width: size.width - 200,
            ),
          ],
        ),
      ),
    );
  }

  Widget overallRattingWidget({
    required context,
    required String title,
    required double width,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p18,
        vertical: AppSize.s4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: FontSize.s20.sp,
                  color: ColorManager.grey,
                ),
          ),
          Container(
            height: 5,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s18),
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
    );
  }
}
