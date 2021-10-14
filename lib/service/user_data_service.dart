import 'package:get/get.dart';
import 'package:thrift_pay/datanodel/user_data.dart';

class UserDataService  extends GetConnect{
  Future<void> saveUserData({UserData userData}) async {
    print("Calls startedOInnerLevel");
    String url =  "https://api.ravepay.co/flwv3-pug/getpaidx/api/v2/verify";
    var data = await post(url,  {
      "txref" : "crazy_stuff",
      "SECKEY" :"FLWSECK-ad381a48e872c5b215d5352e4e707ea6-X"
    });

    print(data.body);

  }
  Future<void> fetchUserData() {}

  @override
  void onInit() {

    super.onInit();
  }
}
