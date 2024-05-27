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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: const Text(
          'ABOUT AIRPOLLUTION',
          style: TextStyle(fontSize: 25),
        )),
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.aboutd, arguments: {
                'title': "About our App",
                'content':
                    "AIRPOLLUTION is a mobile application designed to empower individuals with real-time insights into air quality metrics. Developed by a passionate team of university students, our app aims to raise awareness about the critical issue of air pollution and its impact on health and the environment.",
              });
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "About our App",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.aboutd, arguments: {
                'title': "Our Mission",
                'content':
                    "our mission is to democratize access to air quality information and empower users to make informed decisions to protect their health and well-being. We strive to foster a community dedicated to advocating for cleaner air and driving positive change towards sustainable living.",
              });
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Our Mission",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.aboutd, arguments: {
                'title': "Our Vision",
                'content':
                    " Through our app, we aspire to create a global network of environmentally conscious individuals who actively contribute to reducing air pollution and preserving the planet for future generations.",
              });
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Our Vision",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.aboutd, arguments: {
                'title': "Current Goals",
                'content':
                    "- Continuously improve the accuracy and reliability of our air quality data.\n\n- Expand our user base to reach a wider audience and raise awareness about air pollution.\n\n- Enhance user experience by incorporating new features and functionalities based on user feedback.",
              });
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Current Goals",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.aboutd, arguments: {
                'title': "Contact Us",
                'content':
                    "Have questions, feedback, or suggestions? We'd love to hear from you! Feel free to reach out to us at [phone number] or through  [email address] or connect with us on social media platforms [Instagram/Twitter/Facebook] ",
              });
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Current Goals",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Frequently Asked Questions",
              style: TextStyle(fontSize: 20),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.aboutd, arguments: {
                'title': "Will this app be free?",
                'content':
                    "Currently, AIRPOLLUTION is available for free download and use. However, as we continue to grow and expand our features, there may be premium offerings or optional in-app purchases in the future. Rest assured, our core mission remains to provide accessible air quality information to all users.",
              });
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Will this app be free?",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.aboutd, arguments: {
                'title': "Why do I keep getting error?",
                'content':
                    "If you encounter errors while using our app, please ensure that you have a stable internet connection and that your device meets the minimum system requirements. If the issue persists, feel free to contact our support team for assistance.",
              });
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Why do I keep getting error?",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.aboutd, arguments: {
                'title': "Is the AQI accurate?",
                'content':
                    "We strive to provide the most accurate and up-to-date air quality index (AQI) data possible. However, it's important to note that air quality can vary depending on various factors such as location, weather conditions, and sources of pollution. We continuously work to improve the accuracy of our data and welcome any feedback or concerns from our users.",
              });
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Is the AQI accurate?",
                style: TextStyle(fontSize: 14),
              ),
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
