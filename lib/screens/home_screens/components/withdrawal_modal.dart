import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift_pay/screens/auth_screens/sign_in_screen.dart';
import 'package:thrift_pay/theme/colors.dart';
import 'package:thrift_pay/theme/texts.dart';
import 'package:thrift_pay/utils/margin.dart';
import 'package:thrift_pay/widgets/button_widgets.dart';
import 'package:thrift_pay/widgets/custom_snackbar.dart';

class WithdrawalModal extends StatelessWidget {
  const WithdrawalModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colors.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: screenHeight(context, percent: 0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YMargin(10),
          Row(
            children: [
              Text(
                "Withdraw",
                style: w600Style(
                  18,
                  const Color(0xff0C1141),
                ),
              ),
            ],
          ),
          const YMargin(20),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0xffE9EBFB),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Text(
                    "Wema bank",
                    style: w400Style(14, const Color(0xffA59E9E)),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xff595959),
                  ),
                ],
              )),
          const YMargin(20),
          authField(null, false, "0717872839", enabled: false),
          const YMargin(20),
          authField(null, false, "John Doe", enabled: false),
          const YMargin(30),
          SizedBox(
            height: 50,
            width: double.maxFinite,
            child: ElevatedButtonWidget(
              color: colors.primaryColor,
              labelColor: colors.whiteColor,
              label: "Withdraw",
              radius: 5,
              onP: () async {
                Get.back();

                await Future.delayed(Duration(milliseconds: 500));

                CustomSnackBar.successSnackBar(
                    title: "Your withdrawal will be processed shortly");
              },
            ),
          ),
        ],
      ),
    );
  }
}
