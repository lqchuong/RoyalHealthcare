import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/trash/data/api/api_client.dart';
import 'package:food_delivery/trash/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init()async {
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: "appBaseUrl"));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //contronller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}