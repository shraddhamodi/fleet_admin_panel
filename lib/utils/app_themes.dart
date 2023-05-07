import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const Color whiteBG = Color(0xffF7F7F7);
  static const Color black = Color(0xff000000);
  static const Color greyScale = Color(0xfff3f4f8);
  static const Color grayScale9 = Color(0xff101223);
  static const Color red = Color(0xffFF4242);
  static const Color transparent = Colors.transparent;
  static const Color dodgerBlue = Color.fromRGBO(37, 173, 250, 1);
  static const Color whiteLilac = Color.fromRGBO(248, 250, 252, 1);
  static const Color blackPearl = Color.fromRGBO(30, 31, 43, 1);
  static const Color brinkPink = Color.fromRGBO(255, 97, 136, 1);
  static const Color juneBud = Color.fromRGBO(186, 215, 97, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color nevada = Color.fromRGBO(105, 109, 119, 1);
  static const Color ebonyClay = Color.fromRGBO(40, 42, 58, 1);
  static const Color grey = Color.fromRGBO(87, 108, 138, 1);
  static const Color lightGrey = Color.fromRGBO(247, 247, 247, 1);
  static const Color secondaryGreen = Color(0xff47c87a);

  static const Color lightOrange = Color(0xFFFFD7CA);
  static const Color lightBlue = Color(0xffC3FCFF);
  static const Color lightPurple = Color(0xffE7CFFF);
  static const Color lightYellow = Color(0xffF3EFBA);

  static const Color randomCardColor1 = Color.fromRGBO(0, 122, 175, 1);
  static const Color randomCardColor2 = Color.fromRGBO(72, 79, 89, 1);


  static Color colorPrimary = const Color(0xFF192841);
  static Color colorTextLightBlue = const Color(0xFFB9E5F6);

  //constants color range for light theme
  //main color
  static const Color _lightPrimaryColor = dodgerBlue;

  //Background Colors
  static const Color _lightBackgroundColor = whiteBG;

  //Text Colors
  static const Color _lightTextColor = grayScale9;
  static const Color _lightTextSecondaryColor = grey;

  //Icon Color
  static const Color _lightIconColor = grayScale9;

  static String font = "Ubuntu";

  //text theme for light theme
  static const TextTheme _lightTextTheme = TextTheme(
    labelMedium: TextStyle(
        fontSize: 18.0,
        color: _lightTextColor,
        fontWeight: FontWeight.bold),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: font,
    scaffoldBackgroundColor: _lightBackgroundColor,
    primaryColor: colorPrimary,
    indicatorColor: _lightTextColor,
    dividerColor: grayScale9,

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: grayScale9),
      toolbarTextStyle: _lightTextTheme.bodyMedium,
      titleTextStyle: _lightTextTheme.titleLarge,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(
        color: _lightPrimaryColor,
      ),
      unselectedIconTheme: const IconThemeData(
        color: _lightTextSecondaryColor,
      ),
      selectedLabelStyle: _lightTextTheme.bodySmall,
      unselectedLabelStyle: _lightTextTheme.bodySmall,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: _lightTextSecondaryColor,
      selectedItemColor: _lightPrimaryColor,
    ),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    textTheme: _lightTextTheme,
  );

}
