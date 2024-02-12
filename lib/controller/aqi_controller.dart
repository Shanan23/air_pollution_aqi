import 'dart:convert';
import 'dart:math';

import 'package:air_pollution_application/model/current_location.dart';
import 'package:air_pollution_application/model/nearest_city_data/nearest_city_data.dart';
import 'package:air_pollution_application/service/aqi_service.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class AqiController extends GetxController {
  Rx<NearestCityData> nearestCityData = NearestCityData().obs;
  AqiService aqiService = AqiService();

  @override
  void onInit() {
    super.onInit();
  }

  Future<NearestCityData?> getAqiData(String lat, String long) async {
    NearestCityData? cityData;
    try {
      cityData = await aqiService.getAqiNearest(lat, long);
      nearestCityData.value = cityData;
    } catch (error) {
      print('Error fetching city data: $error');
    }
    return cityData;
  }
}
