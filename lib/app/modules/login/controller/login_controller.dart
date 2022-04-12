import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/app/Constants/firebase_constants.dart';
import 'package:food_delivery/app/modules/home/views/main_page.dart';
import 'package:food_delivery/app/modules/login/views/login_page.dart';
import 'package:food_delivery/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController authInstance = Get.put(LoginController());
  late Rx<User?> firebaseUser;
  late CollectionReference collectionReferenceCus;
  late CollectionReference collectionReferenceUser;

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    collectionReferenceCus = firebaseFirestore.collection("tbl_Customers");
    collectionReferenceUser = firebaseFirestore.collection("tbl_Users");
  }

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    // FirebaseFirestore.instance.clearPersistence();
    if (user != null) {
      // user is logged in
      Get.offAll(() => const MainPage());
    } else {
      // user is null as in user is not available or not logged in
      Get.offAll(() => LoginPage());
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      // Get.snackbar("Error", e.message!);
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      print(e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> verifyNumber(String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (phoneAuthCredential) {},
          codeSent: (verificationId, forceResendingToken) {
            Get.toNamed(Routes.OTP,
                arguments: {"verificationId": verificationId});
          },
          verificationFailed: (verificationFailed) {
            Get.snackbar(
              "Error",
              verificationFailed.message!,
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      // Get.snackbar("Error", e.message!);
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      print(e.toString());
    }
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        Get.toNamed(Routes.MAIN);
      }
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      // Get.snackbar("Error", e.message!);
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      print(e.toString());
    }
  }

  void signOut() {
    try {
      FirebaseFirestore.instance.clearPersistence();
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  //TODO: Chưa xong
  bool CheckExistPhoneNumber(String phoneNumber) {
    bool isSuccess = false;
    var collection = collectionReferenceCus
        .where("phone", isEqualTo: phoneNumber)
        .snapshots();

    return isSuccess;
  }

  void InsertDataCus(String phoneNumber) {
    final currentDateTime = DateTime.now();
    bool isPhoneExist = false;

    isPhoneExist = CheckExistPhoneNumber(phoneNumber);

    if (!isPhoneExist) {
      collectionReferenceCus
          .add({
            'address': '',
            'birthDay': '',
            'code': '',
            'created_at': currentDateTime,
            'created_by': phoneNumber,
            'email': '',
            'gender': '',
            'image_avatar': '',
            'name': '',
            'phone': phoneNumber,
            'updated_at': '',
            'updated_by': ''
          })
          .catchError((error) {
            Get.snackbar(
              "Error",
              "Something went wrong",
              snackPosition: SnackPosition.BOTTOM,
            );
          })
          .then((cus) => collectionReferenceUser.add({
                'code': '',
                'created_at': currentDateTime,
                'created_by': phoneNumber,
                'customer_id': cus.id,
                'password': '',
                'phone': phoneNumber,
                'status_id': '',
                'updated_at': '',
                'updated_by': '',
                'username': ''
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
}
