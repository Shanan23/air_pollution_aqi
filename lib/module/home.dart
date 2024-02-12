import 'package:air_pollution_application/controller/aqi_controller.dart';
import 'package:air_pollution_application/controller/home_controller.dart';
import 'package:air_pollution_application/controller/maps_controller.dart';
import 'package:air_pollution_application/model/aqi_ui.dart';
import 'package:air_pollution_application/router/route.dart';
import 'package:air_pollution_application/widget/circle_with_text.dart';
import 'package:air_pollution_application/widget/custom_bottom_navigation.dart';
import 'package:air_pollution_application/widget/custom_label_index.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final MapsController mapController = Get.find();
  final HomeController homeController = Get.put(HomeController());
  final AqiController aqiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleWithText(
                  pollutan: aqiController
                          .nearestCityData.value.data?.current?.pollution?.aqius
                          .toString() ??
                      "0",
                  location: aqiController.nearestCityData.value.data?.city
                          ?.toString() ??
                      "UNKNOWN",
                  circleColor: homeController.aqiUiObject.value.darkColor,
                  shadowColor: Colors.orange,
                  icWeather: aqiController
                          .nearestCityData.value.data?.current?.weather?.ic
                          ?.toString() ??
                      "ic_cloud",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: CustomLabelIndex(
                  pollutan: aqiController
                          .nearestCityData.value.data?.current?.pollution?.aqius
                          .toString() ??
                      "0",
                  image: homeController.aqiUiObject.value.image,
                  desc: homeController.aqiUiObject.value.description,
                  darkColor: homeController.aqiUiObject.value.darkColor,
                  lightColor: homeController.aqiUiObject.value.lightColor,
                ),
              ),
              chartBarWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
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
    }
  }

  Widget chartBarWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 1.66,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final barsSpace = 4.0 * constraints.maxWidth / 400;
            final barsWidth = 8.0 * constraints.maxWidth / 400;
            homeController.initData(barsSpace, barsWidth);

            return Obx(
              () => BarChart(
                BarChartData(
                  alignment: BarChartAlignment.center,
                  barTouchData: BarTouchData(
                    enabled: false,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        getTitlesWidget: homeController.bottomTitles,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: homeController.leftTitles,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value) => value % 10 == 0,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.red.withOpacity(0.1),
                      strokeWidth: 1,
                    ),
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  groupsSpace: barsSpace,
                  barGroups: homeController.barData.value,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
