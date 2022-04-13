import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/app_icon.dart';
import '../../../widgets/text/big_text.dart';
import '../../../widgets/text/small_text.dart';
import '../../home/views/bottom_bar.dart';

import 'package:get/get.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
              top: Dimensions.topContrainWithTopBar,
            left:0,
            right: 0,
            child: Container (
              width: double.maxFinite,
                color: Color(0xFF4795EC),
                height: 300,
              child: Column (
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Color(0xFFe8e8e8),
                      //     blurRadius: 5.0,
                      //     offset: Offset(0, 5),
                      //   ),
                      // ],
                      borderRadius: BorderRadius.circular(60),

                      image: DecorationImage(
                        fit: BoxFit.cover, //fix ảnh theo box
                        image:   NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  BigText(text: "Nguyễn Văn Tèo", fontWeight: FontWeight.w500,color: Colors.white,),
                ],

              )
            )
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.topContrainWithTopBar+220-20,
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
                      // BigText(text: "ĐĂNG KÝ KHÁM CHỮA BỆNH", fontWeight: FontWeight.w500,),
                      // SizedBox(height: 30,),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.REGISTERPERSIONAL);
                        },
                        child: Container(
                          height: 80,
                          width: Dimensions.screenWidth,

                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Image.asset("assets/icon_home_page/register.png", width: 60,height: 60,),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: "Đăng ký khám bệnh", fontWeight: FontWeight.w500,size: 16,),
                                  // SizedBox(height: 10,),
                                  // SmallText(text: "Đăng ký khám bệnh cho cá nhân",color: Colors.black38,)
                                ],
                              ),
                            ],
                          ),

                        ),
                      ),

                      const Divider(color: Colors.black38,),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.REGISTERHEALTHCHECK);
                        },
                        child: Container(
                          height: 80,
                          width: Dimensions.screenWidth,

                          child: Row(

                            children: [
                              Image.asset("assets/icon_home_page/heart.png", width: 60,height: 60,),
                              SizedBox(width: 10,),
                              Expanded(child: BigText(text: "Đăng ký đánh giá khả năng gắng sức, khả năng tim phổi",
                                fontWeight: FontWeight.w500,size: 16,),)
                            ],
                          ),

                        ),
                      ),

                      const Divider(color: Colors.black38,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/detail');
                        },
                        child: Container(
                          height: 80,
                          width: Dimensions.screenWidth,

                          child: Row(

                            children: [
                              Image.asset("assets/icon_home_page/Calendar.png", width: 60,height: 60,),
                              SizedBox(width: 10,),

                              Expanded(child: BigText(text: "Xem lại lịch khám bệnh",
                                fontWeight: FontWeight.w500,size: 16),)
                            ],
                          ),
                        ),
                      ),

                      const Divider(color: Colors.black38,),
                    ],
                  )
              )
          )
        ],
      ),
      bottomNavigationBar: BottomBar(indexSelect: 1),
    );
  }
}
