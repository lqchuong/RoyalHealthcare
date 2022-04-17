import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/app/Constants/firebase_constants.dart';
import 'package:food_delivery/app/modules/register/models/register_model.dart';
import 'package:food_delivery/app/modules/register/views/register_healthcheck.dart';
import 'package:food_delivery/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../models/register_healthcheck_model.dart';

class RegisterHealthCheckController extends GetxController {
  static RegisterHealthCheckController authInstance = Get.put(RegisterHealthCheckController());
  late CollectionReference collectionReferenceOrder;
  late CollectionReference collectionReferenceOrderDetail;

  @override
  void onInit() {
    super.onInit();
    collectionReferenceOrder = firebaseFirestore.collection("tbl_Order");
    collectionReferenceOrderDetail =
        firebaseFirestore.collection("tbl_Order_detail");
  }

  void InsertDataOrder(RegisterHealthCheckModel order, RegisterHealthCheckDetailModel detail) {
    collectionReferenceOrder
        .add({
      'code': order.code,
      'created_at': order.created_at,
      'created_id': 'FzxR12Qy8U9tukSFYZRq',
      'order_date': order.order_date,
      'status_id': '0',
      'updated_at': '',
      'updated_id': '',
      'user_id': 'FzxR12Qy8U9tukSFYZRq'
    })
        .catchError((error) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
      );
    })
        .then((cus) => collectionReferenceOrderDetail.add({
    'code': detail.code,
    'created_at': detail.created_at,
    'created_by': detail.created_by,
    'exams_service_id': detail.exams_service_id,
    'note':detail.note,
    'order_id':detail.order_id,
    'reciever_id':'FzxR12Qy8U9tukSFYZRq',
    'updated_at': detail.updated_at,
    'updated_by':detail.updated_by
    }).catchError((error) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
      );
    }))
        .whenComplete(() {
      Get.toNamed(Routes.MAIN);
      Get.snackbar(
        "Data Added",
        "Data added successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }
}
