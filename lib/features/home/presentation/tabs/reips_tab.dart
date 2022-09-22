import 'package:booking_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class TripsTab extends StatelessWidget {
  const TripsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Trips"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              color: ColorManager.grey2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "UpComing",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorManager.white.withOpacity(.5)),
                      ),
                    ),
                    Text(
                      "Completed",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Cancelled",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
