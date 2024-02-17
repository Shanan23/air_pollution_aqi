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
import 'package:intl/intl.dart';

class AqiScreen extends StatelessWidget {
  final MapsController mapsController = Get.find();
  final HomeController homeController = Get.find();
  final AqiController aqiController = Get.find();
  CurrentLocation objMap = Get.arguments;

  @override
  Widget build(BuildContext context) {
    mapsController.getAqiData(objMap, true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Container(
            color: mapsController.aqiUiObject.value.lightColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            aqiController.nearestCityDataWaqi.value.data?.city
                                    ?.name ??
                                "null",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey,
                            width: double.infinity,
                            height: 1,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: CustomLabelIndex(
                            pollutan: aqiController
                                    .nearestCityDataWaqi.value.data?.aqi
                                    .toString() ??
                                "0",
                            image: mapsController.aqiUiObject.value.image,
                            desc: mapsController.aqiUiObject.value.description,
                            darkColor:
                                mapsController.aqiUiObject.value.darkColor,
                            lightColor:
                                mapsController.aqiUiObject.value.lightColor,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              DateFormat('HH:mm MMM dd yyyy')
                                  .format(DateTime.now()),
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey,
                            width: double.infinity,
                            height: 1,
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Recommendation",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 25),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (mapsController.aqiUiObject.value.lblImage1 ==
                                          '')
                                      ? Container()
                                      : Row(
                                          children: [
                                            Image.asset(
                                              mapsController.aqiUiObject.value
                                                  .image1, // Replace with your image path
                                              width: 60,
                                              height: 60,
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                mapsController.aqiUiObject.value
                                                    .lblImage1,
                                                style: TextStyle(fontSize: 8),
                                              ),
                                            )
                                          ],
                                        ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  (mapsController.aqiUiObject.value.lblImage2 ==
                                          '')
                                      ? Container()
                                      : Row(
                                          children: [
                                            Image.asset(
                                              mapsController.aqiUiObject.value
                                                  .image2, // Replace with your image path
                                              width: 60,
                                              height: 60,
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                mapsController.aqiUiObject.value
                                                    .lblImage2,
                                                style: TextStyle(fontSize: 8),
                                              ),
                                            )
                                          ],
                                        ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  (mapsController.aqiUiObject.value.lblImage3 ==
                                          '')
                                      ? Container()
                                      : Row(
                                          children: [
                                            Image.asset(
                                              mapsController.aqiUiObject.value
                                                  .image3, // Replace with your image path
                                              width: 60,
                                              height: 60,
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                mapsController.aqiUiObject.value
                                                    .lblImage3,
                                                style: TextStyle(fontSize: 8),
                                              ),
                                            )
                                          ],
                                        ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  (mapsController.aqiUiObject.value.lblImage4 ==
                                          '')
                                      ? Container()
                                      : Row(
                                          children: [
                                            Image.asset(
                                              mapsController.aqiUiObject.value
                                                  .image4, // Replace with your image path
                                              width: 60,
                                              height: 60,
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                mapsController.aqiUiObject.value
                                                    .lblImage4,
                                                style: TextStyle(fontSize: 8),
                                              ),
                                            )
                                          ],
                                        ),
                                ]),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Aqi by day",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 25),
                            ),
                          ),
                        ),
                        chartBarWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
