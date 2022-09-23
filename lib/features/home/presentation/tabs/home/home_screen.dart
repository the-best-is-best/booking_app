import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/features/home/presentation/widget/carousel_slider_images_widget.dart';
import 'package:booking_app/features/home/presentation/widget/container_search_widget.dart';
import 'package:booking_app/features/home/presentation/widget/popular_destination_widget.dart';
import 'package:flutter/material.dart';
import '../../widget/list_hotel_items_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  bool _isScroll = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _isScroll = _isSliverAppBarEx;
        });
      });
  }

  bool get _isSliverAppBarEx {
    return _scrollController.hasClients && _scrollController.offset > (250);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leadingWidth: double.infinity,
            toolbarHeight: size.height * 0.1,
            collapsedHeight: size.height * 0.25,
            title: const ContainerSearchWidget(),
            stretch: false,
            pinned: true,
            expandedHeight: size.height * 0.65,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                title: CarouselSliderImagesWidget(_isScroll)),
          ),
          SliverToBoxAdapter(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal:  AppSize.s20 ,vertical: AppSize.s12),
                child: Text(
                  'Popular Destination ',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(AppSize.s20),
                child: PopularDestinationWidget(),
              ),
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal:  AppSize.s20 ,vertical: AppSize.s12),
                child: Row(
                  children: [
                    Text(
                      'Best Deals',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const Spacer(),
                    Text(
                      'View all',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(color: ColorManager.primary,),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: ColorManager.primary,
                      size: AppSize.s16,
                    )
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => const ListHotelItemsWidget(),
                itemCount: 10,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
