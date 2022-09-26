import 'package:animate_do/animate_do.dart';
import 'package:booking_app/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FadeInUp(
              duration: const Duration(milliseconds: 1300),
              child: Text(
                title,
                style: Theme.of(context).textTheme.displayMedium,
              )),
        ),
      ],
    );
  }
}
