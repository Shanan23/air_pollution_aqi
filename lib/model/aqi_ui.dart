import 'package:air_pollution_application/common/color.dart';
import 'package:flutter/material.dart';

class AqiUIObject {
  final Color? darkColor;
  final Color? lightColor;
  final String description;
  final String image;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String lblImage1;
  final String lblImage2;
  final String lblImage3;
  final String lblImage4;

  AqiUIObject(
      {this.darkColor,
      this.lightColor,
      required this.description,
      required this.image,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.image4,
      required this.lblImage1,
      required this.lblImage2,
      required this.lblImage3,
      required this.lblImage4});
}

AqiUIObject getAqiObject(int value) {
  Color? darkColor;
  Color? lightColor;
  String description;
  String image;
  String image1;
  String image2;
  String image3;
  String image4;
  String lblImage1;
  String lblImage2;
  String lblImage3;
  String lblImage4;

  if (value >= 0 && value <= 50) {
    darkColor = darkGreen;
    lightColor = lightGreen;
    description = 'Good';
    image = 'assets/icons/ic_face_happy.png';
    image1 = 'assets/icons/ic_green_1.png';
    image2 = 'assets/icons/ic_green_2.png';
    image3 = 'assets/icons/ic_green_3.png';
    image4 = 'assets/icons/ic_green_4.png';
    lblImage1 = 'Sensitive groups should wear a mask outdoors';
    lblImage2 = 'Open your windows to bring clean, fresh air indoors.';
    lblImage3 = 'Sensitive groups should run an air purifier.';
    lblImage4 = 'Enjoy outdoor activities.';
  } else if (value > 50 && value <= 100) {
    darkColor = darkYellow;
    lightColor = lightYellow;
    description = 'Moderate';
    image = 'assets/icons/ic_face_sad.png';
    image1 = 'assets/icons/ic_yellow_1.png';
    image2 = 'assets/icons/ic_yellow_2.png';
    image3 = 'assets/icons/ic_yellow_3.png';
    image4 = 'assets/icons/ic_yellow_4.png';
    lblImage1 = 'Sensitive groups should wear a mask outdoors';
    lblImage2 = 'Close your windows to avoid dirty outdoor air.';
    lblImage3 = 'Sensitive groups should run an air purifier.';
    lblImage4 = 'Sensitive groups should reduce outdoor activities.';
  } else if (value > 100 && value <= 150) {
    darkColor = darkOrange;
    lightColor = lightOrange;
    description = 'Unhealthy for\nsensitive groups';
    image = 'assets/icons/ic_face_sick.png';
    image1 = 'assets/icons/ic_orange_1.png';
    image2 = 'assets/icons/ic_orange_2.png';
    image3 = 'assets/icons/ic_orange_3.png';
    image4 = 'assets/icons/ic_orange_4.png';
    lblImage1 = 'Sensitive groups should wear a mask outdoors';
    lblImage2 = 'Close your windows to avoid dirty outdoor air.';
    lblImage3 = 'Sensitive groups should run an air purifier.';
    lblImage4 = 'Sensitive groups should reduce outdoor activities.';
  } else if (value > 150 && value <= 200) {
    darkColor = darkRed;
    lightColor = lightRed;
    description = 'Unhealty';
    image = 'assets/icons/ic_face_mask.png';
    image1 = 'assets/icons/ic_red_1.png';
    image2 = 'assets/icons/ic_red_2.png';
    image3 = 'assets/icons/ic_red_3.png';
    image4 = 'assets/icons/ic_red_4.png';
    lblImage1 = 'Wear a mask outdoors.';
    lblImage2 = 'Close your windows to avoid dirty outdoor air.';
    lblImage3 = 'Run an air purifier.';
    lblImage4 = 'Avoid outdoor activities.';
  } else if (value > 200 && value <= 300) {
    darkColor = darkPurple;
    lightColor = lightPurple;
    description = 'Very Unhealthy';
    image = 'assets/icons/ic_face_shield.png';
    image1 = 'assets/icons/ic_purple_1.png';
    image2 = 'assets/icons/ic_purple_2.png';
    image3 = 'assets/icons/ic_purple_3.png';
    image4 = 'assets/icons/ic_purple_4.png';
    lblImage1 = 'Wear a mask outdoors.';
    lblImage2 = 'Close your windows to avoid dirty outdoor air.';
    lblImage3 = 'Air purifier should be at the highest speed.';
    lblImage4 = 'Avoid outdoor activities.';
  } else if (value > 300 && value <= 500) {
    darkColor = darkDanger;
    lightColor = lightDanger;
    description = 'Hazardous';
    image = 'assets/icons/ic_face_danger.png';
    image1 = 'assets/icons/ic_dark_red_1.png';
    image2 = 'assets/icons/ic_dark_red_2.png';
    image3 = 'assets/icons/ic_dark_red_3.png';
    image4 = 'assets/icons/ic_dark_red_4.png';
    lblImage1 = 'Sensitive groups should wear a mask outdoors';
    lblImage2 = 'Open your windows to bring clean, fresh air indoors.';
    lblImage3 = 'Sensitive groups should run an air purifier.';
    lblImage4 = 'Enjoy outdoor activities.';
  } else {
    darkColor = darkDanger;
    lightColor = lightDanger;
    description = 'Unknown';
    image = 'assets/icons/ic_face_danger.png';
    image1 = 'assets/icons/ic_dark_red_1.png';
    image2 = 'assets/icons/ic_dark_red_2.png';
    image3 = 'assets/icons/ic_dark_red_3.png';
    image4 = 'assets/icons/ic_dark_red_4.png';
    lblImage1 = '';
    lblImage2 = '';
    lblImage3 = '';
    lblImage4 = 'Avoid all physical activity outdoors.';
  }

  return AqiUIObject(
      darkColor: darkColor,
      lightColor: lightColor,
      description: description,
      image: image,
      image1: image1,
      image2: image2,
      image3: image3,
      image4: image4,
      lblImage1: lblImage1,
      lblImage2: lblImage2,
      lblImage3: lblImage3,
      lblImage4: lblImage4);
}
