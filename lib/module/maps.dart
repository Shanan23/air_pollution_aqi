import 'package:air_pollution_application/common/color.dart';
import 'package:air_pollution_application/controller/maps_controller.dart';
import 'package:air_pollution_application/model/aqi_ui.dart';
import 'package:air_pollution_application/model/current_location.dart';
import 'package:air_pollution_application/model/lat_long_with_aqi.dart';
import 'package:air_pollution_application/router/route.dart';
import 'package:air_pollution_application/widget/circle_with_aqi.dart';
import 'package:air_pollution_application/widget/circle_with_text.dart';
import 'package:air_pollution_application/widget/custom_bottom_navigation.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapsScreen extends StatelessWidget {
  final MapsController mapController = Get.find();
  late AutoCompleteTextField searchTextField;
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  final MapController _mapController =
      MapController(); // Initialize the MapController

  @override
  Widget build(BuildContext context) {
    // mapController.getLocation();

    mapController.selectedLatLong.listen((latLng) {
      _mapController.move(latLng, mapController.zoom.value);
    });

    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => FlutterMap(
              mapController: _mapController, // Use the MapController
              options: MapOptions(
                initialCenter: mapController.selectedLatLong.value,
                initialZoom: mapController.zoom.value,
                onTap: (tapPosition, point) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  mapController.setSelectedLatLng(mapController.latitude.value,
                      mapController.longitude.value, 8.0);
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 30.0,
                      height: 30.0,
                      point: mapController.selectedLatLong.value,
                      child: Container(
                        child: const Icon(
                          Icons.my_location,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    ...mapController.points.map((point) {
                      var customAqi = getAqiObject(point.aqi.toInt());

                      return Marker(
                        width: 30.0,
                        height: 30.0,
                        point: point.latLng,
                        child: GestureDetector(
                          onTap: () {
                            mapController.setSelectedLatLng(
                                point.latLng.latitude,
                                point.latLng.longitude,
                                15.0);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();

                            final snackBar = SnackBar(
                              padding: const EdgeInsets.all(0),
                              backgroundColor: Colors.transparent,
                              content: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  child: Column(
                                    children: _buildAqiDetail(
                                        context, point, customAqi),
                                  ),
                                ),
                              ),
                            );

                            // Show the Snackbar
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //     padding: const EdgeInsets.all(0),
                            //     backgroundColor: Colors
                            //         .transparent, // Set background color to transparent
                            //     content: Padding(
                            //       padding: const EdgeInsets.only(
                            //           left: 20, right: 20),
                            //       child: Container(
                            //         decoration: const BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: BorderRadius.only(
                            //                 topLeft: Radius.circular(10),
                            //                 topRight: Radius.circular(10))),
                            //         child: Column(
                            //           children: _buildAqiLegend(),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: customAqi.lightColor,
                                radius: 15.0,
                                child: Text(
                                  point.aqi.toString(),
                                  style: TextStyle(
                                    color: (customAqi.description == "Moderate")
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                searchTextField = AutoCompleteTextField<String>(
                  key: key,
                  suggestions: mapController.suggestions,
                  decoration: const InputDecoration(
                    hintText: "Type a city",
                    labelText: "Search",
                    filled: true,
                    fillColor: Colors.white, // Background color
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black), // Border color
                    ),
                  ),
                  itemFilter: (item, query) {
                    return item.toLowerCase().contains(query.toLowerCase());
                  },
                  itemSorter: (a, b) {
                    return a.compareTo(b);
                  },
                  textSubmitted: (data) {
                    print("submited : $data");
                    var index = mapController.suggestions.indexOf(data);
                    var objMap = mapController.allLocations[index];

                    mapController.setSelectedLatLng(
                        objMap.latitude, objMap.longitude, 8.0);
                    // Get.toNamed(RouteName.aqi, arguments: objMap);
                  },
                  itemSubmitted: (item) {
                    print("submited : $item");
                    var index = mapController.suggestions.indexOf(item);
                    var objMap = mapController.allLocations[index];

                    mapController.setSelectedLatLng(
                        objMap.latitude, objMap.longitude, 8.0);
                    // Get.toNamed(RouteName.aqi, arguments: objMap);
                  },
                  submitOnSuggestionTap: true,
                  itemBuilder: (context, item) {
                    return Container(
                      color: Colors.white, // Background color
                      child: ListTile(
                        title: Text(
                          item,
                          style: const TextStyle(
                              color: Colors.black), // Text color
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          handleNavigation(index);
        },
      ),
    );
  }

  List<Widget> _buildAqiDetail(
      context, LatLongWithAqi point, AqiUIObject customAqi) {
    return [
      Container(
        width: double.infinity,
        height: 50,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                point.name,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              GestureDetector(
                child: Icon(Icons.arrow_forward),
                onTap: () {
                  CurrentLocation currentLocation = CurrentLocation(
                      point.latLng.latitude, point.latLng.longitude);
                  Get.toNamed(RouteName.aqi, arguments: currentLocation);
                },
              ),
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: 50,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                customAqi.description,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Align(
                alignment: Alignment.center,
                child: CircleWithAqi(
                  pollutan: point.aqi.toString(),
                  circleColor: customAqi.darkColor,
                ),
              ),
              GestureDetector(
                child: Icon(Icons.info),
                onTap: () {
                  final snackBar = SnackBar(
                    padding: const EdgeInsets.all(0),
                    backgroundColor: Colors.transparent,
                    content: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Column(
                          children: _buildAqiLegend(),
                        ),
                      ),
                    ),
                    duration:
                        const Duration(days: 1), // Set to a very long duration
                  );

                  // Show the Snackbar
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        width: double.infinity,
        height: 50,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                customAqi.image1, // Replace with your image path
                width: 60,
                height: 60,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  customAqi.lblImage1,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildAqiLegend() {
    return [
      const ListTile(
        textColor: Colors.black,
        title: Text('What is AQI?'),
        subtitle: Text(
            'The Air Quality Index was created as a simple way for us to understand the quality of the air we breathe. It is easy, just remember the color:'),
      ),
      const SizedBox(
        height: 10,
      ),
      _buildAqiRow("    0 - 50   ", "Good", lightGreen, Colors.white),
      _buildAqiRow(" 51 - 100 ", "Moderate", lightYellow, Colors.black),
      _buildAqiRow("101 - 150", "Unhealthy for Group Sensitive", lightOrange,
          Colors.white),
      _buildAqiRow("151 - 200", "Unhealthy", lightRed, Colors.white),
      _buildAqiRow("201 - 300", "Very Unhealthy", lightPurple, Colors.white),
      _buildAqiRow("301 - 500", "Hazardous", lightDanger, Colors.white),
    ];
  }

  Widget _buildAqiRow(String range, String description, Color backgroundColor,
      Color textColor) {
    return Container(
      width: double.infinity,
      height: 50,
      color: backgroundColor,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              range,
              style: TextStyle(color: textColor),
            ),
          ),
          Container(color: Colors.white, height: 50, width: 1),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: TextStyle(color: textColor),
              ),
            ),
          ),
        ],
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
