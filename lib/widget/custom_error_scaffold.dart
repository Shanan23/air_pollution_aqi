import 'package:air_pollution_application/common/dimen_const.dart';
import 'package:air_pollution_application/common/space.dart';
import 'package:air_pollution_application/common/theme.dart';
import 'package:air_pollution_application/router/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomErrorScaffold extends StatelessWidget {
  const CustomErrorScaffold({
    super.key,
    required this.error,
  });

  final FlutterErrorDetails error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mohon maaf',
              textAlign: TextAlign.center,
              style: myTextTheme.titleLarge,
            ),
            Text(
              'Terjadi kesalahan pada aplikasi',
              textAlign: TextAlign.center,
              style: myTextTheme.titleLarge,
            ),
            verticalSpaceRegular,
            SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF04B500)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: borderLarge,
                    ),
                  ),
                ),
                onPressed: () {
                  Get.offAllNamed(RouteName.home);
                },
                child: const Text(
                  'Kembali',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
