import 'package:air_pollution_application/common/const.dart';
import 'package:air_pollution_application/common/theme.dart';
import 'package:air_pollution_application/router/route.dart';
import 'package:air_pollution_application/widget/custom_error_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key, this.isDev = false});

  final bool isDev;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.myTheme(context),
        builder: EasyLoading.init(
          builder: (BuildContext context, Widget? widget) {
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return CustomErrorScaffold(error: errorDetails);
            };
            return widget ?? Container();
          },
        ),
        initialRoute: RouteName.splash,
        getPages: routeApp,
      ),
    );
  }
}
