import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/app/Constants/firebase_constants.dart';
import 'package:food_delivery/app/modules/register/models/register_model.dart';
import 'package:food_delivery/app/modules/user/models/user_model.dart';
import 'package:food_delivery/app/routes/app_pages.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController authInstance = Get.put(UserController());
  late CollectionReference collectionReferenceOrder;
  late CollectionReference collectionReferenceOrderDetail;

  @override
  void onInit() {
    super.onInit();
    collectionReferenceOrder = firebaseFirestore.collection("tbl_Order");
    collectionReferenceOrderDetail =
        firebaseFirestore.collection("tbl_Order_detail");
  }

  Stream<List<UserModel>> getAllCustomer() {
    return firebaseFirestore
        .collection('tbl_Customers')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => UserModel.fromSnapshot_user(doc))
          .toList();
    });
  }
}
