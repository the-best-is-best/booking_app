import 'package:booking_app/app/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  Color color = Colors.white,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

// light

TextStyle getLightStyle({
  double? fontSize,
  Color color = Colors.white,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s14,
      fontWeight: FontWeightManager.light,
      color: color);
}

// regular

TextStyle getRegularStyle({
  double? fontSize,
  Color color = Colors.white,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s16,
      fontWeight: FontWeightManager.regular,
      color: color);
}

// medium

TextStyle getMediumStyle({
  double? fontSize,
  Color color = Colors.white,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s24,
      fontWeight: FontWeightManager.medium,
      color: color);
}

// semi bold

TextStyle getSemiBoldStyle({
  double? fontSize,
  Color color = Colors.white,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s28,
      fontWeight: FontWeightManager.semiBold,
      color: color);
}

// bold

TextStyle getBoldStyle({
  double? fontSize,
  Color color = Colors.white,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s30,
      fontWeight: FontWeightManager.bold,
      color: color);
}
