import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/app/utils/enums.dart';

class PhoneAthModel {
  final String phone;
  PhoneAthModel({
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
    };
  }

  PhoneAthModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> phoneModel)
      : phone = phoneModel.data()!["phone"];
}
