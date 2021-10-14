import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift_pay/datanodel/user_data.dart';
import 'package:thrift_pay/locator.dart';
import 'package:thrift_pay/screens/home_screens/dashboard_screen.dart';
import 'package:thrift_pay/service/auth_service.dart';
import 'package:thrift_pay/service/user_data_service.dart';
import 'package:thrift_pay/widgets/custom_snackbar.dart';

import 'sign_up_screen.dart';

class SignInScreenController extends GetxController {
  AuthService _authService = locator<AuthService>();

  UserDataService _userDataService = UserDataService();

  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  int loading = 0;

  bool enableField = true;

  void goRegisterScreen() {
    Get.to(SignUpScreen());
  }

  void signInClicked() async {
    String phone = numberController.text.trim();
    String pin = passwordController.text.trim();

    if (phone.isEmpty || phone.length < 11) {
      CustomSnackBar.errorSnackBar(title: "Phone must be 11 digits or more");

      return;
    }

    if (pin.isEmpty || pin.length < 4 || pin.length > 6) {
      CustomSnackBar.errorSnackBar(title: "Pin must be 6 - 4 digits");
      return;
    }

    loading = 1;

    enableField = false;

    update();

    var result = await _authService.login(phone: phone, pin: pin);

    if (result == -1) {
      CustomSnackBar.errorSnackBar(title: "Sign In Failed. Please try again");
    } else if (result is Map<String, dynamic>) {
      Get.offAll(DashboardScreen(), arguments: result);
    } else {

      print(result);
      CustomSnackBar.errorSnackBar(title: result);
    }

    loading = 0;
    enableField = true;

    update();
  }
}
