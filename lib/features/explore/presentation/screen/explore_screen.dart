import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/font_manager.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/utils/styles_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/input_field.dart';
import 'package:booking_app/core/widgets/my_circular_indicator.dart';
import 'package:booking_app/features/explore/domain/hotel_model.dart';
import 'package:booking_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:booking_app/features/explore/presentation/widgets/card_hotel_widget.dart';
import 'package:booking_app/features/explore/presentation/widgets/filter_drawer.dart';
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
  final TextEditingController nameTextController = TextEditingController();

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
      drawer: const FilterDrawer(),
      appBar: AppBar(
        leading: const SizedBox(),
        centerTitle: true,
        title: Text(
          "Explore",
          style: getBoldStyle(color: Colors.white, fontSize: FontSize.s22),
        ),
        actions: [
          IconButton(
              onPressed: () {
                MitX.toNamed(Routes.mapScreen);
              },
              icon: const Icon(Icons.map_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: InputField(
                      style: getRegularStyle(
                          color: ColorManager.grey2, fontSize: FontSize.s20.sp),
                      label: '',
                      hint: 'Name',
                      textController: nameTextController,
                      validate: (String? val) {
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        exploreCubit.searchHotelByName(name: value!);
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
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
                ],
              ),
              const SizedBox(height: 15),
              BlocConsumer<ExploreCubit, ExploreState>(
                  buildWhen: (previous, current) =>
                      current is ExploreErrorState ||
                      current is ExploreLoadState ||
                      current is ExploreLoadedState,
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
                  },
                  builder: (context, state) {
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
                          return CardHotelWidget(data: data);
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


