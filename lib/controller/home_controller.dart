import 'package:air_pollution_application/controller/aqi_controller.dart';
import 'package:air_pollution_application/controller/maps_controller.dart';
import 'package:air_pollution_application/model/aqi_ui.dart';
import 'package:air_pollution_application/model/nearest_city_data/nearest_city_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<BarChartGroupData> barData = <BarChartGroupData>[].obs;
  Rx<AqiUIObject> aqiUiObject = AqiUIObject(description: "", image: "assets/icons/ic_face_happy.png").obs;
  final MapsController mapController = Get.find();
  final AqiController aqiController = Get.put(AqiController());

  @override
  void onInit() {
    super.onInit();
    getCurrentLocationAqi();
  }

  void initData(double barsSpace, double barsWidth) {
    var data = getData(barsWidth, barsSpace);
    barData.assignAll(data);
  }

  final Color dark = Colors.red;
  final Color normal = Colors.orange;
  final Color light = Colors.yellow;

  Future<void> getCurrentLocationAqi() async {
    var lat = mapController.latitude.value;
    var long = mapController.longitude.value;

    var cityData =
        await aqiController.getAqiData(lat.toString(), long.toString());
    if (cityData?.status != "success") {
      return;
    }
    var customAqi =
        getAqiObject(cityData?.data?.current?.pollution?.aqius ?? 0);

    aqiUiObject.value = customAqi;
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 170,
            rodStackItems: [
              BarChartRodStackItem(0, 20, dark),
              BarChartRodStackItem(20, 120, normal),
              BarChartRodStackItem(120, 170, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 240,
            rodStackItems: [
              BarChartRodStackItem(0, 130, dark),
              BarChartRodStackItem(130, 140, normal),
              BarChartRodStackItem(140, 240, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 230.5,
            rodStackItems: [
              BarChartRodStackItem(0, 60.5, dark),
              BarChartRodStackItem(60.5, 180, normal),
              BarChartRodStackItem(180, 230.5, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 290,
            rodStackItems: [
              BarChartRodStackItem(0, 90, dark),
              BarChartRodStackItem(90, 150, normal),
              BarChartRodStackItem(150, 290, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 320,
            rodStackItems: [
              BarChartRodStackItem(0, 20.5, dark),
              BarChartRodStackItem(20.5, 170.5, normal),
              BarChartRodStackItem(170.5, 320, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 310,
            rodStackItems: [
              BarChartRodStackItem(0, 110, dark),
              BarChartRodStackItem(110, 180, normal),
              BarChartRodStackItem(180, 310, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 350,
            rodStackItems: [
              BarChartRodStackItem(0, 140, dark),
              BarChartRodStackItem(140, 270, normal),
              BarChartRodStackItem(270, 350, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 310,
            rodStackItems: [
              BarChartRodStackItem(0, 80, dark),
              BarChartRodStackItem(80, 240, normal),
              BarChartRodStackItem(240, 310, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 150,
            rodStackItems: [
              BarChartRodStackItem(0, 60.5, dark),
              BarChartRodStackItem(60.5, 120.5, normal),
              BarChartRodStackItem(120.5, 150, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 170,
            rodStackItems: [
              BarChartRodStackItem(0, 90, dark),
              BarChartRodStackItem(90, 150, normal),
              BarChartRodStackItem(150, 170, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 340,
            rodStackItems: [
              BarChartRodStackItem(0, 60, dark),
              BarChartRodStackItem(60, 230, normal),
              BarChartRodStackItem(230, 340, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 320,
            rodStackItems: [
              BarChartRodStackItem(0, 70, dark),
              BarChartRodStackItem(70, 240, normal),
              BarChartRodStackItem(240, 320, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 140.5,
            rodStackItems: [
              BarChartRodStackItem(0, 10.5, dark),
              BarChartRodStackItem(10.5, 120, normal),
              BarChartRodStackItem(120, 140.5, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 200,
            rodStackItems: [
              BarChartRodStackItem(0, 40, dark),
              BarChartRodStackItem(40, 150, normal),
              BarChartRodStackItem(150, 200, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 240,
            rodStackItems: [
              BarChartRodStackItem(0, 40, dark),
              BarChartRodStackItem(40, 150, normal),
              BarChartRodStackItem(150, 240, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 140,
            rodStackItems: [
              BarChartRodStackItem(0, 10.5, dark),
              BarChartRodStackItem(10.5, 120, normal),
              BarChartRodStackItem(120, 140, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 270,
            rodStackItems: [
              BarChartRodStackItem(0, 70, dark),
              BarChartRodStackItem(70, 250, normal),
              BarChartRodStackItem(250, 270, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 290,
            rodStackItems: [
              BarChartRodStackItem(0, 60, dark),
              BarChartRodStackItem(60, 230, normal),
              BarChartRodStackItem(230, 290, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 160.5,
            rodStackItems: [
              BarChartRodStackItem(0, 90, dark),
              BarChartRodStackItem(90, 150, normal),
              BarChartRodStackItem(150, 160.5, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 150,
            rodStackItems: [
              BarChartRodStackItem(0, 70, dark),
              BarChartRodStackItem(70, 120.5, normal),
              BarChartRodStackItem(120.5, 150, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
    ];
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Apr';
        break;
      case 1:
        text = 'May';
        break;
      case 2:
        text = 'Jun';
        break;
      case 3:
        text = 'Jul';
        break;
      case 4:
        text = 'Aug';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }
}
