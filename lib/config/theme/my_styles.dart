import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_fonts.dart';

class MyStyles {
  ///icons theme
  static IconThemeData getIconTheme({required bool isLightTheme}) => IconThemeData(
        color: isLightTheme ? LightThemeColors.iconColor : DarkThemeColors.iconColor,
      );

  ///app bar theme
  static AppBarTheme getAppBarTheme({required bool isLightTheme}) => AppBarTheme(
        elevation: 0,
        titleTextStyle: getTextTheme(isLightTheme: isLightTheme).bodyLarge!.copyWith(
              color: Colors.white,
              fontSize: MyFonts.appBarTitleSize,
            ),
        iconTheme:
            IconThemeData(color: isLightTheme ? LightThemeColors.appBarIconsColor : DarkThemeColors.appBarIconsColor),
        backgroundColor: isLightTheme ? LightThemeColors.appBarColor : DarkThemeColors.appbarColor,
      );

  ///text theme
  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
        labelLarge: MyFonts.buttonTextStyle.copyWith(fontSize: MyFonts.buttonTextSize),
        bodyLarge: (MyFonts.bodyTextStyle).copyWith(
            fontWeight: FontWeight.bold,
            fontSize: MyFonts.body1TextSize,
            color: isLightTheme ? LightThemeColors.bodyTextColor : DarkThemeColors.bodyTextColor),
        bodyMedium: (MyFonts.bodyTextStyle).copyWith(
            fontSize: MyFonts.body2TextSize,
            color: isLightTheme ? LightThemeColors.bodyTextColor : DarkThemeColors.bodyTextColor),
        displayLarge: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline1TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme ? LightThemeColors.headlinesTextColor : DarkThemeColors.headlinesTextColor),
        displayMedium: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline2TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme ? LightThemeColors.headlinesTextColor : DarkThemeColors.headlinesTextColor),
        displaySmall: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline3TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme ? LightThemeColors.headlinesTextColor : DarkThemeColors.headlinesTextColor),
        headlineMedium: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline4TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme ? LightThemeColors.headlinesTextColor : DarkThemeColors.headlinesTextColor),
        headlineSmall: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline5TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme ? LightThemeColors.headlinesTextColor : DarkThemeColors.headlinesTextColor),
        titleLarge: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline6TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme ? LightThemeColors.headlinesTextColor : DarkThemeColors.headlinesTextColor),
        bodySmall: (MyFonts.headlineTextStyle).copyWith(
            color: isLightTheme ? LightThemeColors.captionTextColor : DarkThemeColors.captionTextColor,
            fontSize: MyFonts.captionTextSize),
      );

  static ChipThemeData getChipTheme({required bool isLightTheme}) {
    return ChipThemeData(
      backgroundColor: isLightTheme ? LightThemeColors.chipBackground : DarkThemeColors.chipBackground,
      brightness: Brightness.light,
      labelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      secondaryLabelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      selectedColor: Colors.black,
      disabledColor: Colors.green,
      padding: const EdgeInsets.all(5),
      secondarySelectedColor: Colors.purple,
    );
  }

  ///Chips text style
  static TextStyle getChipTextStyle({required bool isLightTheme}) {
    return MyFonts.chipTextStyle.copyWith(
      fontSize: MyFonts.chipTextSize,
      color: isLightTheme ? LightThemeColors.chipTextColor : DarkThemeColors.chipTextColor,
    );
  }

  ///Chips text style
  static Color getContainerColor({required bool isLightTheme}) {
    return isLightTheme ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor;
  }

  static Color getScaffoldColor({required bool isLightTheme}) {
    return isLightTheme ? LightThemeColors.scaffoldBackgroundColor : DarkThemeColors.scaffoldBackgroundColor;
  }

  static Color getSmallButtonColor({required bool isLightTheme}) {
    return isLightTheme ? LightThemeColors.buttonSmallColor : DarkThemeColors.buttonSmallColor;
  }

  static Color getPrimaryColor({required bool isLightTheme}) {
    return isLightTheme ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor;
  }

  static Color getSecondaryColor({required bool isLightTheme}) {
    return isLightTheme ? LightThemeColors.cardColor : DarkThemeColors.cardColor;
  }

  static Color getSubtitleColor({required bool isLightTheme}) {
    return isLightTheme ? LightThemeColors.iconColor : DarkThemeColors.iconColor;
  }

  // elevated button text style
  static MaterialStateProperty<TextStyle?>? getElevatedButtonTextStyle(bool isLightTheme,
      {bool isBold = true, double? fontSize}) {
    return MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              color: isLightTheme ? LightThemeColors.buttonTextColor : DarkThemeColors.buttonTextColor);
        } else if (states.contains(MaterialState.disabled)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isLightTheme ? LightThemeColors.buttonDisabledTextColor : DarkThemeColors.buttonDisabledTextColor);
        }
        return MyFonts.buttonTextStyle.copyWith(
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isLightTheme
                ? LightThemeColors.buttonTextColor
                : DarkThemeColors.buttonTextColor); // Use the component's default.
      },
    );
  }

  //elevated button theme data
  static ElevatedButtonThemeData getElevatedButtonTheme({required bool isLightTheme}) => ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
              //side: BorderSide(color: Colors.teal, width: 2.0),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 14.h)),
          textStyle: getElevatedButtonTextStyle(isLightTheme),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return isLightTheme
                    ? LightThemeColors.buttonColor.withOpacity(0.5)
                    : DarkThemeColors.buttonColor.withOpacity(0.5);
              } else if (states.contains(MaterialState.disabled)) {
                return isLightTheme ? LightThemeColors.buttonDisabledColor : DarkThemeColors.buttonDisabledColor;
              }
              return isLightTheme
                  ? LightThemeColors.buttonColor
                  : DarkThemeColors.buttonColor; // Use the component's default.
            },
          ),
        ),
      );
}
