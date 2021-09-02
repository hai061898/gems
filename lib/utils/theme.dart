import 'package:flutter/material.dart';
import 'package:gems/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData() {
  return ThemeData(
    primaryColor: kPrimaryColor,
    accentColor: kAccentColor,
    textTheme: GoogleFonts.montserratTextTheme(
      textTheme(),
    ),
    iconTheme: iconThemeData(),
    elevatedButtonTheme: elevatedButtonThemeData(),
  );
}

IconThemeData iconThemeData() {
  return IconThemeData(color: kPrimaryColor);
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kPrimaryColor),
    bodyText2: TextStyle(color: kPrimaryColor),
    caption: TextStyle(color: kPrimaryColor),
    subtitle1: TextStyle(color: kPrimaryColor),
    headline6: TextStyle(color: kPrimaryColor),
  );
}

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        )),
  );
}
