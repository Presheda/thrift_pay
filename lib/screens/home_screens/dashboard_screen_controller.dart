import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:thrift_pay/datanodel/user_data.dart';
import 'package:thrift_pay/widgets/custom_snackbar.dart';
import 'package:thrift_pay/widgets/fundwallet.dart';

import 'kyc_screen.dart';

class DashboardScreenController extends GetxController {
  UserData userData;
  AccountDetails accountDetails;

  @override
  void onInit() {
    userData = UserData.fromMap(Get.arguments['user']);
    accountDetails = AccountDetails.fromMap(Get.arguments['account']);

    super.onInit();
  }

  void goToKYCScreen() {
    Get.to(KYCScreen());
  }

  void openFundWalletSheet() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 60),
        child: BankAccountSheetWidget(
          function: () async {
            Get.back();
            await Future.delayed(Duration(milliseconds: 250));

            Clipboard.setData(ClipboardData(text: accountDetails.vnuban));

            CustomSnackBar.successSnackBar(title: "Account Copied!!");
          },
          virtualAcc: accountDetails.vnuban,
          bankType: accountDetails.bankNname,
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
    );
  }
}
