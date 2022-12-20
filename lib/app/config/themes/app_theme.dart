import 'package:flutter/material.dart'
    show
        AppBarTheme,
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
  static TextStyle headline1 = TextStyle(
    color: AppColors.black,
    height: 48.0 / 36.0,
    // line height calculated as is fontSize * height so, <expected-height>/<font-size>
    fontSize: 36.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle headline2Bold = TextStyle(
    color: AppColors.black,
    height: 36.0 / 18.0,
    fontSize: 18.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle heading2Regular = TextStyle(
    color: AppColors.black,
    height: 36.0 / 18.0,
    fontSize: 18.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle button = TextStyle(
    color: AppColors.white,
    height: 26.0 / 18.0,
    fontSize: 18.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle captionBold = TextStyle(
    color: AppColors.black,
    height: 22.0 / 16.0,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle captionRegular = TextStyle(
    color: AppColors.black,
    height: 20.0 / 16.0,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle textBold = TextStyle(
    color: AppColors.black,
    height: 20.0 / 14.0,
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle textRegular = TextStyle(
    color: AppColors.black,
    height: 20.0 / 14.0,
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle subHeading = TextStyle(
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
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
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
      inputDecorationTheme: InputDecorationTheme(
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.red, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.red, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.greyLight, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.greyLight, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.greyLight, width: 1),
        ),
      ),
      appBarTheme: AppBarTheme(backgroundColor: AppColors.purple));
}
