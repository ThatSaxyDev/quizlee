import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class Pallete {
  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color(0xff6A8189); // secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static const brownColor = Color(0xff593C2A);
  static const primaryTeal = Color(0xff057672);
  static const offWhiteTeal = Color(0xfff3f8f8);

  static const backButtonGrey = Color(0xffF4F5F5);
  static const orange = Color(0xffD95700);

  static const imagePlaceHolder1 = Color(0xffD9D9D9);
  static var imagePlaceHolder2 = const Color(0xff969696).withOpacity(0.29);
  static const imagePlaceHolder3 = Color(0xffECE9D9);

  static const greey = Color(0xffC4C4C4);

  static const blackTint = Color(0xff121212);
  static const lightbrownColor = Color(0xffB48669);
  static const textGreen = Color(0xff4E6139);
  static const blueColor = Color(0xff034DC6);

  //!
  static const textWhite = Color(0xffF0F0FA);
  static const backgroundBlue = Color(0xff0D0D1A);
  static const textGrey = Color(0xffCFCFE5);
  static const textHintGrey = Color(0xff7A7A87);
  static const buttonBlue = Color(0xff7373E5);
  static const redColor = Color(0xffEF4444);
  static const borderBlueGrey = Color(0xff36364D);
  static const darkBlueGrey = Color(0xff090912);
  static const buttonShadow = Color(0xff3D3D99);
  static const upcomingblue = Color(0xff141421);
  static const answerBorder = Color(0xff22222E);
  static const greenn = Color(0xff86EFAC);
  static const gradientGreen = Color(0xff22C55E);
  static const inactiveButtonBlue = Color(0xff40407F);
  static const inactiveButtonShadow = Color(0xff252559);

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    // textTheme: GoogleFonts.spaceGroteskTextTheme(),
    // textTheme: ThemeData.dark().textTheme.apply(
    //       fontFamily: 'Sk-Modernist',
    //     ),
    scaffoldBackgroundColor: blackColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: drawerColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: blueColor, // will be used as alternative background color
    canvasColor: greyColor, colorScheme: ColorScheme.fromSwatch(),
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    // textTheme: GoogleFonts.spaceGroteskTextTheme(),
    // textTheme: ThemeData.light().textTheme.apply(
    //       fontFamily: 'Sk-Modernist',
    //     ),
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: blueColor,
    canvasColor: blackColor,
    colorScheme: ColorScheme.fromSwatch(),
  );
}

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeMode _mode;
  ThemeNotifier({ThemeMode mode = ThemeMode.dark})
      : _mode = mode,
        super(
          Pallete.darkModeAppTheme,
        ) {
    getTheme();
  }

  ThemeMode get mode => _mode;

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == 'light') {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
    }
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
      prefs.setString('theme', 'light');
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
      prefs.setString('theme', 'dark');
    }
  }
}
