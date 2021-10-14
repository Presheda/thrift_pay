import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift_pay/screens/auth_screens/additional_info.dart';
import 'package:thrift_pay/screens/auth_screens/sign_in_screen.dart';
import 'package:thrift_pay/theme/colors.dart';
import 'package:thrift_pay/theme/texts.dart';
import 'package:thrift_pay/utils/margin.dart';
import 'package:thrift_pay/utils/navigators.dart';
import 'package:thrift_pay/widgets/button_widgets.dart';

import 'signup_screen_controller.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpScreenController>(
        init: SignUpScreenController(),
        builder: (model) {
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
                      "Create an account",
                      style: w700Style(
                        35,
                        const Color(0xff0C1141),
                      ),
                    ),
                    const YMargin(10),
                    Text(
                      "We are glad, you found yourself here,\ncreate an account today.",
                      textAlign: TextAlign.start,
                      style: w500Style(18, const Color(0xff595959)),
                    ),
                    const YMargin(40),
                    authField(model.firstNameController, false, "First name",

                    ),
                    const YMargin(20),
                    authField(model.lastNameController, false, "Last name"),
                    const YMargin(20),
                    authField(model.numberController, false, "Phone", keyboardType: TextInputType.number,
                    maxLenght: 11
                    ),
                    const YMargin(20),
                    authField(model.pinController, false, "enter a unique pin",
                      keyboardType: TextInputType.number,
                      maxLenght: 6,
                    ),

                   !model.isAgent ? Column(
                      children: [
                        const YMargin(20),
                        authField(model.agentController, false, "enter agent code",
                          keyboardType: TextInputType.number,
                          maxLenght: 6,
                        ),

                      ],
                    ) : XMargin(10),

                    const YMargin(30),

                    SwitchListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: model.isAgent, onChanged: model.toggleUser, title: Text("I'm an agent"),),

                    const YMargin(40),
                    SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButtonWidget(
                        color: colors.primaryColor,
                        labelColor: colors.whiteColor,
                        label: "Proceed",
                        loading: model.loading,
                        radius: 5,
                        onP: () {
                          model.goToAdditionalInfoScreen();
                        },
                      ),
                    ),
                    const YMargin(10),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          model.goToSignInScreen();
                        },
                        child: Text.rich(TextSpan(
                            text: "Already have an account? ",
                            style: w400Style(14, const Color(0xffA59E9E)),
                            children: [
                              TextSpan(
                                text: "Sign In ",
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
