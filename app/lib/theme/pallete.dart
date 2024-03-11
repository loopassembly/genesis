import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pallete {
  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color.fromRGBO(26, 39, 45, 1); // secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
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
    textTheme: GoogleFonts.spaceGroteskTextTheme(ThemeData.dark()
        .textTheme), colorScheme: ColorScheme.dark(
      primary: redColor,
    ).copyWith(background: drawerColor), // Set Inter as the default font for dark mode
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
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
    textTheme: GoogleFonts.darkerGrotesqueTextTheme(ThemeData.light()
        .textTheme), colorScheme: ColorScheme.light(
      primary: blueColor,
    ).copyWith(background: whiteColor), // Set Inter as the default font for light mode
  );
}
