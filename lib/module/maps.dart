import 'package:air_pollution_application/common/color.dart';
import 'package:air_pollution_application/controller/maps_controller.dart';
import 'package:air_pollution_application/model/aqi_ui.dart';
import 'package:air_pollution_application/router/route.dart';
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

  @override
  Widget build(BuildContext context) {
    mapController.getLocation();

    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            FlutterMap(
              options: const MapOptions(
                initialCenter: const LatLng(-6.211544, 106.845172),
                initialZoom: 10.0,
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
                      point: mapController.getCurrentLocation(),
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                padding: const EdgeInsets.all(0),
                                backgroundColor: Colors
                                    .transparent, // Set background color to transparent
                                content: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        const ListTile(
                                          textColor: Colors.black,
                                          title: Text('What is AQI?'),
                                          subtitle: Text(
                                              'The Air Quality Index was created as a simple way for us to understand the quality of the air we breathe. It is easy, just remember the color:'),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          color: lightGreen,
                                          child: Row(children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "    0 - 50   ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              height: 50,
                                              width: 1,
                                            ),
                                            const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Good",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          color: lightYellow,
                                          child: Row(children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                " 51 - 100 ",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              height: 50,
                                              width: 1,
                                            ),
                                            const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Moderate",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          color: lightOrange,
                                          child: Row(children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "101 - 150",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              height: 50,
                                              width: 1,
                                            ),
                                            const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Unhealthy for Group Sensitive",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          color: lightRed,
                                          child: Row(children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "151 - 200",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              height: 50,
                                              width: 1,
                                            ),
                                            const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Unhealthy",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          color: lightPurple,
                                          child: Row(children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "201 - 300",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              height: 50,
                                              width: 1,
                                            ),
                                            const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Very Unhealthy",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          color: lightDanger,
                                          child: Row(children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 8.0,
                                                  left: 8.0,
                                                  right: 8.0),
                                              child: Text(
                                                "301 - 500",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              height: 50,
                                              width: 1,
                                            ),
                                            const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Hazardous",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  searchTextField = AutoCompleteTextField<String>(
                    key: key,
                    suggestions: mapController.suggestions,
                    decoration: const InputDecoration(
                      hintText: "Type a city",
                      labelText: "City",
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
                      mapController.getAqiData(objMap, true);
                      Get.toNamed(RouteName.aqi);
                    },
                    itemSubmitted: (item) {
                      print("submited : $item");
                      var index = mapController.suggestions.indexOf(item);
                      var objMap = mapController.allLocations[index];
                      mapController.getAqiData(objMap, true);
                      Get.toNamed(RouteName.aqi);
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
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
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
}
