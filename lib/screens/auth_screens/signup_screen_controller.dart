import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift_pay/datanodel/user_data.dart';
import 'package:thrift_pay/locator.dart';
import 'package:thrift_pay/screens/home_screens/dashboard_screen.dart';
import 'package:thrift_pay/service/auth_service.dart';
import 'package:thrift_pay/widgets/custom_snackbar.dart';

import 'additional_info.dart';
import 'sign_in_screen.dart';

class SignUpScreenController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();
  TextEditingController agentController = TextEditingController();

  AuthService _authService = locator<AuthService>();

  int loading = 0;

  bool isAgent = false;

  void goToAdditionalInfoScreen() async {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String pin = pinController.text.trim();
    String phone = numberController.text.trim();

    String agentCode = agentController.text.trim();

    if (firstName.isEmpty || firstName.length < 3) {
      CustomSnackBar.errorSnackBar(
          title: "First name must be 3 characters or more");
      return;
    }

    if (lastName.isEmpty || lastName.length < 3) {
      CustomSnackBar.errorSnackBar(
          title: "Last name must be 3 characters or more");
      return;
    }

    if (phone.isEmpty || phone.length < 11) {
      CustomSnackBar.errorSnackBar(title: "Phone must be 11 digits or more");

      return;
    }

    if (pin.isEmpty || pin.length < 4 || pin.length > 6) {
      CustomSnackBar.errorSnackBar(title: "Pin must be 6 - 4 digits");
      return;
    }

    if (!isAgent) {
      if (agentCode.isEmpty || agentCode.length < 6) {
        CustomSnackBar.errorSnackBar(
            title: "Agent code must be 6 characters or more");
        return;
      }
    }

    loading = 1;
    update();

    UserData userData = UserData(
        firstname: firstName,
        lastname: lastName,
        phone: phone,
        pin: pin,
        code: agentCode,
        dob: "28-03-2001");

    if (!isAgent) {
      userData.type = "customer";
    } else {
      userData.type = "agent";
    }
    var result = await _authService.createAccount(userData: userData);

    if (result == -1) {
      CustomSnackBar.errorSnackBar(title: "Sign Up Failed. Please try again");
    } else if (result is Map<String, dynamic>) {
      Get.offAll(DashboardScreen(), arguments: result);
    } else {
      CustomSnackBar.errorSnackBar(title: result);
    }

    loading = 0;
    update();
  }

  void goToSignInScreen() {
    Get.to(SignInScreen());
  }

  void toggleUser(bool value) {
    isAgent = value;

    update();
  }
}
