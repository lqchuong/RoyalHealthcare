import 'package:flutter/material.dart';
import 'package:food_delivery/app/utils/colors.dart';
import 'package:food_delivery/app/utils/dimensions.dart';
import 'package:food_delivery/app/widgets/app_calendar.dart';
import 'package:food_delivery/app/widgets/app_icon.dart';
import 'package:food_delivery/app/widgets/big_text.dart';
import 'package:food_delivery/app/widgets/dropdown_button.dart';
import 'package:food_delivery/app/widgets/small_text.dart';
import 'package:food_delivery/app/widgets/text_field.dart';

class RegisterPersional extends StatelessWidget {
  const RegisterPersional({Key? key}) : super(key: key);

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
              child: Container(

                  padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight:Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20),
                      ),
                      color: Colors.white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "PHIẾU ĐĂNG KÝ", fontWeight: FontWeight.w500,),
                      SizedBox(height: 10,),
                      SmallText(text: "Đăng ký khám chữa bệnh cho cá nhân", color: Colors.black38,),
                      SizedBox(height: 30,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(text: "Họ và tên",color: Colors.black54, icon: Icons.person),
                      SizedBox(height: 16,),
                      AppTextField(text: "Địa chỉ",color: Colors.black54,icon: Icons.location_on),
                      SizedBox(height: 16,),
                      AppTextField(text: "Số điện thoại",color: Colors.black54,icon: Icons.phone),
                      SizedBox(height: 16,),
                      AppTextField(text: "CMND hoặc số căn cước",color: Colors.black54,icon: Icons.card_membership),

                      SizedBox(height: 16,),
                      AppDatePicker(),
                      SizedBox(height: 16,),
                      AppDropdownButton(),
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
          )
        ],
      ),

    );
  }
}
