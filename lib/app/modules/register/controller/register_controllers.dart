import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/app/Constants/firebase_constants.dart';
import 'package:food_delivery/app/modules/register/models/register_model.dart';
import 'package:food_delivery/app/routes/app_pages.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController authInstance = Get.put(RegisterController());
  late CollectionReference collectionReferenceOrder;
  late CollectionReference collectionReferenceOrderDetail;

  @override
  void onInit() {
    super.onInit();
    collectionReferenceOrder = firebaseFirestore.collection("tbl_Order");
    collectionReferenceOrderDetail =
        firebaseFirestore.collection("tbl_Order_detail");
  }

  void InsertDataOrder(RegisterModel registerModel) {
    collectionReferenceOrder
        .add({
          'code': registerModel.Address,
          'created_at': DateTime.now(),
          'created_id': '',
          'order_date': '',
          'status_id': '',
          'updated_at': '',
          'updated_id': '',
          'user_id': ''
        })
        .catchError((error) {
          Get.snackbar(
            "Error",
            "Something went wrong",
            snackPosition: SnackPosition.BOTTOM,
          );
        })
        .then((cus) => collectionReferenceOrderDetail.add({
              'checkDay': '',
              'checkHour': '',
              'code': '',
              'created_at': '',
              'created_by': '',
              'doctors': '',
              'image': '',
              'isFamily': '',
              'note': '',
              'order_id': '',
              'reciever_id': '',
              'service': '',
              'service_detail': '',
              'service_detail_select': '',
              'special': '',
              'updated_at': '',
              'updated_by': ''
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
