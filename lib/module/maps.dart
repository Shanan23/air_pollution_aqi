import 'package:air_pollution_application/controller/maps_controller.dart';
import 'package:air_pollution_application/model/current_location.dart';
import 'package:air_pollution_application/router/route.dart';
import 'package:air_pollution_application/widget/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapsScreen extends StatelessWidget {
  final MapsController mapController = Get.find();

  String formatDistance(double distance) {
    if (distance < 1.0) {
      return '${(distance * 1000).toStringAsFixed(2)} meters';
    } else {
      return '${distance.toStringAsFixed(2)} km';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(-6.211544, 106.845172),
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
                    child: Icon(
                      Icons.my_location,
                      color: Colors.red,
                    ),
                  ),
                ),
                ...mapController.points.map((point) {
                  double distance = mapController.calculateDistance(
                    CurrentLocation(mapController.latitude.value,
                        mapController.longitude.value),
                    CurrentLocation(point.latitude, point.longitude),
                  );
                  return Marker(
                    width: 30.0,
                    height: 30.0,
                    point: point,
                    child: Column(
                      children: [
                        Container(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                            height:
                                4), // Add some spacing between Icon and Text
                        Flexible(
                          child: Text(
                            formatDistance(distance),
                            style: TextStyle(fontSize: 12, color: Colors.black),
                            maxLines: 4, // Adjust the maximum number of lines
                            overflow: TextOverflow
                                .ellipsis, // Handle overflow with ellipsis
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
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
    }
  }
}
