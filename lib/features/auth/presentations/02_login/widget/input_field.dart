import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

import 'input_field_label.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final int maxLine;
  final TextInputType inputType;
  final IconData? prefix;
  final bool isPassword;
  final IconData? suffix;
  final dynamic suffixPressed;
  final String? Function(String?) validate;
  final String? Function(String?)? onFieldSubmitted;
  TextEditingController textController = TextEditingController();

  // ignore: use_key_in_widget_constructors
  InputField({
    required this.textController,
    required this.label,
    this.hint = "",
    this.maxLine = 1,
    this.inputType = TextInputType.text,
    this.prefix,
    this.isPassword = false,
    this.suffix,
    this.suffixPressed,
    required this.validate,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputFieldLabel(label),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: TextFormField(
              controller: textController,
              keyboardType: inputType,
              obscureText: isPassword,
              validator: validate,
              maxLines: maxLine,
              onFieldSubmitted: onFieldSubmitted,
              decoration: InputDecoration(
                hintText: hint,
                prefixIcon: Icon(
                  prefix,
                  size: AppSize.s14,
                  color: ColorManager.grey,
                ),
                suffixIcon: suffix != null
                    ? IconButton(
                        onPressed: suffixPressed,
                        icon: Icon(
                          suffix,
                          size: AppSize.s14,
                          color: ColorManager.grey,
                        ))
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
