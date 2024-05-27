import 'dart:convert';
import 'dart:math';

import 'package:air_pollution_application/controller/aqi_controller.dart';
import 'package:air_pollution_application/model/aqi_ui.dart';
import 'package:air_pollution_application/model/current_location.dart';
import 'package:air_pollution_application/model/lat_long_with_aqi.dart';
import 'package:air_pollution_application/model/waqi_response/waqi_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapsController extends GetxController {
  final AqiController aqiController = Get.put(AqiController());

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  var currentLatLong = const LatLng(0.0, 0.0).obs;
  var selectedLatLong = const LatLng(0.0, 0.0).obs;
  RxList<String> suggestions = [""].obs;
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  final List<LatLongWithAqi> points =
      [LatLongWithAqi(LatLng(-6.211544, 106.845172), 0)].obs;
  List<CurrentLocation> allLocations = [
    CurrentLocation(-6.211544, 106.845172),
    // Add more locations as needed
  ];
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

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loadPointsFromJson() async {
    try {
      // Load the JSON file from the assets folder
      String jsonString = await rootBundle.loadString('assets/regencies.json');
      String jsonStringCities =
          await rootBundle.loadString('assets/cities.json');

      // Parse the JSON data
      List<dynamic> jsonList = jsonDecode(jsonString);
      List<dynamic> jsonListCities = jsonDecode(jsonStringCities);
      allLocations.clear();
      points.clear();
      suggestions.clear();

      // Convert JSON data to LatLng objects and add to the list
      jsonList.forEach((jsonPoint) {
        double latitude = jsonPoint['latitude'].toDouble();
        double longitude = jsonPoint['longitude'].toDouble();
        String name = jsonPoint['name'];
        // print("all locations within : ${latitude}, ${longitude}");
        suggestions.add(name);
        allLocations.add(CurrentLocation(latitude, longitude));
      });

      // Convert JSON data to LatLng objects and add to the list
      jsonListCities.forEach((jsonPoint) {
        print("country : ${jsonPoint['country']}");

        if (jsonPoint['country'] == "SG" || jsonPoint['country'] == "MY") {
          double latitude = double.parse(jsonPoint['lat']);
          double longitude = double.parse(jsonPoint['lng']);
          String name = jsonPoint['name'];
          suggestions.add(name);
          allLocations.add(CurrentLocation(latitude, longitude));
        }
      });

      await getAqiFromDistance(latitude.value, longitude.value);
    } catch (e) {
      print("Error loading points from JSON: $e");
    }
  }

  Future<void> getAqiFromDistance(selectedLat, selectedLng) async {
    double maxDistance = 100.0; // Maximum distance in kilometers
    
    List<CurrentLocation> nearestLocations = findNearestLocations(
        CurrentLocation(selectedLat, selectedLng), allLocations, maxDistance);
    
    print(
        "Nearest locations within $maxDistance km: ${selectedLat}, ${selectedLng}");
    
    for (CurrentLocation location in nearestLocations) {
      WaqiResponse? cityDataWaqi = await getAqiData(location, false);
    
      points.add(LatLongWithAqi(LatLng(location.latitude, location.longitude),
          cityDataWaqi?.data?.aqi?.toInt() ?? 0));
    
      print(
          "Latitude: ${location.latitude}, Longitude: ${location.longitude}");
      print("Aqi: ${cityDataWaqi?.data?.aqi}");
    }
    
    // Now, your `points` list is updated with the points from the JSON file
    print(points);
  }

  Future<WaqiResponse?> getAqiData(
      CurrentLocation location, bool isPublic) async {
    var cityDataWaqi = await aqiController.getAqiDataWaqi(
        location.latitude.toString(), location.longitude.toString(), isPublic);

    var customAqi = getAqiObject(cityDataWaqi?.data?.aqi ?? 0);
    if (isPublic) {
      aqiUiObject.value = customAqi;
    }
    print("mapscontroller getAqiData aqi: ${cityDataWaqi?.data?.aqi}");
    print("mapscontroller getAqiData cityDataWaqi: $cityDataWaqi");
    print("mapscontroller getAqiData customAqi: $customAqi");
    print("mapscontroller getAqiData isPublic: $isPublic");
    return cityDataWaqi;
  }

  // Method to check if a point is the current location
  LatLng getCurrentLocation() {
    print(
        "mapscontroller currentLocation: ${latitude.value}, ${longitude.value}");
    currentLatLong.value = LatLng(latitude.value, longitude.value);
    currentLatLong.refresh();
    selectedLatLong = currentLatLong;
    return LatLng(latitude.value, longitude.value);
  }

  Future<void> getLocation() async {
    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      var currentLocation = await location.getLocation();
      latitude.value = currentLocation.latitude!;
      longitude.value = currentLocation.longitude!;
      print("Current location: ${latitude.value}, ${longitude.value}");
      getCurrentLocation();
      await getAqiFromDistance(latitude.value, longitude.value);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<void> setSelectedLatLng(latitude, longitude) async {
    try {
      selectedLatLong.value = LatLng(latitude, longitude);
      print("SelectedLocation location: ${latitude}, ${longitude}");
      await getAqiFromDistance(latitude, longitude);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  double calculateDistance(
      CurrentLocation location1, CurrentLocation location2) {
    const double earthRadius = 6371; // Earth's radius in kilometers

    double lat1 = location1.latitude * (pi / 180);
    double lon1 = location1.longitude * (pi / 180);
    double lat2 = location2.latitude * (pi / 180);
    double lon2 = location2.longitude * (pi / 180);

    double dlat = lat2 - lat1;
    double dlon = lon2 - lon1;

    double a =
        pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  List<CurrentLocation> findNearestLocations(CurrentLocation myLocation,
      List<CurrentLocation> locations, double maxDistance) {
    List<CurrentLocation> nearestLocations = [];

    for (CurrentLocation location in locations) {
      double distance = calculateDistance(myLocation, location);
      if (distance <= maxDistance) {
        nearestLocations.add(location);
      }
    }

    nearestLocations.sort((a, b) => calculateDistance(myLocation, a)
        .compareTo(calculateDistance(myLocation, b)));

    return nearestLocations;
  }
}
