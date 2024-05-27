import 'package:air_pollution_application/common/dimen_const.dart';
import 'package:air_pollution_application/common/theme.dart';
import 'package:air_pollution_application/controller/aqi_controller.dart';
import 'package:air_pollution_application/controller/home_controller.dart';
import 'package:air_pollution_application/controller/maps_controller.dart';
import 'package:air_pollution_application/router/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif_plus/flutter_gif_plus.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final MapsController mapController = Get.put(MapsController());
  final HomeController homeController = Get.put(HomeController());
  final AqiController aqiController = Get.put(AqiController());

  @override
  Widget build(BuildContext context) {
    mapController.loadPointsFromJson();
    mapController.getLocation().then((value) => {Get.toNamed(RouteName.home)});

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Air Pollution',
              textAlign: TextAlign.center,
              style: myTextTheme.titleLarge,
            ),
            Center(
              child: Image.asset(
                'assets/gif/loading.gif',
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
