import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/font_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/my_circular_indicator.dart';
import 'package:booking_app/features/explore/domain/hotel_model.dart';
import 'package:booking_app/features/map/presentation/cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mit_x/mit_x.dart';

class BuildHotels extends StatelessWidget {
  const BuildHotels({
    Key? key,
    required this.mapCubit,
    required this.googleMapController,
    required this.state,
    required this.scrollController,
  }) : super(key: key);

  final MapCubit mapCubit;
  final state;
  final GoogleMapController? googleMapController;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: context.width,
        height: context.height * .16,
        child: Row(
          children: [
            Expanded(
              child: ListView.separated(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: mapCubit.hotelModel?.data.length ?? 0,
                itemBuilder: (context, index) {
                  DataHotelModel data = mapCubit.hotelModel!.data[index];
                  return GestureDetector(
                    onTap: () {
                      googleMapController?.animateCamera(
                          CameraUpdate.newLatLngZoom(
                              LatLng(double.parse(data.latitude),
                                  double.parse(data.longitude)),
                              14));
                    },
                    child: SizedBox(
                      height: context.height * .15,
                      width: context.width * .8,
                      child: Row(
                        children: [
                          // image section
                          Container(
                            width: context.width * .3,
                            height: context.height * .15,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(AppSize.s20),
                                bottomLeft: Radius.circular(AppSize.s20),
                              ),
                              color: ColorManager.grey,
                              image: DecorationImage(
                                  image: NetworkImage(data.images[0].image),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          // text Container
                          Expanded(
                            child: Container(
                              height: AppSize.s150,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(AppSize.s20),
                                  bottomRight: Radius.circular(AppSize.s20),
                                ),
                                color: ColorManager.grey.withOpacity(0.3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  AppPadding.p16,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      maxLines: 1,
                                      data.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    const SizedBox(
                                      height: AppSize.s8,
                                    ),
                                    Text(
                                      data.address,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            color: ColorManager.grey,
                                          ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on_outlined,
                                                  color: ColorManager.primary,
                                                  size: AppSize.s16,
                                                ),
                                                Text(
                                                  "3.0Km",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!
                                                      .copyWith(
                                                        color:
                                                            ColorManager.grey,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            RatingBar.builder(
                                              ignoreGestures: true,
                                              initialRating:
                                                  double.parse(data.rate) *
                                                      5 /
                                                      10,
                                              minRating: 0,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: FontSize.s20.sp,
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              ' \$100',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                            Text(
                                              '/per night',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium!
                                                  .copyWith(
                                                    color: ColorManager.grey,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
              ),
            ),
            if (state is MapSearchState)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  MyCircularIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
