import 'package:booking_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color colorBorder;
  final double? height;
  final double width;
  final double borderRadius;
  final VoidCallback onTap;

  // ignore: use_key_in_widget_constructors
  const MainButton({
    this.title = "",
    this.color = ColorManager.primary,
    this.colorBorder = ColorManager.primary,
    this.height,
    this.width = double.infinity,
    this.borderRadius = 30,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? size.height * 0.07,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: colorBorder, width: 1)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
