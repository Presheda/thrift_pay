import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift_pay/screens/home_screens/dashboard_screen.dart';

import 'sign_up_screen.dart';

class SignInScreenController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController dobController = TextEditingController();

  void goRegisterScreen() {
    Get.to(SignUpScreen());
  }

  void signInClicked() {


    return;
    Get.offAll(DashboardScreen());
  }
}
