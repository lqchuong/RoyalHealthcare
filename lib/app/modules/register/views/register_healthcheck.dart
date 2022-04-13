import 'package:flutter/material.dart';
import 'package:food_delivery/app/utils/colors.dart';
import 'package:food_delivery/app/utils/dimensions.dart';
import 'package:food_delivery/app/widgets/calendar/app_calendar.dart';
import 'package:food_delivery/app/widgets/calendar/app_timepicker.dart';
import 'package:food_delivery/app/widgets/app_icon.dart';
import 'package:food_delivery/app/widgets/text/big_text.dart';
import 'package:food_delivery/app/widgets/dropdown/healthcare_check_dropdown.dart';
import 'package:food_delivery/app/widgets/dropdown/doctor_dropdown.dart';
import 'package:food_delivery/app/widgets/text/small_text.dart';

import '../../../widgets/dropdown/checkpackage_dropdown.dart';
import '../../../widgets/text/text_field.dart';

class RegisterHealthCheck extends StatefulWidget {
  const RegisterHealthCheck({Key? key}) : super(key: key);

  @override
  State<RegisterHealthCheck> createState() => _RegisterHealthCheckState();
}
enum SingingCharacter { personal, other }
enum Gender { male, female }
enum CheckType {plan, require}



class _RegisterHealthCheckState extends State<RegisterHealthCheck> {
  SingingCharacter? _character = SingingCharacter.personal;
  Gender? _gender = Gender.male;
  CheckType? _checktype = CheckType.plan;
  bool _visible = true;
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
                  SizedBox(width: 15,),
                  Image(image: AssetImage('assets/images/logoHealth.png'), width: Dimensions.width45,height: Dimensions.height45,),
                  SizedBox(width: Dimensions.width10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BigText(text: "Royal HealthCare", color: AppColors.mainColor,fontWeight: FontWeight.bold,),
                      Row(
                        children: [
                          SmallText(text: "Ho Chi Minh", color: Colors.black54,),
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
                  child:Container(

                      padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight:Radius.circular(Dimensions.radius20),
                            topLeft: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white
                      ),
                      child: Column(

                        children: [
                          BigText(text: "ĐĂNG KÝ ĐÁNH GIÁ",size: 20, fontWeight: FontWeight.w500,textAlignCenter: TextAlign.center),
                          SizedBox(height: 10,),

                          SizedBox(height: 30,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //cá nhân, người thân
                              SmallText(text: "Đăng ký cho", color: Colors.black,size: 16,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Radio(value: SingingCharacter.personal, groupValue: _character, onChanged: (SingingCharacter? value) {

                                        setState(() {
                                          _character = value;
                                          _visible = !_visible;
                                        });
                                      }),
                                      SmallText(text: 'Bản thân', color: Colors.black,size: 16,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(value: SingingCharacter.other, groupValue: _character, onChanged: (SingingCharacter? value) {
                                        // _toggle;
                                        setState(() {
                                          _character = value;
                                          _visible = !_visible;
                                        });
                                      }),
                                      SmallText(text: "Người thân", color: Colors.black,size: 16,),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: 16,),
                              AppTextField(text: "Họ và tên...",color: Colors.black54, icon: Icons.person),
                              SizedBox(height: 16,),
                              AppTextField(text: "Số điện thoại...",color: Colors.black54,icon: Icons.card_membership),
                              !_visible ? Container(
                                height: 220,
                                child: Column(
                                  children: [
                                    SizedBox(height: 16,),
                                    BigText(text: "THÔNG TIN NHÂN THÂN", fontWeight: FontWeight.w500,textAlignCenter: TextAlign.center),
                                    SizedBox(height: 16,),
                                    AppTextField(text: "Họ và tên...",color: Colors.black54, icon: Icons.person),
                                    SizedBox(height: 16,),
                                    AppTextField(text: "Số điện thoại...",color: Colors.black54,icon: Icons.card_membership),
                                  ],
                                ),
                              ) : Container(
                                height: 0,
                                child: Column(
                                  children: [
                                    SizedBox(height: 16,),
                                    BigText(text: "THÔNG TIN NHÂN THÂN", fontWeight: FontWeight.w500,textAlignCenter: TextAlign.center),
                                    SizedBox(height: 16,),
                                    AppTextField(text: "Họ và tên...",color: Colors.black54, icon: Icons.person),
                                    SizedBox(height: 16,),
                                    AppTextField(text: "Số điện thoại...",color: Colors.black54,icon: Icons.card_membership),
                                  ],
                                ),
                              ),






                              SizedBox(height: 24,),
                              SmallText(text: "Giới tính", color: Colors.black,size: 16,),
                              //giới tính
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Radio(value: Gender.male, groupValue: _gender, onChanged: (Gender? value) {
                                        setState(() {
                                          _gender = value;
                                        });
                                      }),
                                      SmallText(text: 'Nam', color: Colors.black,size: 16,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(value: Gender.female, groupValue: _gender, onChanged: (Gender? value) {
                                        setState(() {
                                          _gender = value;
                                        });
                                      }),
                                      SmallText(text: "Nữ", color: Colors.black,size: 16,),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 16,),
                              AppTextField(text: "Ngày sinh (01/01/1990)...",color: Colors.black54,icon: Icons.location_on),

                              SizedBox(height: 16,),
                              AppTextField(text: "Địa chỉ...",color: Colors.black54,icon: Icons.phone),

                              SizedBox(height: 16,),
                              AppTextField(text: "Email...",color: Colors.black54,icon: Icons.card_membership),

                              SizedBox(height: 16,),
                              CheckPackageDropdown(),

                              SizedBox(height: 16,),
                              AppDatePicker(),

                              SizedBox(height: 16,),
                              AppTimePicker(),

                              SizedBox(height: 16,),
                              AppTextField(text: "Ghi chú",color: Colors.black54,icon: Icons.note),

                              SizedBox(height: 16,),
                              Container(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.of(context).pushNamed('/main');
                                    // Respond to button press
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(200, 42),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(Dimensions.width20)),

                                      primary: AppColors.mainColor,
                                      // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                      textStyle:
                                      const TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                                  child: Text("Đăng ký"),
                                  // icon: Icon(Icons.arrow_forward_ios, size: 18),
                                ),
                              )

                            ],
                          ),

                        ],
                      )
                  )
              ),
            ),
          )
        ],
      ),

    );
  }
}

