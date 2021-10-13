import 'package:get/get.dart';

class BaseService extends GetConnect {
  @override
  void onInit() {
    // All request will pass to jsonEncode so CasesModel.fromJson()
   // httpClient.defaultDecoder = CasesModel.fromJson;
    httpClient.baseUrl = 'https://api.covid19api.com';

    // baseUrl = 'https://api.covid19api.com'; // It define baseUrl to
    // Http and websockets if used with no [httpClient] instance

    // It's will attach 'apikey' property on header from all requests
    httpClient.addRequestModifier((request) {
      request.headers['apikey'] = '12345678';

      return request;
    });

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
}
