import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/font_manager.dart';
import 'package:booking_app/core/utils/styles_manager.dart';
import 'package:booking_app/core/widgets/input_field.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:booking_app/features/explore/domain/facilities_models.dart';
import 'package:booking_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  final TextEditingController addressTextController = TextEditingController();
  @override
  void initState() {
    ExploreCubit exploreCubit = ExploreCubit.get(context);
    addressTextController.text = exploreCubit.addressTextController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ExploreCubit exploreCubit = ExploreCubit.get(context);
    return SafeArea(
      child: SizedBox(
          width: context.width,
          child: Drawer(
            backgroundColor: ColorManager.background,
            child: Stack(
              children: [
                SizedBox(
                  height: context.height * .85,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              MitX.back();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: ColorManager.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Filter",
                                style: getBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s28.sp),
                              ),
                              CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        exploreCubit.clearFilter();
                                        MitX.back();
                                      },
                                      icon: const Icon(Icons.filter_alt_off)))
                            ],
                          ),
                          const SizedBox(height: 20),
                          InputField(
                            style: getRegularStyle(
                                color: ColorManager.grey2,
                                fontSize: FontSize.s20.sp),
                            label: 'Address',
                            textController: addressTextController,
                            validate: (String? val) {
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Price (for 1 night)",
                            style: getRegularStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s20.sp),
                          ),
                          const SizedBox(height: 10),
                          BlocBuilder<ExploreCubit, ExploreState>(
                            buildWhen: (previous, current) =>
                                current is ChangePriceMainAndMaxState,
                            builder: (context, state) {
                              return SfRangeSlider(
                                activeColor: ColorManager.primary,
                                showTicks: true,
                                showLabels: true,
                                showDividers: true,
                                min: 100,
                                max: 10000,
                                onChanged: (SfRangeValues value) {
                                  exploreCubit.changeSfRangePrice(value);
                                },
                                values: exploreCubit.sfRangePrice,
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "Popular filter",
                            style: getRegularStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s20.sp),
                          ),
                          BlocBuilder<ExploreCubit, ExploreState>(
                            buildWhen: (previous, current) =>
                                current is FacilitiesActiveState,
                            builder: (context, state) {
                              List<FacilitiesModels> facilities =
                                  exploreCubit.facilitiesModel!;
                              return GridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  childAspectRatio: 3,
                                  crossAxisCount: 2,
                                  // Generate 100 widgets that display their index in the List.
                                  children:
                                      List.generate(facilities.length, (index) {
                                    return Center(
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            activeColor: ColorManager.primary,
                                            fillColor: MaterialStatePropertyAll<
                                                Color>(exploreCubit
                                                    .facilitiesActive[index]!
                                                ? ColorManager.primary
                                                : ColorManager.grey1),
                                            value: exploreCubit
                                                .facilitiesActive[index]!,
                                            onChanged: (bool? value) {
                                              exploreCubit
                                                  .checkFacilities(index);
                                            },
                                          ),
                                          const SizedBox(width: 5),
                                          // CachedNetworkImage(
                                          //   imageUrl: facilities[index].image,
                                          //   errorWidget: (context, url, error) =>
                                          //       const Icon(Icons.error),
                                          // ),
                                          const SizedBox(width: 5),
                                          Text(facilities[index].name,
                                              style: getRegularStyle(
                                                color: ColorManager.white,
                                                fontSize: FontSize.s16.sp,
                                              )),
                                        ],
                                      ),
                                    );
                                  }));
                            },
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Distance from city center",
                            style: getRegularStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s20.sp),
                          ),
                          const SizedBox(height: 5),
                          BlocBuilder<ExploreCubit, ExploreState>(
                            buildWhen: (previous, current) =>
                                current is ChangeDistanceState,
                            builder: (context, state) {
                              return Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "Less than ${exploreCubit.sfRangeDistance.toStringAsFixed(1)} Km",
                                      style: getRegularStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s20.sp),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SfSlider(
                                    activeColor: ColorManager.primary,
                                    showTicks: true,
                                    showLabels: true,
                                    showDividers: true,
                                    min: 0,
                                    max: 10,
                                    onChanged: (value) {
                                      exploreCubit
                                          .changeSfSliderDistance(value);
                                    },
                                    value: exploreCubit.sfRangeDistance,
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 15,
                    left: 12,
                    right: 12,
                    child: MainButton(
                      width: context.width * .9,
                      onTap: () {
                        MitX.back();
                        exploreCubit.searchHotel(
                            address: addressTextController.text);
                      },
                      title: "Apply",
                    )),
              ],
            ),
          )),
    );
  }
}
