import 'package:food_delivery/app/utils/enums.dart';

class PhoneAthModel {
  PhoneAthModel(
    this.isComplete,
    this.isFail,
    this.currentState,
    this.verificationId,
  );

  bool? isComplete;
  bool? isFail;
  MobileVerificationState? currentState;
  String? verificationId;
}
