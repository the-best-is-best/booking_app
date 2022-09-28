import 'package:animate_do/animate_do.dart';
import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/font_manager.dart';
import 'package:booking_app/core/utils/styles_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:booking_app/core/widgets/my_circular_indicator.dart';
import 'package:booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:booking_app/features/explore/domain/hotel_model.dart';
import 'package:booking_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:booking_app/features/explore/presentation/widgets/expandable_text_widgets.dart';
import 'package:booking_app/features/explore/presentation/widgets/facility_item.dart';
import 'package:booking_app/features/explore/presentation/widgets/overall_ratting_widget.dart';
import 'package:booking_app/features/explore/presentation/widgets/section_title.dart';
import 'package:booking_app/features/home/presentation/tabs/trips/presentation/cubit/trips_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';

class HotelScreen extends StatefulWidget {
  final int id;

  final List<ImagesHotelModel> images;
  final String title;
  final String desc;
  final List<HotelFacilitiesModel> facilities;
  final String rawRating;
  final String price;
  final String address;
  const HotelScreen(
      {Key? key,
      required this.images,
      required this.title,
      required this.address,
      required this.rawRating,
      required this.price,
      required this.desc,
      required this.id,
      required this.facilities})
      : super(key: key);

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leadingWidth: double.infinity,
            toolbarHeight: size.height * 0.1,
            collapsedHeight: size.height * 0.2,
            stretch: false,
            pinned: true,
            expandedHeight: size.height * 0.4,
            floating: false,
            title: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorManager.white.withOpacity(0.5)),
              child: const BackButton(
                color: ColorManager.darkGrey,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: widget.images.isEmpty
                  ? Image.asset(
                      ImageAssets.hotel_1,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: size.height * 0.4,
                    )
                  : CachedNetworkImage(
                      imageUrl: widget.images[0].image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: size.height * 0.4,
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: getBoldStyle(
                                  fontSize: FontSize.s30.sp,
                                  color: ColorManager.white),
                            ),
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: context.width * .65,
                                  child: Text(
                                    widget.address,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          fontSize: FontSize.s16.sp,
                                          color: ColorManager.grey,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ' \$ ${widget.price}',
                              style: getBoldStyle(
                                  fontSize: FontSize.s30.sp,
                                  color: ColorManager.white),
                            ),
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            Text(
                              '/per night',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontSize: FontSize.s20.sp,
                                    color: ColorManager.grey,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: ColorManager.grey1,
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Summary',
                          style: getBoldStyle(
                              fontSize: FontSize.s20.sp,
                              color: ColorManager.white),
                        ),
                        const SizedBox(
                          height: AppSize.s4,
                        ),
                        ExpandableTextWidgets(text: widget.desc)
                      ],
                    ),
                  ),
                  OverallRattingWidget(rate: widget.rawRating),
                  Builder(builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(title: 'Facilities'),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                          child: FadeInUp(
                            duration: const Duration(milliseconds: 1100),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6,
                                crossAxisSpacing: 5,
                              ),
                              itemCount: widget.facilities.length,
                              itemBuilder: (context, index) {
                                List<String> facilitesIamge = [];
                                for (var element in widget.facilities) {
                                  for (var e in ExploreCubit.get(context)
                                      .facilitiesModel!) {
                                    if (element.facilityId == e.id.toString()) {
                                      facilitesIamge.add(e.image);
                                    }
                                  }
                                }

                                return FacilityItem(
                                    imageUrl: facilitesIamge[index]);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.s20, vertical: AppSize.s12),
                    child: Row(
                      children: [
                        Text(
                          'Photo',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const Spacer(),
                        Text(
                          'View all',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: ColorManager.primary,
                              ),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: ColorManager.primary,
                          size: AppSize.s16,
                        )
                      ],
                    ),
                  ),
                  getPhotos(size: size, images: widget.images),
                  BlocConsumer<TripsCubit, TripsState>(
                    listener: (context, state) {
                      if (state is CreateTripsState) {
                        MitX.showSnackbar(const MitXSnackBar(
                          duration: Duration(seconds: 2),
                          title: "",
                          message: "Booked",
                        ));
                      }
                    },
                    builder: (context, state) {
                      if (state is! TripsLoadingState) {
                        return Padding(
                          padding: const EdgeInsets.all(AppPadding.p12),
                          child: MainButton(
                            onTap: () {
                              TripsCubit tripsCubit = TripsCubit.get(context);
                              tripsCubit.createTrip(
                                  hotelId: widget.id,
                                  apiToken: AuthCubit.get(context)
                                      .userModel
                                      .apiToken);
                            },
                            title: 'Book Now',
                          ),
                        );
                      }
                      return const Center(
                        child: MyCircularIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getPhotos({required Size size, required List<ImagesHotelModel> images}) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          images.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: size.width * 0.3,
              height: AppSize.s150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppSize.s20),
                ),
                color: ColorManager.grey,
                image: DecorationImage(
                    image: NetworkImage(images[index].image),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // List<String> facilities = [
  //   "assets/icons/wifi.svg",
  //   "assets/icons/weightlift.svg",
  //   "assets/icons/drink.svg",
  //   "assets/icons/park.svg",
  //   "assets/icons/pool.svg"
  // ];
}
