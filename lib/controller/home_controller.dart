import 'package:air_pollution_application/controller/aqi_controller.dart';
import 'package:air_pollution_application/controller/maps_controller.dart';
import 'package:air_pollution_application/model/aqi_ui.dart';
import 'package:air_pollution_application/model/nearest_city_data/nearest_city_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<BarChartGroupData> barData = <BarChartGroupData>[].obs;
  Rx<AqiUIObject> aqiUiObject = AqiUIObject(
          description: "",
          image: "assets/icons/ic_face_happy.png",
          image1: "assets/icons/ic_dark_red_1.png",
          image2: "assets/icons/ic_dark_red_2.png",
          image3: "assets/icons/ic_dark_red_3.png",
          image4: "assets/icons/ic_dark_red_4.png",
          lblImage1: '',
          lblImage2: '',
          lblImage3: '',
          lblImage4: 'Avoid all physical activity outdoors.')
      .obs;
  final MapsController mapController = Get.find();
  final AqiController aqiController = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  void initData(double barsSpace, double barsWidth) {
    var data = getData(barsWidth, barsSpace);
    barData.assignAll(data);
  }

  Future<void> getCurrentLocationAqi() async {
    var lat = mapController.latitude.value;
    var long = mapController.longitude.value;

    // var cityData =
    //     await aqiController.getAqiDatawaqi(lat.toString(), long.toString());
    var cityDataWaqi = await aqiController.getAqiDataWaqi(
        lat.toString(), long.toString(), true);
    print("cityDataWaqi : $cityDataWaqi");

    if (cityDataWaqi != null) {
      aqiController.nearestCityDataWaqi.value = cityDataWaqi;
    }
    // if (cityDataWaqi?.status != "success") {
    //   return;
    // }
    if (cityDataWaqi?.status != "ok") {
      return;
    }
    // var customAqi =
    //     getAqiObject(cityData?.data?.current?.pollution?.aqius ?? 0);

    var customAqi = getAqiObject(cityDataWaqi?.data?.aqi ?? 0);

    aqiUiObject.value = customAqi;
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    print(
        "getData Chart : ${aqiController.nearestCityDataWaqi.value.data?.city?.name}");
    return aqiController.nearestCityDataWaqi.value.data?.forecast?.daily?.pm10
            ?.map((data) {
          final double avg = data.avg?.toDouble() ?? 0.0;
          var customAqi = getAqiObject(avg.toInt());

          print("avg : $avg");
          final int index = aqiController
                  .nearestCityDataWaqi.value.data?.forecast?.daily?.pm10
                  ?.indexOf(data) ??
              0;

          return BarChartGroupData(
            x: index,
            barsSpace: barsSpace,
            barRods: [
              BarChartRodData(
                toY: avg,
                rodStackItems: [
                  BarChartRodStackItem(
                      0, avg, customAqi.lightColor ?? Colors.blue),
                ],
                borderRadius: BorderRadius.zero,
                width: barsWidth,
              ),
            ],
          );
        }).toList() ??
        [];
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 8);
    String text;

    // Extracting the month abbreviation from the date
    final date =
        DateTime.parse('2024-02-14').add(Duration(days: value.toInt()));
    text = "${date.day}";

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
      fontSize: 8,
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
