import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_manager.dart';
import 'values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'styles_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main Colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    scaffoldBackgroundColor: ColorManager.background,

    // cardView theme
    cardTheme: const CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // appBar Theme
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.darkGrey,
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(color: Color.fromRGBO(255, 255, 255, 1)),
      color: ColorManager.primary,
      centerTitle: true,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s16.sp,
        color: ColorManager.white,
      ),
    ),

    // button Theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),

    // elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s17.sp,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    // text Theme
    textTheme: TextTheme(
      displayLarge: getSemBoldStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s22.sp),
      displayMedium:
          getSemBoldStyle(color: ColorManager.white, fontSize: FontSize.s18.sp),
      headlineLarge:
          getSemBoldStyle(color: ColorManager.grey, fontSize: FontSize.s16.sp),
      headlineMedium: getRegularStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s14.sp),
      titleMedium:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s16.sp),
      bodySmall: getRegularStyle(color: ColorManager.grey),
      bodyLarge: getRegularStyle(color: ColorManager.grey1),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14.sp),
      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14.sp),
      errorStyle: getRegularStyle(color: ColorManager.error),
      fillColor: ColorManager.darkGrey,
      filled: true,
      enabledBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.darkGrey, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
      ),
    ),
  );
}
