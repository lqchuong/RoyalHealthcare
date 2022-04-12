import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel {
  final String address;
  final String birthDay;
  final String email;
  final String gender;
  final String name;
  final String phone;

  const CustomerModel(
      {required this.address,
      required this.birthDay,
      required this.email,
      required this.gender,
      required this.name,
      required this.phone});

  static CustomerModel fromSnapshot(DocumentSnapshot snap) {
    CustomerModel cus = CustomerModel(
        address: snap['address'],
        birthDay: snap['birthDay'],
        email: snap['email'],
        gender: snap['gender'],
        name: snap['name'],
        phone: snap['phone']);
    return cus;
  }

  // static const List<CustomerModel> customers = [
  //   CustomerModel(
  //       address: "HCM",
  //       birthDay: "25/09/1995",
  //       email: "lqbao.edu@gmail.com",
  //       gender: "Male",
  //       name: "Bao",
  //       phone: "0949475161"),
  //   CustomerModel(
  //       address: "HCM",
  //       birthDay: "25/09/1995",
  //       email: "mai.edu@gmail.com",
  //       gender: "FeMale",
  //       name: "Mai",
  //       phone: "0969193621")
  // ];
}
