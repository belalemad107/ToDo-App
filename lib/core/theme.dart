import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yelloClr = Color(0xFFffb764);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const Color primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderColor = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    backgroundColor: white,
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    backgroundColor: darkGreyClr,
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400));
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey));
}

TextStyle get formTitleStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black));
}

TextStyle get buttonStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white));
}
