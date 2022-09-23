import 'package:booking_app/app/resources/images_manager.dart';
import 'package:booking_app/features/explore/domain/hotels_model.dart';
import 'package:booking_app/features/explore/presentation/explore/cubit/explore_cubit.dart';
import 'package:booking_app/features/explore/presentation/explore/widgets/hotel_card.dart';
import 'package:booking_app/features/explore/presentation/filter/cubit/filter_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mit_x/mit_x.dart';

class FilterView extends StatefulWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

String? hotelName;

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    FilterCubit filterCubit = FilterCubit.get(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.0,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.clear,
              ),
            ),
            Text(
              "Search",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  hotelName = value;
                });
              },
              style: TextStyle(color: Colors.grey),
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
            Expanded(
              child: FutureBuilder<HotelsModel?>(
                  future:
                      filterCubit.hotels(name: hotelName, count: 100, page: 0),
                  builder: (context, snapshot) {
                    final hotels = snapshot.data;
                    if (snapshot.data == null) return SizedBox.shrink();
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final hotel = hotels.data.data[index];
                        return HotelCard(data: hotel);
                      },
                      itemCount: hotels!.data.data.length,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
