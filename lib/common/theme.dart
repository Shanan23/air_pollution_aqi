import 'package:flutter/material.dart';
import 'color.dart';

class CustomTheme {
  static ThemeData myTheme(BuildContext context) {
    return ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
      primarySwatch: materialColor(primaryColor),
      primaryColor: primaryColor,
      textTheme: myTextTheme.apply(
        bodyColor: textColor,
        displayColor: textColor,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: buttonColor,
      ),
      useMaterial3: false,
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ButtonStyle(
      //     shape: MaterialStateProperty.all<OutlinedBorder>(
      //       RoundedRectangleBorder(
      //         borderRadius: borderRadiusCircular,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

TextTheme myTextTheme = const TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 92,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  displayMedium: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  displaySmall: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 46,
    fontWeight: FontWeight.w400,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 23,
    fontWeight: FontWeight.w400,
  ),

  //for header in each page
  titleLarge: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  ),
  labelLarge: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);
