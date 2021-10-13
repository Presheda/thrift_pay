import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift_pay/screens/auth_screens/sign_up_screen.dart';
import 'package:thrift_pay/screens/home_screens/dashboard_screen.dart';
import 'package:thrift_pay/theme/colors.dart';
import 'package:thrift_pay/theme/texts.dart';
import 'package:thrift_pay/utils/margin.dart';
import 'package:thrift_pay/utils/navigators.dart';
import 'package:thrift_pay/widgets/button_widgets.dart';

import 'signin_screen_controller.dart';



class SignInScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SignInScreenController>(
        init: SignInScreenController(),
        builder: (model){
      return Scaffold(
        backgroundColor: colors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const YMargin(50),
                Text(
                  "Sign into thriftPay",
                  style: w700Style(
                    35,
                    const Color(0xff0C1141),
                  ),
                ),
                const YMargin(10),
                Text(
                  "Welcome to thriftpay, we are glad to \nhave you",
                  textAlign: TextAlign.start,
                  style: w500Style(18, const Color(0xff595959)),
                ),
                const YMargin(50),
                authField(model.numberController, false, "Enter your number"),
                const YMargin(20),
                authField(model.passwordController, true, "Enter your pin"),
                // const YMargin(5),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: TextButton(
                //     onPressed: () {},
                //     child: Text.rich(TextSpan(
                //         text: "Forgot password? ",
                //         style: w400Style(14, const Color(0xffA59E9E)),
                //         children: [
                //           TextSpan(
                //             text: "Recover ",
                //             style: w600Style(14, colors.primaryColor),
                //           ),
                //         ])),
                //   ),
                // ),
                const YMargin(70),
                SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButtonWidget(
                    color: colors.primaryColor,
                    labelColor: colors.whiteColor,
                    label: "Continue to ThriftPay",
                    radius: 5,
                    onP: () {
                      model.signInClicked();
                    },
                  ),
                ),
                const YMargin(10),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      model.goRegisterScreen();
                    },
                    child: Text.rich(TextSpan(
                        text: "Don’t have an account? ",
                        style: w400Style(14, const Color(0xffA59E9E)),
                        children: [
                          TextSpan(
                            text: "Sign up ",
                            style: w600Style(14, colors.primaryColor),
                          ),
                        ])),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

Widget authField(TextEditingController controller, bool isPassword, String hint, {Widget prefix}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: prefix,
        fillColor: const Color(0xffF2F2F2),
        filled: true,
        hintText: hint,
        hintStyle: w400Style(14, const Color(0xffA59E9E)),
        border: InputBorder.none,
      ),
    ),
  );
}
