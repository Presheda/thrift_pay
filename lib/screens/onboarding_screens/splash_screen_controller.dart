import 'package:get/get.dart';
import 'package:thrift_pay/screens/auth_screens/sign_in_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    goToSignUp();
    super.onInit();
  }

  void goToSignUp() async {
    await Future.delayed(Duration(seconds: 3));

    Get.off(SignInScreen());
  }
}
