import 'package:food_delivery/app/modules/home/controller/main_hopital_controler.dart';
import 'package:get/get.dart';

class MainHopitalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainHopitalController>(
          () => MainHopitalController(),
    );
  }
}
