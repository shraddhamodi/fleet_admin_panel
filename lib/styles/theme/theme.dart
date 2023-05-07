import 'package:flutter/material.dart';
import '../colors.dart';
import 'color/light_color.dart';

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData.light().copyWith(
    // primarySwatch: Colors.blue,
    scaffoldBackgroundColor: LightColor.background,
    primaryColor: LightColor.purple,
    primaryColorDark: LightColor.darker,
    primaryColorLight: LightColor.brighter,
    cardTheme: const CardTheme(color: LightColor.background),
    // textTheme: TextTheme(display1: TextStyle(color: LightColor.black)),
    iconTheme: const IconThemeData(color: LightColor.lightBlack),
    dividerColor: LightColor.lightGrey,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        color: AppColors.grayScale9,
      )
    ), bottomAppBarTheme: const BottomAppBarTheme(color: LightColor.background), colorScheme: const ColorScheme(
        primary: LightColor.purple,
        secondary: LightColor.lightBlue,
        surface: LightColor.background,
        background: LightColor.background,
        error: Colors.red,
        onPrimary: LightColor.darker,
        onSecondary: LightColor.background,
        onSurface: LightColor.darker,
        onBackground: LightColor.titleTextColor,
        onError: LightColor.titleTextColor,
        brightness: Brightness.dark).copyWith(background: LightColor.background)
  );

  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);
}
