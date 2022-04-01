import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/app/modules/home/models/customer_model.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Firestore operation
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<CustomerModel> customers = RxList<CustomerModel>([]);

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection("tbl_Customers");
    customers.bindStream(getAllCustomer());
  }

  Stream<List<CustomerModel>> getAllCustomer() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => CustomerModel.fromMap(item)).toList());
}
