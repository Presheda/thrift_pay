import 'dart:ffi';

import 'package:get/get.dart';
import 'package:thrift_pay/datanodel/user_data.dart';

class AuthService extends GetConnect {
  @override
  void onInit() {
    // Even if the server sends data from the country "Brazil",
    // it will never be displayed to users, because you remove
    // that data from the response, even before the response is delivered
    // httpClient.addResponseModifier<CasesModel>((request, response) {
    //   CasesModel model = response.body;
    //   if (model.countries.contains('Brazil')) {
    //     model.countries.remove('Brazilll');
    //   }
    //
    //   return model;
    // });

    httpClient.addAuthenticator((request) async {
      request.headers['Authorization'] = "";

      return request;

      // final response = await get("http://yourapi/token");
      // final token = response.body['token'];
      // // Set the header
      // request.headers['Authorization'] = "$token";
      // return request;
    });

    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.maxAuthRetries = 3;
  }

  Future<dynamic> createAccount({UserData userData, String userType}) {
    String type = userType ?? "customer";
  }

  Future<dynamic> login({UserData userData}) {}
}

class AuthModel {
  UserData userData;
  String status;

  AuthModel({this.userData, this.status});

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return new AuthModel(
      userData:
          map['userData'] == null ? null : UserData.fromMap(map['userData']),
      status: map['status'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'userData': this.userData.toMap(),
      'status': this.status,
    } as Map<String, dynamic>;
  }
}
