

import 'package:TrStore/FeaturesModule/cart/controller/CartController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Dependenci Injection/injection.dart';
import '../FeaturesModule/home/Repository/home_repository.dart';
import '../FeaturesModule/home/controller/HomeController.dart';
import '../network/api_services.dart';




Future<Map<String, Map<String, String>>> init() async {

  var apiMethod=getIt<ApiMethod>();
  // var localDb=getIt<LocalDataGet>();
  // print("calll get x");
  // final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => sharedPreferences);
  // Get.lazyPut(() => ApiClient(appBaseUrl: BASE_URL));


  // Get.lazyPut(()=>LocalDataGet());
  // Get.lazyPut(()=>LocationService());
  // Get.lazyPut(()=>LocationNameService());
  // Get.lazyPut(() => ApiClient(appBaseUrl: BASE_URL));

  // Repository
  Get.lazyPut(() => HomeRepository(apiMethod: apiMethod));
  // Get.lazyPut(() => AuthRepository());
  // Get.lazyPut(() => ChefRepository());
  // Get.lazyPut(() => NotificationRepository());
  // Get.lazyPut(() => OrderRepository());


  // Controller

  Get.lazyPut(() => HomeController(homeRepository: Get.find<HomeRepository>()));
  Get.lazyPut(() => CartController());



  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();

  return _languages;
}