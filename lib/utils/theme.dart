import 'package:flutter/material.dart';

const Color mainColor = Color(0xff00BE84);
const Color darkGreyColor = Color(0xFF121212);
const Color pinkColor = Color(0xFFff4667);
const Color brownColor = Color(0xff685959);
const Color lightBrownColor = Color(0xffADA79B);
const Color lightBrownColor2 = Color(0xffA5947F);
const Color lightGreenColor = Color(0xff738B71);
const Color brownColor1 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logoutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

class ThemesApp {
  static final light = ThemeData(
      primaryColor: mainColor,
      backgroundColor: Colors.white,
      brightness: Brightness.light);
  static final dark = ThemeData(
      primaryColor: darkGreyColor,
      backgroundColor: darkGreyColor,
      brightness: Brightness.dark);
}
