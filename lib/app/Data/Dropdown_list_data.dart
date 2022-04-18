
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/app/Constants/firebase_constants.dart';
import 'package:food_delivery/app/modules/home/models/customer_model.dart';
import 'package:get/get.dart';

class ListUserModel {
  final String userId;
  final String name;

  const ListUserModel({required this.userId,
    required this.name,
  });
}


class DropdownListData extends GetxController {
  static DropdownListData authInstance = Get.put(DropdownListData());
  late CollectionReference collectionReferenceUsers;

  @override
  void onInit() {
    super.onInit();
    collectionReferenceUsers = firebaseFirestore.collection("tbl_Users");
  }

  List<ListUserModel> listUser = [];

  List<ListUserModel> getlistuser(  ) {
    collectionReferenceUsers
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {

        var data = ListUserModel(userId: doc["customer_id"], name:doc.reference.id);
        listUser.add(data);
      });
    });
    return listUser;
  }


}