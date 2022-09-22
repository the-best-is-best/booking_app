import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/values_manager.dart';

class CarouselSliderImagesWidget extends StatelessWidget {
   bool _isScroll;
   CarouselSliderImagesWidget(this._isScroll,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> imagesSlider = [
      ImageAssets.explore_1,
      ImageAssets.explore_2,
      ImageAssets.explore_3,
    ];
    CarouselController carouselController = CarouselController();
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * 0.6,
        initialPage: 0,
        disableCenter: true,
        reverse: false,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        enableInfiniteScroll: true,
        viewportFraction: 1,
      ),
      carouselController: carouselController,
      items: imagesSlider.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(alignment: Alignment.bottomLeft, children: [
              Image.asset(
                i,
                fit: BoxFit.cover,
                width: double.infinity,
                height: size.height * 0.6,
              ),
              _isScroll
                  ? Container()
                  : Container(
                width: AppSize.s100 * 2,
                height: AppSize.s100 * 1.5,
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p12, vertical: AppPadding.p20),
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Cape Town',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Extraordinary five-star outdoor actives',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: ColorManager.white),
                    ),
                    const SizedBox(height: 5),
                    MainButton(
                      onTap: () {},
                      width: AppSize.s100,
                      height: AppSize.s30,
                      title: 'View hotel',
                      textStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: ColorManager.white),
                    )
                  ],
                ),
              ),
            ]);
          },
        );
      }).toList(),
    );
  }
}
