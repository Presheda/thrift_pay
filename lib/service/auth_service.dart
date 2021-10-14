import 'dart:ffi';

import 'package:get/get.dart';
import 'package:thrift_pay/datanodel/user_data.dart';

abstract class AuthService extends GetConnect {
  Future<dynamic> createAccount({UserData userData, String userType});

  Future<dynamic> login({String phone, String pin});
}

class AuthServiceFake extends AuthService {
  @override
  Future createAccount({UserData userData, String userType}) async {
    await Future.delayed(Duration(milliseconds: 5000));

    return -1;
  }

  @override
  Future login({String phone, String pin}) async {
    await Future.delayed(Duration(milliseconds: 5000));

    return -1;
  }
}

class AuthServiceReal extends AuthService {
  @override
  void onInit() {
    httpClient.addAuthenticator((request) async {
      request.headers['Authorization'] = "";
      return request;
    });

    httpClient.maxAuthRetries = 3;
  }

  Future<dynamic> createAccount({UserData userData, String userType}) async {
    String type = userType ?? "customer";

    String _loginUrl = "http://165.22.76.175/api/v1/auth/register";
    var data;
    userData.type = type;

    try {
      var res = await post(_loginUrl, userData.toMap());

      var status = res.body['status'];

      var success = res.body['success'];

      if (success != null && !success) {
        return "missing phone or pin";
      }

      if (status == null || !status) {
        return -1;
      }

      var type = res.body['data']['user']['type'];

      if (type == "agent") {
        UserData userData = UserData.fromMap(res.body['data']['user']['agent']);
        userData.type = "agent";

        AccountDetails accountDetails =
            AccountDetails.fromMap(res.body['data']['account_details']);




        return {"user": userData.toMap(), "account": accountDetails.toMap()};
      } else {
        UserData userData =
            UserData.fromMap(res.body['data']['user']['customer']);
        userData.type = "customer";
        AccountDetails accountDetails =
            AccountDetails.fromMap(res.body['data']['account_details']);

        return {"user": userData.toMap(), "account": accountDetails.toMap()};
      }
    } catch (res) {
      print(res);

      return -1;
    }
  }

  Future<dynamic> login({String phone, String pin}) async {
    String _loginUrl = "http://165.22.76.175/api/v1/auth/login";

    var data;

    try {
      var res = await post(_loginUrl, {"phone": phone, "pin": pin});

      var status = res.body['status'];

      var success = res.body['success'];

      if (success != null && !success) {
        return "missing phone or pin";
      }

      if (status == null || !status) {
        return -1;
      }

      var type = res.body['data']['user']['type'];

      if (type == "agent") {
        UserData userData = UserData.fromMap(res.body['data']['user']['agent']);
        userData.type = "agent";

        AccountDetails accountDetails =
        AccountDetails.fromMap(res.body['data']['account_details']);

        return {"user": userData.toMap(), "account": accountDetails.toMap()};
      } else {
        UserData userData =
            UserData.fromMap(res.body['data']['user']['customer']);
        userData.type = "customer";

        AccountDetails accountDetails =
            AccountDetails.fromMap(res.body['data']['account_details']);

        return {"user": userData.toMap(), "account": accountDetails.toMap()};
      }
    } catch (res) {
      print(res);

      return -1;
    }
  }
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

dynamic errorHandler(Response response) {
  print(response.body);
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
      var responseJson = response.body;
      return responseJson;
    case 500:
      throw "Server Error pls retry later";
    case 403:
      throw 'Error occurred pls check internet and retry.';
    case 500:
    default:
      throw 'Error occurred retry';
  }
}
