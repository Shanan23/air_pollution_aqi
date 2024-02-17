import 'dart:convert';
import 'dart:math';

import 'package:air_pollution_application/model/current_location.dart';
import 'package:air_pollution_application/model/nearest_city_data/nearest_city_data.dart';
import 'package:air_pollution_application/model/waqi_response/waqi_response.dart';
import 'package:air_pollution_application/service/aqi_service.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class AqiController extends GetxController {
  Rx<NearestCityData> nearestCityData = NearestCityData().obs;
  Rx<WaqiResponse> nearestCityDataWaqi = WaqiResponse().obs;
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
      print('Error fetching city data Aqi: $error');
    }
    return cityData;
  }

  Future<WaqiResponse?> getAqiDataWaqi(
      String lat, String long, bool isPublic) async {
    WaqiResponse? cityData;
    try {
      if (lat == "0.0" && long == "0.0") {
        throw Exception("0.0 lat long");
      }
      cityData = await aqiService.getAqiNearestWaqi(lat, long);
      if (isPublic) {
        nearestCityDataWaqi.value = cityData;
        nearestCityDataWaqi.update((val) {
          nearestCityDataWaqi.value = cityData!;
        });
      }
    } catch (error) {
      print('Error fetching city data Waqi: $error');
    }
    return cityData;
  }
}
