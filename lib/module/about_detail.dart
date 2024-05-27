import 'package:air_pollution_application/controller/news_controller.dart';
import 'package:air_pollution_application/model/news_model.dart';
import 'package:air_pollution_application/router/route.dart';
import 'package:air_pollution_application/service/news_service.dart';
import 'package:air_pollution_application/widget/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments;
    String title = arguments['title'];
    String content = arguments['content'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
                  title,
                  style: TextStyle(fontSize: 25),
                ),
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              content,
              style: TextStyle(fontSize: 14),
            ),
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
        Get.toNamed(RouteName.home);
        break;
      case 1:
        Get.toNamed(RouteName.maps);
        break;
      case 2:
        Get.toNamed(RouteName.news);
        break;
      case 3:
        Get.toNamed(RouteName.about);
        break;
    }
  }
}
