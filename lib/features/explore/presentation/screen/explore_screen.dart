import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/font_manager.dart';
import 'package:booking_app/core/utils/styles_manager.dart';
import 'package:booking_app/core/widgets/input_field.dart';
import 'package:booking_app/core/widgets/my_circular_indicator.dart';
import 'package:booking_app/features/explore/domain/hotel_model.dart';
import 'package:booking_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:booking_app/features/explore/presentation/widgets/filter_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController cityTextController = TextEditingController();
  @override
  void initState() {
    ExploreCubit exploreCubit = ExploreCubit.get(context);
    exploreCubit.getHotels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ExploreCubit exploreCubit = ExploreCubit.get(context);
    return Scaffold(
      key: MitX.scaffoldKey,
      drawer: FilterDrawer(),
      appBar: AppBar(
        leading: const SizedBox(),
        centerTitle: true,
        title: Text(
          "Explore",
          style: getBoldStyle(color: Colors.white, fontSize: FontSize.s22),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.map_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.width * .8,
                    child: InputField(
                      style: getRegularStyle(
                          color: ColorManager.grey2, fontSize: FontSize.s20.sp),
                      label: '',
                      hint: 'Egypt',
                      textController: cityTextController,
                      validate: (String? val) {
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      width: context.width * .15,
                      child: CircleAvatar(
                        child: IconButton(
                          icon: const Icon(Icons.filter_alt_outlined),
                          onPressed: () {
                            MitX.openDrawer();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              BlocConsumer<ExploreCubit, ExploreState>(
                  listener: (context, state) {
                if (state is ExploreErrorState) {
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
                                  fontSize: FontSize.s20.sp),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ));
                  }
                }
              }, builder: (context, state) {
                if (state is ExploreLoadedState) {
                  if (exploreCubit.hotelModel?.data.isEmpty ?? true) {
                    return Center(
                      child: Text(
                        "No Hotel Available",
                        style: getRegularStyle(
                            color: Colors.white, fontSize: FontSize.s20.sp),
                      ),
                    );
                  }
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: exploreCubit.hotelModel?.data.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      DataHotelModel data =
                          exploreCubit.hotelModel!.data[index];
                      return Card(
                        elevation: 0,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Stack(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                height: .3.sh,
                                child: Builder(builder: (context) {
                                  if (data.images.isEmpty) {
                                    return Icon(Icons.error);
                                  }
                                  return CachedNetworkImage(
                                      errorWidget: (context, url, error) {
                                        return Icon(Icons.error);
                                      },
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      imageUrl: data.images[0].image);
                                })),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 60),
                                width: context.width,
                                color: ColorManager.darkGrey,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                      const SizedBox(height: 10)
                                    ]),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                  );
                }
                return SizedBox(
                  height: context.height * .75,
                  child: const Center(
                    child: MyCircularIndicator(),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
