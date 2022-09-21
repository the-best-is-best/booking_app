import 'package:booking_app/app/resources/images_manager.dart';
import 'package:booking_app/features/explore/domain/hotels_model.dart';
import 'package:booking_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:booking_app/features/explore/presentation/widgets/hotel_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mit_x/mit_x.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    ExploreCubit explorCubit = ExploreCubit.get(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<HotelsModel?>(
          future: explorCubit.hotels(count: 100, page: 0),
          builder: (context, snapshot) {
            final hotels = snapshot.data;
            if (snapshot.data == null) return SizedBox.shrink();
            return CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  // title: Text("title"),

                  leading: SizedBox.shrink(),
                  floating: true,
                  stretch: true,
                  flexibleSpace: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/appIcon.png"),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.green,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Where are you going?",
                      ),
                    ),
                    // height: 200,
                  ),
                  expandedHeight: 350,
                  // toolbarHeight: 200,
                  collapsedHeight: 120,
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final hotel = hotels.data.data[index];
                      return HotelCard(data: hotel);
                    },
                    // Builds 1000 ListTiles
                    childCount: hotels!.data.data.length,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
