import 'package:fleet_admin_panel/styles/theme/color/light_color.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  AppThemes._();

  static const Color primaryColor = Color(0xffC382FF);
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
  static const Color buttonFillColor = Color.fromRGBO(30, 35, 48, 1);

  //quizScreen
  static const Color lightOrange = Color(0xFFFFD7CA);
  static const Color lightBlue = Color(0xffC3FCFF);
  static const Color lightPurple = Color(0xffE7CFFF);
  static const Color lightYellow = Color(0xffF3EFBA);

  //chart colors
  static List<Color> chartColorPalette = const [
    Color(0xFF0D47A1),
    Color(0xFF1565C0),
    Color(0xFF1976D2),
    Color(0xFF1E88E5),
    Color( 0xFF2196F3),
    Color(0xFF42A5F5),
    Color(0xFF64B5F6),
    Color(0xFF90CAF9),
    Color(0xFFBBDEFB),
    Color(0xFFE3F2FD)
  ];

  static const MaterialColor lightBlueMaterialColor = MaterialColor(
    _lightBluePrimaryValue,
    <int, Color>{
      50: Color(0xFFE1F5FE),
      100: Color(0xFFB3E5FC),
      200: Color(0xFF81D4FA),
      300: Color(0xFF4FC3F7),
      400: Color(0xFF29B6F6),
      500: Color(_lightBluePrimaryValue),
      600: Color(0xFF039BE5),
      700: Color(0xFF0288D1),
      800: Color(0xFF0277BD),
      900: Color(0xFF01579B),
    },
  );
  static const int _lightBluePrimaryValue = 0xFF1E2330;

  //chatscreen
  static Color colorTextLightBlue = const Color(0xFFB9E5F6);

  static String font1 = "Poppins";
  static String font2 = "PlusJakartaSans";

  //constants color range for light theme
  //main color
  static const Color _lightPrimaryColor = buttonFillColor;

  //Background Colors
  static const Color _lightBackgroundColor = whiteBG;
  static const Color _lightBackgroundAppBarColor = _lightPrimaryColor;
  static const Color _lightBackgroundSecondaryColor = white;
  static const Color _lightBackgroundAlertColor = blackPearl;
  static const Color _lightBackgroundActionTextColor = white;
  static const Color _lightBackgroundSuccessColor = secondaryGreen;

  //Text Colors
  static const Color _lightTextColor = Colors.black;
  static const Color _lightTextSecondaryColor = grey;

  //Icon Color
  static const Color _lightIconColor = nevada;

  //form input colors
  // static const Color _lightInputFillColor = _lightBackgroundSecondaryColor;
  static const Color _lightBorderActiveColor = _lightPrimaryColor;
  static const Color _lightBorderErrorColor = brinkPink;

  //constants color range for dark theme
  static const Color _darkPrimaryColor = buttonFillColor;

  //Background Colors
  static const Color _darkBackgroundColor = black;
  static const Color _darkBackgroundAppBarColor = _darkPrimaryColor;
  static const Color _darkBackgroundSecondaryColor =
  Color.fromRGBO(0, 0, 0, .4);
  static const Color _darkBackgroundAlertColor = blackPearl;
  static const Color _darkBackgroundActionTextColor = white;

  //Text Colors
  static const Color _darkTextColor = Colors.white;
  static const Color _darkTextSecondaryColor = whiteLilac;

  //Icon Color
  static const Color _darkIconColor = nevada;
  static const Color _darkBorderActiveColor = _darkPrimaryColor;
  static const Color _darkBorderErrorColor = brinkPink;

  //text theme for light theme
  static const TextTheme _lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
        color: LightColor.titleTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 22),
    headlineMedium: TextStyle(
        color: LightColor.titleTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 18),
    titleMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        color: AppColors.grayScale9,
      ),

    displayLarge: TextStyle(
        fontSize: 24.0, color: _lightTextColor, fontWeight: FontWeight.w800),
    displayMedium: TextStyle(
        fontSize: 22.0, color: grayScale9, fontWeight: FontWeight.w500),
    displaySmall: TextStyle(
        fontSize: 20.0,
        color: _lightBackgroundSuccessColor,
        fontWeight: FontWeight.w500),
    headlineSmall: TextStyle(
      fontSize: 14.0,
      color: _lightTextColor,
    ),
    bodyLarge: TextStyle(fontSize: 14.0, color: _lightTextSecondaryColor),
    bodyMedium: TextStyle(
        fontSize: 12.0,
        color: _lightTextSecondaryColor,
        fontWeight: FontWeight.normal),
    labelLarge: TextStyle(
        fontSize: 16.0,
        color: _lightBackgroundColor,
        fontWeight: FontWeight.w500),
    titleLarge: TextStyle(fontSize: 16.0, color: _lightTextColor),
    titleSmall: TextStyle(
        fontSize: 14.0, color: _lightTextColor, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(fontSize: 12.0, color: _lightBackgroundAppBarColor),
    labelMedium: TextStyle(
        fontSize: 14.0,
        color: _lightPrimaryColor,
        fontWeight: FontWeight.normal),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: font1,
    scaffoldBackgroundColor: _lightBackgroundColor,
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: blueShade2,
    indicatorColor: _lightTextColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _lightPrimaryColor,
    ),
    cardTheme: CardTheme(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: grayScale9),
      toolbarTextStyle: _lightTextTheme.bodyMedium,
      titleTextStyle: _lightTextTheme.titleLarge,
    ),
    listTileTheme: const ListTileThemeData(),
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
    drawerTheme: const DrawerThemeData(
      backgroundColor: _lightBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: _lightBackgroundAlertColor,
        actionTextColor: _lightBackgroundActionTextColor),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    dividerTheme: const DividerThemeData(color: _lightBackgroundSecondaryColor, thickness: 2),
    popupMenuTheme:
    const PopupMenuThemeData(color: _lightBackgroundAppBarColor),
    textTheme: _lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          animationDuration: const Duration(milliseconds: 2000),
          backgroundColor: MaterialStateProperty.all(primaryColor),
          textStyle: MaterialStateProperty.all(_lightTextTheme.labelLarge),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
        )),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          animationDuration: const Duration(milliseconds: 2000),
          backgroundColor: MaterialStateProperty.all(primaryColor),
          textStyle: MaterialStateProperty.all(_lightTextTheme.labelLarge),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
        )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            animationDuration: const Duration(milliseconds: 2000),
            backgroundColor: MaterialStateProperty.all(_lightBackgroundColor),
            textStyle: MaterialStateProperty.all(_lightTextTheme.labelLarge),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            side: MaterialStateProperty.all(
              // BorderSide.none))),
                const BorderSide(color: _lightPrimaryColor, width: 1)))),
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: _lightPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _lightPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      //prefixStyle: TextStyle(color: _lightIconColor),
        isDense: true, contentPadding: const EdgeInsets.all(16),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: _lightBackgroundSecondaryColor ,width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            )),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: _lightBorderActiveColor),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: _lightBorderErrorColor),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: _lightBorderErrorColor),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        fillColor: Colors.black.withOpacity(0.05),
        filled: true
      //focusColor: _lightBorderActiveColor,
    ), colorScheme: const ColorScheme.light(
      primary: _lightTextColor,
      // primaryVariant: _lightBackgroundColor,
      // secondary: _lightSecondaryColor,
    ).copyWith(background: _lightBackgroundSecondaryColor),
  );

  static const TextTheme _darkTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 24.0, color: _darkTextColor, fontWeight: FontWeight.w800),
    displayMedium: TextStyle(
        fontSize: 22.0, color: _darkTextColor, fontWeight: FontWeight.w500),
    displaySmall: TextStyle(
        fontSize: 20.0,
        color: _lightBackgroundSuccessColor,
        fontWeight: FontWeight.w500),
    headlineMedium: TextStyle(
        fontSize: 18.0, color: grayScale9, fontWeight: FontWeight.w500),
    headlineSmall: TextStyle(
      fontSize: 14.0,
      color: _darkTextColor,
    ),
    bodyLarge: TextStyle(fontSize: 14.0, color: _darkTextSecondaryColor),
    bodyMedium: TextStyle(
        fontSize: 12.0,
        color: _darkTextSecondaryColor,
        fontWeight: FontWeight.normal),
    labelLarge: TextStyle(
        fontSize: 16.0,
        color: _darkBackgroundColor,
        fontWeight: FontWeight.w500),
    titleLarge: TextStyle(fontSize: 16.0, color: _darkTextColor),
    titleMedium: TextStyle(
        fontSize: 16.0, color: _darkTextColor, fontWeight: FontWeight.normal),
    titleSmall: TextStyle(
        fontSize: 14.0, color: _darkTextColor, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(fontSize: 12.0, color: _darkBackgroundAppBarColor),
    labelMedium: TextStyle(
        fontSize: 14.0,
        color: _darkPrimaryColor,
        fontWeight: FontWeight.normal),
  );

  //the dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    //prefix icon color form input on focus
    fontFamily: font1,
    scaffoldBackgroundColor: _darkBackgroundColor,
    secondaryHeaderColor: darkBlueShade2,
    indicatorColor: _darkTextColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _darkPrimaryColor,
    ),
    cardTheme: CardTheme(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    appBarTheme: AppBarTheme(
      color: _darkBackgroundAppBarColor,
      iconTheme: const IconThemeData(color: _darkTextColor),
      toolbarTextStyle: _darkTextTheme.bodyMedium,
      titleTextStyle: _darkTextTheme.titleLarge,
    ),
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(color: Colors.white),
        backgroundColor: _darkBackgroundAlertColor,
        actionTextColor: _darkBackgroundActionTextColor),
    iconTheme: const IconThemeData(
      color: _darkIconColor, //_darkIconColor,
    ),
    popupMenuTheme: const PopupMenuThemeData(color: _darkBackgroundAppBarColor),
    textTheme: _darkTextTheme,
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: _darkPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _darkPrimaryColor,
    inputDecorationTheme: const InputDecorationTheme(
        prefixStyle: TextStyle(color: _darkIconColor),
        isDense: true,
        contentPadding: EdgeInsets.all(16),
        //labelStyle: TextStyle(color: nevada),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: _darkBackgroundSecondaryColor,width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkBorderActiveColor),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkBorderErrorColor),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkBorderErrorColor),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        fillColor: Colors.white38,
        filled: true
      //focusColor: _darkBorderActiveColor,
    ),
    colorScheme: const ColorScheme.dark(
      primary: _darkTextColor,
      // secondary: _darkSecondaryColor,
    ),
    primaryColor: _darkPrimaryColor,
    listTileTheme: const ListTileThemeData(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(
        color: _darkPrimaryColor,
      ),
      unselectedIconTheme: const IconThemeData(
        color: _darkTextSecondaryColor,
      ),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: _darkTextTheme.bodySmall,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: _darkTextSecondaryColor,
      selectedItemColor: _darkPrimaryColor,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: _darkBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
    ),
    dividerTheme: const DividerThemeData(color: _darkBackgroundSecondaryColor, thickness: 2),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          animationDuration: const Duration(milliseconds: 2000),
          backgroundColor: MaterialStateProperty.all(primaryColor),
          textStyle: MaterialStateProperty.all(_darkTextTheme.labelLarge),
        )),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          animationDuration: const Duration(milliseconds: 2000),
          backgroundColor: MaterialStateProperty.all(primaryColor),
          textStyle: MaterialStateProperty.all(_darkTextTheme.labelLarge),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
        )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            animationDuration: const Duration(milliseconds: 2000),
            backgroundColor: MaterialStateProperty.all(_darkBackgroundColor),
            textStyle: MaterialStateProperty.all(_darkTextTheme.labelLarge),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            side: MaterialStateProperty.all(
                const BorderSide(color: _darkPrimaryColor, width: 1)))),
  );
}
