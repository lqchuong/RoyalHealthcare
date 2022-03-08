import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../controller/popular_product_controller.dart';

Future<void> init()async {
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: "appBaseUrl"));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //contronller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}