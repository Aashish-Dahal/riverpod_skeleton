import 'package:flutter/material.dart'
    show
        BorderRadius,
        BorderSide,
        Brightness,
        FontStyle,
        FontWeight,
        InputDecorationTheme,
        OutlineInputBorder,
        Radius,
        TextLeadingDistribution,
        TextStyle,
        TextTheme,
        ThemeData;

import '../../core/utils/app_colors.dart' show AppColors;

class AppTheme {
  AppTheme._();
  static TextStyle headline1 = const TextStyle(
    color: AppColors.black,
    height: 48.0 / 36.0,
    // line height calculated as is fontSize * height so, <expected-height>/<font-size>
    fontSize: 36.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle headline2Bold = const TextStyle(
    color: AppColors.black,
    height: 36.0 / 18.0,
    fontSize: 18.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle heading2Regular = const TextStyle(
    color: AppColors.black,
    height: 36.0 / 18.0,
    fontSize: 18.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle button = const TextStyle(
    color: AppColors.white,
    height: 26.0 / 18.0,
    fontSize: 18.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle captionBold = const TextStyle(
    color: AppColors.black,
    height: 22.0 / 16.0,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle captionRegular = const TextStyle(
    color: AppColors.black,
    height: 20.0 / 16.0,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle textBold = const TextStyle(
    color: AppColors.black,
    height: 20.0 / 14.0,
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle textRegular = const TextStyle(
    color: AppColors.black,
    height: 20.0 / 14.0,
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle subHeading = const TextStyle(
    color: AppColors.black,
    height: 20.0 / 12.0,
    fontSize: 12.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static ThemeData get dark => ThemeData(brightness: Brightness.dark);
  static ThemeData get light => ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline1: headline1,
        headline2: headline2Bold,
        headline3: heading2Regular,
        subtitle1: captionBold,
        subtitle2: captionRegular,
        bodyText1: textBold,
        bodyText2: textRegular,
        caption: subHeading,
        button: button,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.red, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.red, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.greyLight, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.greyLight, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.greyLight, width: 1),
        ),
      ));
}
