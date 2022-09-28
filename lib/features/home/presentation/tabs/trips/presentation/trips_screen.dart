import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/font_manager.dart';
import 'package:booking_app/core/utils/styles_manager.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:booking_app/core/widgets/my_circular_indicator.dart';
import 'package:booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:booking_app/features/home/presentation/tabs/trips/domain/trips_model.dart';
import 'package:booking_app/features/home/presentation/tabs/trips/presentation/cubit/trips_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';

class TripsTab extends StatefulWidget {
  const TripsTab({Key? key}) : super(key: key);

  @override
  State<TripsTab> createState() => _TripsTabState();
}

class _TripsTabState extends State<TripsTab> {
  @override
  void initState() {
    TripsCubit tripsCubit = TripsCubit.get(context);
    AuthCubit authCubit = AuthCubit.get(context);
    tripsCubit.getTrips(tokenUser: authCubit.userModel.apiToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TripsCubit tripsCubit = TripsCubit.get(context);
    AuthCubit authCubit = AuthCubit.get(context);
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text("My Trips"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.08,
                child: Card(
                  color: ColorManager.grey2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: BlocBuilder<TripsCubit, TripsState>(
                    builder: (context, state) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: () {
                                  tripsCubit.changeCurrentPage(
                                      page: 1,
                                      tokenUser: authCubit.userModel.apiToken);
                                },
                                child: Text(
                                  "UpComing",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: FontSize.s18.sp,
                                          color: tripsCubit.currentTap == 1
                                              ? ColorManager.primary
                                              : ColorManager.white
                                                  .withOpacity(.5)),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                tripsCubit.changeCurrentPage(
                                    page: 2,
                                    tokenUser: authCubit.userModel.apiToken);
                              },
                              child: Text(
                                "Completed",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: FontSize.s18.sp,
                                        color: tripsCubit.currentTap == 2
                                            ? ColorManager.primary
                                            : ColorManager.white
                                                .withOpacity(.5)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: () {
                                  tripsCubit.changeCurrentPage(
                                      page: 3,
                                      tokenUser: authCubit.userModel.apiToken);
                                },
                                child: Text(
                                  "Cancelled",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: FontSize.s18.sp,
                                          color: tripsCubit.currentTap == 3
                                              ? ColorManager.primary
                                              : ColorManager.white
                                                  .withOpacity(.5)),
                                ),
                              ),
                            ),
                          ]);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // build hotels
              BlocConsumer<TripsCubit, TripsState>(listener: (context, state) {
                if (state is TripsErrorState) {
                  if (state.title?.isNotEmpty ?? false) {
                    MitX.defaultDialog(
                        title: "Error",
                        titleStyle: getRegularStyle(
                            color: Colors.black, fontSize: FontSize.s30.sp),
                        content: Column(
                          children: [
                            Text(
                              state.title!,
                              style: getRegularStyle(
                                  color: Colors.black,
                                  fontSize: FontSize.s24.sp),
                            ),
                            const SizedBox(height: 10),
                            MainButton(
                              onTap: () {
                                MitX.back();
                                tripsCubit.getTrips(
                                    tokenUser: authCubit.userModel.apiToken);
                              },
                              height: 40,
                              title: "Try Agin",
                            )
                          ],
                        ));
                  }
                }
              }, builder: (context, state) {
                if (state is TripsLoadedState) {
                  if (tripsCubit.tripsModel?.data.isEmpty ?? true) {
                    return Expanded(
                        child: Center(
                      child: Text(
                        "No Booking Available",
                        style: getRegularStyle(
                            color: Colors.white, fontSize: FontSize.s24.sp),
                      ),
                    ));
                  }
                  return Expanded(
                    child: ListView.separated(
                      itemCount: tripsCubit.tripsModel?.data.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        DataModelTrips data =
                            tripsCubit.tripsModel!.data[index];
                        return Card(
                          elevation: 0,
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: .6.sw,
                                child: data.dataHotel.images.isNotEmpty
                                    ? CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        errorWidget: (context, url, error) =>
                                            Image.asset(ImageAssets.appLogo),
                                        imageUrl:
                                            data.dataHotel.images[0].image)
                                    : Image.asset(ImageAssets.appLogo),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 60),
                                  width: context.width,
                                  color: ColorManager.background.withBlue(20),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: context.width * .5,
                                              child: Text(
                                                data.dataHotel.name,
                                                maxLines: 1,
                                                style: getBoldStyle(
                                                    fontSize: FontSize.s28.sp,
                                                    color: ColorManager.white),
                                              ),
                                            ),
                                            Text(
                                              "\$ ${data.dataHotel.price}",
                                              style: getBoldStyle(
                                                  fontSize: FontSize.s30.sp,
                                                  color: ColorManager.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: context.width * .6,
                                              child: Text(
                                                data.dataHotel.address,
                                                maxLines: 2,
                                                style: getLightStyle(
                                                    color: ColorManager.grey),
                                              ),
                                            ),
                                            Text(
                                              "/per night",
                                              style: getLightStyle(
                                                  color: ColorManager.grey),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              ignoreGestures: true,
                                              initialRating: (double.parse(
                                                      data.dataHotel.rate) *
                                                  5 /
                                                  10),
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
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                    ),
                  );
                }
                return const Expanded(
                    child: Center(
                  child: MyCircularIndicator(),
                ));
              })
            ],
          ),
        ));
  }
}
