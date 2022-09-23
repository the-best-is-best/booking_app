import 'package:booking_app/features/explore/domain/hotels_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({super.key, required this.data});
  final Datum data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        // padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: (data.hotelImages.isNotEmpty &&
                      data.hotelImages[0].image == null)
                  ? Placeholder()
                  : Image.asset("assets/images/appIcon.png"),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                      // style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      data.description,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    data.address,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  )
                                ],
                              ),
                              RatingBar.builder(
                                initialRating: double.tryParse(data.rate) ?? 1,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 18,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.green,
                                ),
                                unratedColor: Colors.grey,
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )
                            ],
                          ),
                        ),
                        Text(
                          "${data.price}\$",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
