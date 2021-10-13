import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift_pay/screens/home_screens/dashboard_screen.dart';

import 'sign_up_screen.dart';

class AdditionalScreenController extends GetxController{



  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToDashboard() {

    Get.off(DashboardScreen());

  }





}