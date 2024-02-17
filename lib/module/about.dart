import 'package:air_pollution_application/controller/news_controller.dart';
import 'package:air_pollution_application/model/news_model.dart';
import 'package:air_pollution_application/router/route.dart';
import 'package:air_pollution_application/service/news_service.dart';
import 'package:air_pollution_application/widget/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text("About our App"),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text("Our Mission"),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text("Our Vision"),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text("Current Goals"),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text("Frequently Asked Questions"),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text("Will this app be free"),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3,
        onTap: (index) {
          handleNavigation(index);
        },
      ),
    );
  }

  void handleNavigation(int index) {
    // Handle navigation based on index
    switch (index) {
      case 0:
        Get.offAndToNamed(RouteName.home);
        break;
      case 1:
        Get.offAndToNamed(RouteName.maps);
        break;
      case 2:
        Get.offAndToNamed(RouteName.news);
        break;
      case 3:
        Get.offAndToNamed(RouteName.about);
        break;
    }
  }
}
