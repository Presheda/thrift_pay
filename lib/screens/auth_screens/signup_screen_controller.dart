import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'additional_info.dart';
import 'sign_in_screen.dart';

class SignUpScreenController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController bvnController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void goToAdditionalInfoScreen() {
    Get.to(AdditionalInfoScreen());
  }

  void goToSignInScreen() {
    Get.to(SignInScreen());
  }
}
