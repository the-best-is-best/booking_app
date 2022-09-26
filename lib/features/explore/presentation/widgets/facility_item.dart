import 'package:booking_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FacilityItem extends StatelessWidget {
  final String svgPath;

  const FacilityItem({Key? key, required this.svgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: ColorManager.darkGrey,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: SvgPicture.asset(
          width: 380,
          height: 180,
          color: ColorManager.white,
          svgPath,
        ),
      ),
    );
  }
}
