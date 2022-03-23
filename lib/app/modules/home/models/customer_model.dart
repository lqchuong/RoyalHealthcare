import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel {
  String? address;
  String? birthDay;
  int? customer_id;
  String? email;
  String? gender;
  String? name;
  String? phone;

  CustomerModel({this.address
    , this.birthDay
    , this.customer_id
    , this.email
    , this.gender
    , this.name
    , this.phone});

  CustomerModel.fromMap(DocumentSnapshot data) {
    birthDay = data["birthDay"];
    customer_id = data["customer_id"];
    email = data["email"];
    gender = data["gender"];
    name = data["name"];
    phone = data["phone"];
  }
}
