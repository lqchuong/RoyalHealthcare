import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/app/Constants/firebase_constants.dart';
import 'package:food_delivery/app/modules/home/models/customer_model.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final customers = <CustomerModel>[]
      .obs; // observe the value of this varrible from another screen

  @override
  void onInit() {
    customers.bindStream(FireStoredDB().getAllCustomer());
    super.onInit();
  }


  // void addCustomer(CustomerModel cus) {
  //   if (_customers.containsKey(cus)) {
  //     _customers[cus] += 1;
  //   } else {
  //     _customers[cus] = 1;
  //   }

  //   Get.snackbar("Data added!", "You have added the ${cus.name} to list!",
  //       snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
  // }
}
