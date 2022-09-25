import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/font_manager.dart';
import 'package:booking_app/core/utils/styles_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:booking_app/features/explore/presentation/widgets/expandable_text_widgets.dart';
import 'package:booking_app/features/explore/presentation/widgets/overall_ratting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({Key? key}) : super(key: key);

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
              title: Image.asset(
                ImageAssets.hotel_1,
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
                              'Queen Hotel',
                              style: getBoldStyle(
                                  fontSize: FontSize.s30.sp,
                                  color: ColorManager.white),
                            ),
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Wembley, London  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        fontSize: FontSize.s20.sp,
                                        color: ColorManager.grey,
                                      ),
                                ),
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: ColorManager.primary,
                                  size: AppSize.s20,
                                ),
                                Text(
                                  '3.0 Km to city ',
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ' \$100',
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
                        const ExpandableTextWidgets(
                            text:
                                '''Essay Soft Essay Generator takes an essay question and keywords as input, and generates creative high quality essay articles that are free of plagiarism, fully automatic in just a few seconds. No matter what essay topic you have been given, our essay generator will be able to complete your essay without any hassle. If you need instant help with any content writing tasks including essays, assignments, article, reports...etc. EssaySoft Essay Generator is the software you know you can trust, simply click your mouse button to produce work to amaze your teachers and professors.
                    ''')
                      ],
                    ),
                  ),
                  const OverallRattingWidget(),
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
                  getPhotos(size),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p12),
                    child: MainButton(
                      onTap: () {},
                      title: 'Book Now',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getPhotos(size) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: size.width * 0.3,
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
        ),
      ),
    );
  }
}
