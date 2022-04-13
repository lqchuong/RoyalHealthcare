import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/register/controller/register_controllers.dart';
import 'package:food_delivery/app/modules/register/models/register_model.dart';
import 'package:food_delivery/app/utils/colors.dart';
import 'package:food_delivery/app/utils/dimensions.dart';
import 'package:food_delivery/app/widgets/calendar/app_calendar.dart';
import 'package:food_delivery/app/widgets/calendar/app_timepicker.dart';
import 'package:food_delivery/app/widgets/app_icon.dart';
import 'package:food_delivery/app/widgets/text/big_text.dart';
import 'package:food_delivery/app/widgets/healthcare_check_dropdown.dart';
import 'package:food_delivery/app/widgets/doctor_dropdown.dart';
import 'package:food_delivery/app/widgets/text/small_text.dart';

import '../../../widgets/text/text_field.dart';

class RegisterPersion extends StatefulWidget {
  const RegisterPersion({Key? key}) : super(key: key);

  @override
  State<RegisterPersion> createState() => _RegisterPersionState();
}

enum SingingCharacter { personal, other }
enum Gender { male, female }
enum CheckType { plan, require }

class _RegisterPersionState extends State<RegisterPersion> {
  SingingCharacter? _RegisterFor = SingingCharacter.personal;
  Gender? _gender = Gender.male;
  CheckType? _checktype = CheckType.plan;
  bool _visible = true;

  late RegisterModel registerModel;

  final txtCusName = TextEditingController();
  final txtReName = TextEditingController();
  final txtPhoneNumber = TextEditingController();
  final txtRePhoneNumber = TextEditingController();
  final ckGender = TextEditingController();
  final txtDateOfBirth = TextEditingController();
  final txtAddress = TextEditingController();
  final txtMail = TextEditingController();
  String? txtHealthPackage = "";
  String? txtDoctor = "";
  final ckCheckingType = TextEditingController();
  final txtDateChecking = TextEditingController();
  final txtTimeChecking = TextEditingController();
  final txtNote = TextEditingController();

  void _toggle() {
    setState(() {
      // _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Image(
                    image: AssetImage('assets/images/logoHealth.png'),
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Royal HealthCare",
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Ho Chi Minh",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.topContrainWithTopBar,
            child: SingleChildScrollView(
              child: Container(
                  height: 1800,
                  child: Container(
                      padding: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          top: Dimensions.height30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            topLeft: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white),
                      child: Column(
                        children: [
                          BigText(
                              text: "PHIẾU ĐĂNG KÝ",
                              fontWeight: FontWeight.w500,
                              textAlignCenter: TextAlign.center),
                          SizedBox(
                            height: 10,
                          ),
                          SmallText(
                            text: "Đăng ký khám chữa bệnh cho cá nhân",
                            color: Colors.black38,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Register for personal/other
                              SmallText(
                                text: "Đăng ký cho",
                                color: Colors.black,
                                size: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                          value: SingingCharacter.personal,
                                          groupValue: _RegisterFor,
                                          onChanged: (SingingCharacter? value) {
                                            setState(() {
                                              _RegisterFor = value;
                                              _visible = !_visible;
                                            });
                                          }),
                                      SmallText(
                                        text: 'Bản thân',
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: SingingCharacter.other,
                                          groupValue: _RegisterFor,
                                          onChanged: (SingingCharacter? value) {
                                            // _toggle;
                                            setState(() {
                                              _RegisterFor = value;
                                              _visible = !_visible;
                                            });
                                          }),
                                      SmallText(
                                        text: "Người thân",
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),

                              // Full name
                              AppTextField(
                                  text: "Họ và tên...",
                                  color: Colors.black54,
                                  icon: Icons.person,
                                  editcontroller: txtCusName),
                              SizedBox(
                                height: 16,
                              ),

                              // Phone number
                              AppTextField(
                                  text: "Số điện thoại...",
                                  color: Colors.black54,
                                  icon: Icons.card_membership,
                                  editcontroller: txtPhoneNumber),

                              // check visible personal or other
                              !_visible
                                  ? Container(
                                      height: 220,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          BigText(
                                              text: "THÔNG TIN NHÂN THÂN",
                                              fontWeight: FontWeight.w500,
                                              textAlignCenter:
                                                  TextAlign.center),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          AppTextField(
                                              text: "Họ và tên...",
                                              color: Colors.black54,
                                              icon: Icons.person,
                                              editcontroller: txtReName),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          AppTextField(
                                              text: "Số điện thoại...",
                                              color: Colors.black54,
                                              icon: Icons.card_membership,
                                              editcontroller: txtRePhoneNumber),
                                        ],
                                      ),
                                    )
                                  : Container(height: 0),
                              SizedBox(
                                height: 24,
                              ),

                              // Gender
                              SmallText(
                                text: "Giới tính",
                                color: Colors.black,
                                size: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                          value: Gender.male,
                                          groupValue: _gender,
                                          onChanged: (Gender? value) {
                                            setState(() {
                                              _gender = value;
                                            });
                                          }),
                                      SmallText(
                                        text: 'Nam',
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: Gender.female,
                                          groupValue: _gender,
                                          onChanged: (Gender? value) {
                                            setState(() {
                                              _gender = value;
                                            });
                                          }),
                                      SmallText(
                                        text: "Nữ",
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),

                              // Date of birth
                              AppTextField(
                                  text: "Ngày sinh (01/01/1990)...",
                                  color: Colors.black54,
                                  icon: Icons.location_on,
                                  editcontroller: txtDateOfBirth),
                              SizedBox(
                                height: 16,
                              ),

                              // Address
                              AppTextField(
                                text: "Địa chỉ...",
                                color: Colors.black54,
                                icon: Icons.phone,
                                editcontroller: txtAddress,
                              ),
                              SizedBox(
                                height: 16,
                              ),

                              // Email
                              AppTextField(
                                text: "Email...",
                                color: Colors.black54,
                                icon: Icons.card_membership,
                                editcontroller: txtMail,
                              ),
                              SizedBox(
                                height: 16,
                              ),

                              // Health package dropdown
                              HealthCheckPackageDropdown(
                                selectedValue: (newVal) {
                                  txtHealthPackage = newVal;
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),

                              // Doctors dropdown
                              DoctorDropdown(
                                selectedValue: (newVal) {
                                  txtDoctor = newVal;
                                },
                              ),
                              SizedBox(
                                height: 24,
                              ),

                              // Type checking
                              SmallText(
                                text: "Chọn loại khám",
                                color: Colors.black,
                                size: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                          value: CheckType.plan,
                                          groupValue: _checktype,
                                          onChanged: (CheckType? value) {
                                            setState(() {
                                              _checktype = value;
                                            });
                                          }),
                                      SmallText(
                                        text: 'Theo lịch',
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: CheckType.require,
                                          groupValue: _checktype,
                                          onChanged: (CheckType? value) {
                                            setState(() {
                                              _checktype = value;
                                            });
                                          }),
                                      SmallText(
                                        text: "Theo yêu cầu",
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),

                              // Date checking
                              AppDatePicker(),
                              SizedBox(
                                height: 16,
                              ),

                              // Time checking
                              AppTimePicker(),
                              SizedBox(
                                height: 16,
                              ),

                              // Note
                              AppTextField(
                                text: "Ghi chú",
                                color: Colors.black54,
                                icon: Icons.note,
                                editcontroller: txtNote,
                              ),
                              SizedBox(
                                height: 16,
                              ),

                              // button register
                              Container(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () {
                                    registerModel = RegisterModel(
                                        CusName: txtCusName.text,
                                        ReName: txtReName.text,
                                        CusPhoneNumber: txtPhoneNumber.text,
                                        RePhoneNumberOther:
                                            txtRePhoneNumber.text,
                                        Gender: _gender.toString(),
                                        DateOfBirth: txtDateOfBirth.text,
                                        Address: txtAddress.text,
                                        Mail: txtMail.text,
                                        HealthPackage: txtHealthPackage!,
                                        Doctor: txtDoctor!,
                                        CheckingType: _checktype.toString(),
                                        DateChecking: "",
                                        TimeChecking: "",
                                        Note: txtNote.text);

                                    RegisterController.authInstance
                                        .InsertDataOrder(registerModel);
                                    // Navigator.of(context).pushNamed('/main');
                                    // Respond to button press
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(200, 42),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.width20)),
                                      primary: AppColors.mainColor,
                                      // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300)),
                                  child: Text("Đăng ký"),
                                  // icon: Icon(Icons.arrow_forward_ios, size: 18),
                                ),
                              )
                            ],
                          ),
                        ],
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
