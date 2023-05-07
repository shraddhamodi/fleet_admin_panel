import 'package:flutter/material.dart';

class AppColors {
  //One instance, needs factory
  static AppColors? _instance;
  factory AppColors() => _instance ??= AppColors._();

  AppColors._();

  static const Color primaryColor = Color(0xFFA08CEF);
  static const Color whiteLilac = Color.fromRGBO(248, 250, 252, 1);
  static const Color blackPearl = Color.fromRGBO(30, 31, 43, 1);
  static const Color brinkPink = Color.fromRGBO(255, 97, 136, 1);
  static const Color juneBud = Color.fromRGBO(186, 215, 97, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color nevada = Color.fromRGBO(105, 109, 119, 1);
  static const Color ebonyClay = Color.fromRGBO(40, 42, 58, 1);
  static const Color grey = Color.fromRGBO(87, 108, 138, 1);
  static const Color lightGrey = Color.fromRGBO(247, 247, 247, 1);

  static const Color whiteBG = Color(0xffF7F7F7);
  static const Color black = Color(0xff000000);
  static const Color darkGrey = Color(0xff7C7C7C);
  static const Color greyScale = Color(0xfff3f4f8);
  static const Color grayScale5 = Color(0xff5B5D6B);
  static const Color grayScale7 = Color(0xff404252);
  static const Color grayScale9 = Color(0xff101223);
  static const Color randomCardColor1 = Color.fromRGBO(0, 122, 175, 1);
  static const Color randomCardColor2 = Color.fromRGBO(72, 79, 89, 1);
  static const Color blueShade1 = Color(0xffdff3ff);
  static const Color blueShade2 = Color(0xffE9F7FF);
  static const Color darkBlueShade2 = Color(0xff001b2b);
  static const Color gryShade = Color.fromRGBO(72, 72, 89, 1);
  static const Color navyShade = Color.fromRGBO(0, 112, 175, 1);
  static const Color secondaryGreen = Color(0xff47c87a);
  static const Color randomBG = Color(0xffeee5ff);
  static const Color red = Color(0xffFF4242);
  static const Color lightRed = Color(0xffff7362);
  static const Color transparent = Colors.transparent;

  static const Color lightOrange = Color(0xFFFFD7CA);
  static const Color lightBlue = Color(0xffC3FCFF);
  static const Color lightPurple = Color(0xffE7CFFF);
  static const Color lightYellow = Color(0xffF3EFBA);
  static Color colorTextLightBlue = const Color(0xFFB9E5F6);

  static Color borderColor = const Color(0xffE2E2E2);
  static Color bottomNavColor = logoColor4;

  /// Top gradient color used in various UI components.
  static const topGradient = Color(0xFFE60064);

  /// Bottom gradient color used in various UI components.
  static const bottomGradient = Color(0xFFFFB344);
  static const light = Color(0xFFFAFAFA);

  static Color logoColor1 = const Color(0xFF050504);
  static Color logoColor2 = const Color(0xFFCCFB77);
  static Color logoColor3 = const Color(0xFF647E3B);
  static Color logoColor4 = const Color(0xFF98C254);
  static Color logoColor5 = const Color(0xFF5C7236);
  static Color logoColor6 = const Color(0xFF9EC45D);
  static Color logoColor7 = const Color(0xFF94BC5C);
  static Color logoColor8 = const Color(0xFFACDC65);

  static List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
    const Color(0xff836AF6),
    const Color(0xffD73B77),
  ];

  //constants color range for light theme
  //main color
  static const Color lightPrimaryColor = primaryColor;
  static const Color buttonFillColor = primaryColor;

  //Background Colors
  static const Color lightBackgroundColor = whiteBG;
  static const Color lightBackgroundAppBarColor = lightPrimaryColor;
  static const Color lightBackgroundSecondaryColor = white;
  static const Color lightBackgroundAlertColor = blackPearl;
  static const Color lightBackgroundActionTextColor = white;
  static const Color lightBackgroundSuccessColor = secondaryGreen;

  //Text Colors
  static const Color lightTextColor = Colors.black;
  static const Color lightTextSecondaryColor = grey;

  //Icon Color
  static const Color lightIconColor = nevada;

  //form input colors
  // static const Color lightInputFillColor = lightBackgroundSecondaryColor;
  static const Color lightBorderActiveColor = lightPrimaryColor;
  static const Color lightBorderErrorColor = brinkPink;

  //constants color range for dark theme
  static const Color darkPrimaryColor = primaryColor;

  //Background Colors
  static const Color darkBackgroundColor = black;
  static const Color darkBackgroundAppBarColor = darkPrimaryColor;
  static const Color darkBackgroundSecondaryColor =
  Color.fromRGBO(0, 0, 0, .4);
  static const Color darkBackgroundAlertColor = blackPearl;
  static const Color darkBackgroundActionTextColor = white;

  //Text Colors
  static const Color darkTextColor = Colors.white;
  static const Color darkTextSecondaryColor = whiteLilac;

  //Icon Color
  static const Color darkIconColor = nevada;
  static const Color darkBorderActiveColor = darkPrimaryColor;
  static const Color darkBorderErrorColor = brinkPink;
}
