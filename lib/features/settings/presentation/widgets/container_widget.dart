import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ContainerWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: AppSize.s16,
                        color: ColorManager.white,
                      ),
                ),
                 Icon(
                  icon,
                  color: ColorManager.grey1,
                  size: AppSize.s25,
                )
              ],
            ),
          ),
        ),

        const Divider(
          color: ColorManager.grey1,
          height: 1,
        ),
      ],
    );
  }
}
