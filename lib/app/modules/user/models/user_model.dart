import 'package:cloud_firestore/cloud_firestore.dart';

class DetailUserModel {
  final String CusName;
  final String ReName;
  final String CusPhoneNumber;
  final String RePhoneNumberOther;
  final String Gender;
  final String DateOfBirth;
  final String Address;
  final String Mail;
  final String HealthPackage;
  final String Doctor;
  final String CheckingType;
  final String DateChecking;
  final String TimeChecking;
  final String Note;

  const DetailUserModel(
      {required this.CusName,
      required this.ReName,
      required this.CusPhoneNumber,
      required this.RePhoneNumberOther,
      required this.Gender,
      required this.DateOfBirth,
      required this.Address,
      required this.Mail,
      required this.HealthPackage,
      required this.Doctor,
      required this.CheckingType,
      required this.DateChecking,
      required this.TimeChecking,
      required this.Note});
}

class UserModel {
  final String CusName;
  final String ReName;
  final String CheckingType;
  final String DateChecking;
  UserModel(
      {required this.CusName,
      required this.ReName,
      required this.CheckingType,
      required this.DateChecking});

  static UserModel fromSnapshot_user(DocumentSnapshot snap) {
    UserModel cus = UserModel(
        CusName: snap['CusName'],
        ReName: snap['ReName'],
        DateChecking: snap['DateChecking'],
        CheckingType: snap['CheckingType']);
    return cus;
  }
}
