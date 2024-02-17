import 'package:air_pollution_application/controller/aqi_controller.dart';
import 'package:air_pollution_application/controller/home_controller.dart';
import 'package:air_pollution_application/controller/maps_controller.dart';
import 'package:air_pollution_application/model/aqi_ui.dart';
import 'package:air_pollution_application/model/current_location.dart';
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
    homeController.getCurrentLocationAqi();
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleWithText(
                    pollutan: aqiController.nearestCityDataWaqi.value.data?.aqi
                            .toString() ??
                        "0",
                    location: aqiController
                            .nearestCityDataWaqi.value.data?.city?.name
                            ?.split(",")[0]
                            .toString() ??
                        "UNKNOWN",
                    circleColor: homeController.aqiUiObject.value.darkColor,
                    shadowColor: Colors.orange,
                    icWeather: aqiController
                            .nearestCityData.value.data?.current?.weather?.ic
                            ?.toString() ??
                        "ic_cloud",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(children: [
                      Image.asset(
                        "assets/icons/ic_loc_home.png", // Replace with your image path
                        width: 50,
                        height: 50,
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(
                                      10)), // Adding corner radius to the row
                              color: Colors
                                  .white, // Setting container color dynamically
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Location Now",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  // "${aqiController.nearestCityData.value.data?.city}, ${aqiController.nearestCityData.value.data?.state},  ${aqiController.nearestCityData.value.data?.country}",
                                  "${aqiController.nearestCityDataWaqi.value.data?.city?.name}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onTap: () {
                      var currentLocation = CurrentLocation(
                          mapController.latitude.value,
                          mapController.longitude.value);
                      Get.toNamed(RouteName.aqi, arguments: currentLocation);
                    },
                    child: CustomLabelIndex(
                      pollutan: aqiController
                              .nearestCityDataWaqi.value.data?.aqi
                              .toString() ??
                          "0",
                      image: homeController.aqiUiObject.value.image,
                      desc: homeController.aqiUiObject.value.description,
                      darkColor: homeController.aqiUiObject.value.darkColor,
                      lightColor: homeController.aqiUiObject.value.lightColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            homeController.aqiUiObject.value
                                .image1, // Replace with your image path
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Image.asset(
                            homeController.aqiUiObject.value
                                .image2, // Replace with your image path
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Image.asset(
                            homeController.aqiUiObject.value
                                .image3, // Replace with your image path
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Image.asset(
                            homeController.aqiUiObject.value
                                .image4, // Replace with your image path
                            width: 60,
                            height: 60,
                          ),
                        ]),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Aqi by day",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                chartBarWidget(),
              ],
            ),
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
      case 3:
        Get.offAndToNamed(RouteName.about);
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
            final barsSpace = 30.0 * constraints.maxWidth / 400;
            final barsWidth = 8.0 * constraints.maxWidth / 400;
            homeController.initData(barsSpace, barsWidth);

            return BarChart(
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
                      interval: 10,
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
            );
          },
        ),
      ),
    );
  }
}
