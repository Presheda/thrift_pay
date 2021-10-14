

import 'package:get_it/get_it.dart';
import 'package:thrift_pay/service/auth_service.dart';

var locator = GetIt.instance;




void setupServices() {
  // locator.registerSingleton<DrinkService>( DrinkServiceImpl());


  locator.registerFactory<AuthService>(() => AuthServiceReal());




}

void setupFakeServices() {


  locator.registerFactory<AuthService>(() => AuthServiceFake());

}
