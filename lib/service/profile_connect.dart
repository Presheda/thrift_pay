import 'package:get/get.dart';
import 'package:thrift_pay/datanodel/user_data.dart';

class ProfileConnect extends GetConnect{

  Future<UserData> getUserData()async{


    var data = await get("");


  }

}