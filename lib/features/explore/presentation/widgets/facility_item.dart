import 'package:booking_app/core/utils/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FacilityItem extends StatelessWidget {
  final String imageUrl;

  const FacilityItem({Key? key, required this.imageUrl}) : super(key: key);

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
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: 380,
            height: 180,
            color: Colors.white,
          )
          //  SvgPicture.asset(
          //   width: 380,
          //   height: 180,
          //   color: ColorManager.white,
          //   svgPath,
          // ),
          ),
    );
  }
}
