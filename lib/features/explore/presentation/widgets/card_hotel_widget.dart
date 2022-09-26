import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/font_manager.dart';
import 'package:booking_app/core/utils/styles_manager.dart';

import 'package:booking_app/features/explore/domain/hotel_model.dart';
import 'package:booking_app/features/explore/presentation/screen/hotel_screen.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';

class CardHotelWidget extends StatelessWidget {
  const CardHotelWidget({
    super.key,
    required this.data,
  });

  final DataHotelModel data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HotelScreen(
          id: data.id,
          images: data.images,
          title: data.name,
          price: data.price,
          rawRating: data.rate,
          address: data.address,
          desc: data.description,
        ),
      )),
      child: Card(
        elevation: 1,
        color: ColorManager.darkGrey,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: .35.sh,
                child: Builder(builder: (context) {
                  if (data.images.isEmpty) {
                    return Image.asset(ImageAssets.appLogo);
                  }
                  return CachedNetworkImage(
                      errorWidget: (context, url, error) {
                        return Image.asset(ImageAssets.appLogo);
                      },
                      fit: BoxFit.cover,
                      width: double.infinity,
                      imageUrl: data.images[0].image);
                })),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 60),
                width: context.width,
                color: ColorManager.darkGrey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        color: ColorManager.grey1,
                        height: 1,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.name,
                            style: getBoldStyle(
                                fontSize: FontSize.s24.sp,
                                color: ColorManager.white),
                          ),
                          Text(
                            "\$ ${data.price}",
                            style: getBoldStyle(
                                fontSize: FontSize.s24.sp,
                                color: ColorManager.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.address,
                            style: getLightStyle(
                                fontSize: FontSize.s17.sp,
                                color: ColorManager.grey),
                          ),
                          Text(
                            "/per night",
                            style: getLightStyle(
                                fontSize: FontSize.s17.sp,
                                color: ColorManager.grey),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          RatingBar.builder(
                            ignoreGestures: true,
                            initialRating: (double.parse(data.rate) * 5 / 10),
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: FontSize.s20.sp,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: ColorManager.primary,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(
                            '  80 Reviews',
                            style: getLightStyle(
                                fontSize: FontSize.s17.sp,
                                color: ColorManager.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
