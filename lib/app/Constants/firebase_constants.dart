import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/app/modules/home/models/customer_model.dart';
import 'package:get/get.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class FireStoredDB extends GetxController {
  Stream<List<CustomerModel>> getAllCustomer() {
    return firebaseFirestore
        .collection('tbl_Customers')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => CustomerModel.fromSnapshot(doc))
          .toList();
    });
  }
}
