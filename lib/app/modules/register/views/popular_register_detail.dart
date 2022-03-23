
import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/home/views/bottom_bar.dart';
import 'package:food_delivery/app/utils/colors.dart';
import 'package:food_delivery/app/utils/dimensions.dart';
import 'package:food_delivery/app/widgets/app_icon.dart';
import 'package:food_delivery/app/widgets/big_text.dart';
import 'package:food_delivery/app/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.topContrainWithTopBar,
              left:0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/icon_home_page/background2.jpeg")
                    )
                  ),
              )),
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
              top: Dimensions.topContrainWithTopBar+200-20,
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
                    BigText(text: "ĐĂNG KÝ KHÁM CHỮA BỆNH", fontWeight: FontWeight.w500,),
                    SizedBox(height: 30,),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/registerPersional');
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
                                SizedBox(height: 10,),
                                SmallText(text: "Đăng ký khám bệnh cho cá nhân",color: Colors.black38,)
                              ],
                            ),
                          ],
                        ),

                      ),
                    ),

                    const Divider(color: Colors.black38,),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/registerOther');
                      },
                      child: Container(
                        height: 80,
                        width: Dimensions.screenWidth,

                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Image.asset("assets/icon_home_page/registerOther.png", width: 60,height: 60,),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: "Đăng ký khám bệnh cho người thân", fontWeight: FontWeight.w500,size: 16,),
                                SizedBox(height: 10,),
                                SmallText(text: "Đăng ký khám bệnh cho người thân ",color: Colors.black38,)
                              ],
                            ),
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
                          // crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Image.asset("assets/icon_home_page/Calendar.png", width: 60,height: 60,),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: "Xem lịch khám bệnh", fontWeight: FontWeight.w500,size: 16,),
                                SizedBox(height: 10,),
                                SmallText(text: "Xem lại lịch khám bệnh đã đăng ký",color: Colors.black38,)
                              ],
                            ),
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
