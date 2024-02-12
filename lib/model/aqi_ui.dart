import 'package:air_pollution_application/common/color.dart';
import 'package:flutter/material.dart';

class AqiUIObject {
  final Color? darkColor;
  final Color? lightColor;
  final String description;
  final String image;

  AqiUIObject(
      {this.darkColor,
      this.lightColor,
      required this.description,
      required this.image});
}

AqiUIObject getAqiObject(int value) {
  Color? darkColor;
  Color? lightColor;
  String description;
  String image;

  if (value >= 0 && value <= 50) {
    darkColor = darkGreen;
    lightColor = lightGreen;
    description = 'Good';
    image = 'assets/icons/ic_face_happy.png';
  } else if (value > 50 && value <= 100) {
    darkColor = darkYellow;
    lightColor = lightYellow;
    description = 'Moderate';
    image = 'assets/icons/ic_face_sad.png';
  } else if (value > 100 && value <= 150) {
    darkColor = darkOrange;
    lightColor = lightOrange;
    description = 'Unhealthy for\nsensitive groups';
    image = 'assets/icons/ic_face_sick.png';
  } else if (value > 150 && value <= 200) {
    darkColor = darkRed;
    lightColor = lightRed;
    description = 'Unhealty';
    image = 'assets/icons/ic_face_mask.png';
  } else if (value > 200 && value <= 300) {
    darkColor = darkPurple;
    lightColor = lightPurple;
    description = 'Very Unhealthy';
    image = 'assets/icons/ic_face_shield.png';
  } else if (value > 300 && value <= 500) {
    darkColor = darkDanger;
    lightColor = lightDanger;
    description = 'Hazardous';
    image = 'assets/icons/ic_face_danger.png';
  } else {
    darkColor = darkDanger;
    lightColor = lightDanger;
    description = 'Unknown';
    image = 'assets/icons/ic_face_danger.png';
  }

  return AqiUIObject(
      darkColor: darkColor,
      lightColor: lightColor,
      description: description,
      image: image);
}
