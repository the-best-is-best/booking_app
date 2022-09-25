import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableTextWidgets extends StatefulWidget {
  final String text;
  const ExpandableTextWidgets({Key? key, required this.text })
      : super(key: key);

  @override
  State<ExpandableTextWidgets> createState() => _ExaState();
}

class _ExaState extends State<ExpandableTextWidgets> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = 100;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(
         firstHalf,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(
          fontSize: FontSize.s20.sp,
          color: ColorManager.grey,
        ),
      )
          : Column(
        children: [
          Text(
             hiddenText
                ? ('$firstHalf...')
                : (firstHalf + secondHalf),
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(
              fontSize: FontSize.s20.sp,
              color: ColorManager.grey,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                Text(
                   hiddenText ? 'Show more' : 'Show less',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(
                    fontSize: FontSize.s20.sp,
                    color: ColorManager.primary,
                  ),
                ),
                Icon(
                  hiddenText
                      ? Icons.arrow_drop_down
                      : Icons.arrow_drop_up,
                  color: ColorManager.primary,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

