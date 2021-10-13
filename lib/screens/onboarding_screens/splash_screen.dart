import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift_pay/screens/onboarding_screens/splash_screen_controller.dart';
import 'package:thrift_pay/theme/colors.dart';
import 'package:thrift_pay/theme/texts.dart';
import 'package:thrift_pay/utils/navigators.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (model) {
          return Scaffold(
            backgroundColor: colors.primaryColor,
            body: Center(
              child: Text(
                "ThriftPay",
                style: w800Style(18, Colors.white),
              ),
            ),
          );
        });
  }
}
