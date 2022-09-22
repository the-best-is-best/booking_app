import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PopularDestinationWidget extends StatelessWidget {
  const PopularDestinationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: AppSize.s150,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        5,
            (index) =>  Container(

              width: size.width *0.65,
              height: AppSize.s150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.s20),
                ),
                color: ColorManager.grey,
                image: DecorationImage(
                    image: AssetImage(ImageAssets.explore_1),
                    fit: BoxFit.cover),
              ),

            ),
      ),
    );

  }
}
