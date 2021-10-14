import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static errorSnackBar({String title, String message}) {
    Get.snackbar(null, null,
        backgroundColor:  Color(0xffFF4D42),
        messageText: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        padding: EdgeInsets.only(bottom: 25, top: 25));
  }

  static topSuccessSnackBar({String title}) {
    if (Get.isSnackbarOpen) return;

    Get.snackbar(null, null,
        backgroundColor: Get.theme.primaryColor,
        messageText: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        padding: EdgeInsets.only(bottom: 25, top: 25));
  }

  static successSnackBar({String title, String message}) {
    if (Get.isSnackbarOpen) return;

    Get.snackbar(
      null,
      null,
      backgroundColor: Get.theme.primaryColor,
      messageText: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      padding: EdgeInsets.only(bottom: 25, top: 25),
    );
  }
}
