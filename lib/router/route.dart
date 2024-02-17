import 'package:air_pollution_application/controller/aqi_controller.dart';
import 'package:air_pollution_application/controller/home_controller.dart';
import 'package:air_pollution_application/controller/maps_controller.dart';
import 'package:air_pollution_application/controller/news_controller.dart';
import 'package:air_pollution_application/module/about.dart';
import 'package:air_pollution_application/module/aqi_detail.dart';
import 'package:air_pollution_application/module/home.dart';
import 'package:air_pollution_application/module/maps.dart';
import 'package:air_pollution_application/module/news.dart';
import 'package:air_pollution_application/module/splash.dart';
import 'package:air_pollution_application/module/webview_page.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class RouteName {
  static const splash = '/splash';
  static const home = '/home';
  static const maps = '/maps';
  static const news = '/news';
  static const newsd = '/newsd';
  static const about = '/about';
  static const aqi = '/aqi';
}

final List<GetPage> routeApp = [
  GetPage(
      name: RouteName.splash,
      page: () => SplashScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<MapController>(() => MapController());
      })),
  GetPage(
    name: RouteName.home,
    page: () => HomeScreen(),
    binding: BindingsBuilder(() {
      Get.lazyPut<MapsController>(() => MapsController());
      Get.lazyPut<HomeController>(() => HomeController());
      Get.lazyPut<AqiController>(() => AqiController());
    }),
  ),
  GetPage(
    name: RouteName.aqi,
    page: () => AqiScreen(),
    binding: BindingsBuilder(() {
      Get.lazyPut<MapsController>(() => MapsController());
      Get.lazyPut<HomeController>(() => HomeController());
      Get.lazyPut<AqiController>(() => AqiController());
    }),
  ),
  GetPage(
    name: RouteName.news,
    page: () => NewsScreen(),
    binding: BindingsBuilder(() {
      Get.lazyPut<NewsController>(() => NewsController());
    }),
  ),
  GetPage(
    name: RouteName.newsd,
    page: () => WebViewPage(),
    binding: BindingsBuilder(() {
      Get.lazyPut<NewsController>(() => NewsController());
    }),
  ),
  GetPage(
    name: RouteName.maps,
    page: () => MapsScreen(),
    binding: BindingsBuilder(() {
      Get.lazyPut<MapsController>(() => MapsController());
    }),
  ),
  GetPage(
    name: RouteName.about,
    page: () => AboutScreen(),
  ),
];
