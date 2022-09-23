import 'package:booking_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:mit_x/mit_x.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width,
        child: Drawer(
          backgroundColor: ColorManager.background,
        ));
  }
}
