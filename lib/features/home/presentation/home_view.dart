import 'package:booking_app/app/resources/images_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mit_x/mit_x.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> imagesSlider = [
    ImagesManager.home1,
    ImagesManager.home2,
    ImagesManager.home3
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: context.height * .4,
            flexibleSpace: FlexibleSpaceBar(
                title: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: context.height * .4,
                      initialPage: 0,
                      disableCenter: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      enableInfiniteScroll: true),
                  items: imagesSlider.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          i,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
