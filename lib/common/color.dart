import 'package:flutter/material.dart';

//for coloring theme.
//please add color in this file.
const Color primaryColor = Color(0xFFFF3F46);
const Color secondaryColor = Color(0xFFFFC0A3);

const Color buttonColor = Color(0xFFFF470B);
const Color textHeadingColor = Color(0xFF1F1F1F);
const Color textColor = Color(0xFF262626);
const Color hintTextColor = Color(0xFF959595);
const Color disableColor = Color(0xFFE2CDC3);

const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
const Color backgroundColor = Color(0xFFFFF6F2);

const Color greenIndicator = Color(0xFF7AA36D);
const Color orangeColor = Color(0xFFFE7D42);

const Color darkGreen = Color(0xFF00CC00);
const Color lightGreen = Color(0xFF00E400);
const Color darkOrange = Color(0xFFFF5C00);
const Color lightOrange = Color(0xFFFF8719);
const Color darkRed = Color(0xFFDD0000);
const Color lightRed = Color(0xFFFF0000);
const Color darkYellow = Color(0xFFEDD500);
const Color lightYellow = Color(0xFFFFE819);
const Color darkPurple = Color(0xFF4D0055);
const Color lightPurple = Color(0xFF8F3F97);
const Color darkDanger = Color(0xFF7E0023);
const Color lightDanger = Color(0xFF97002A);

//converting Color to MaterialColor
MaterialColor materialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
