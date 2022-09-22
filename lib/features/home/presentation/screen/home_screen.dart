import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  bool _isScrll = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _isScrll = _isSliverAppBarEx;
        });
      });
  }

  bool get _isSliverAppBarEx {
    return _scrollController.hasClients && _scrollController.offset > (250);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> imagesSlider = [
      ImageAssets.explore_1,
      ImageAssets.explore_2,
      ImageAssets.explore_3,
    ];
    CarouselController carouselController = CarouselController();

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leadingWidth: double.infinity,
            toolbarHeight: size.height * 0.1,
            collapsedHeight: size.height * 0.25,
            title: containerSearch(size, context),
            stretch: false,
            pinned: true,
            expandedHeight: size.height * 0.6,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                title: carouselSliderImages(
                    size, carouselController, imagesSlider)),
          ),
          SliverToBoxAdapter(
              child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => _bulidListHotelItems(),
            itemCount: 10,
          )),
        ],
      ),
    );
  }

  CarouselSlider carouselSliderImages(Size size,
      CarouselController carouselController, List<String> imagesSlider) {
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
              _isScrll
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

  InkWell containerSearch(Size size, BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.06,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m12),
        padding: const EdgeInsets.symmetric(horizontal: AppMargin.m12),
        decoration: BoxDecoration(
          color: ColorManager.darkGrey,
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: ColorManager.primary,
              size: AppSize.s25,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              'Where are you going ?',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: ColorManager.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bulidListHotelItems() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(
          right: AppMargin.m20,
          left: AppMargin.m20,
          bottom: AppSize.s20,
        ),
        child: Row(
          children: [
            // image section
            Container(
              width: 150,
              height: AppSize.s150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s20),
                  bottomLeft: Radius.circular(AppSize.s20),
                ),
                color: ColorManager.grey,
                image: DecorationImage(
                    image: AssetImage(ImageAssets.explore_1),
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
                        'Queen Hotel',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      Text(
                        'Wembley, London',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: ColorManager.grey,
                            ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: ColorManager.primary,
                                    size: AppSize.s16,
                                  ),
                                  Text(
                                    ' 3.0 Km to city ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          color: ColorManager.grey,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    const Icon(
                                      Icons.star,
                                      color: ColorManager.primary,
                                      size: AppSize.s16,
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
                                style:
                                    Theme.of(context).textTheme.displayMedium,
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
  }
}
