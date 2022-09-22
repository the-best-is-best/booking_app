import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final String label;
  final String? Function(String?) validate;
  TextEditingController textController ;

  InputFieldWidget({
    Key? key,
    required this.label,
    required this.validate,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:  AppPadding.p16 ,
          vertical: AppPadding.p8 ,
          ),
          child: Row(
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: AppSize.s16,
                      color: ColorManager.grey,
                    ),
              ),
              const SizedBox(
                width: AppSize.s14,
              ),
              Expanded(
                child: TextFormField(
                  controller: textController,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: AppSize.s16,
                        color: ColorManager.white,
                      ),
                  validator: validate,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    fillColor: ColorManager.background,
                    labelStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: AppSize.s16,
                          color: ColorManager.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: ColorManager.grey1,
          height: 1,
        ),
      ],
    );
  }
}
