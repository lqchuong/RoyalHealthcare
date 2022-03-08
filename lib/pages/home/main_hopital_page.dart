

import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/bottom_bar.dart';
import 'package:food_delivery/pages/home/hopital_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}



class _MainFoodPageState extends State<MainFoodPage> {

  @override
  Widget build(BuildContext context) {

    print("curent height is "+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body:  Column(
        children: [
          //showing the header
          Container(
            margin: EdgeInsets.only(top:Dimensions.height45,bottom: Dimensions.height15), // margin top
            padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
            child: Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,//icon right center
                children: [
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
                  // Center(
                  //   child: Container(
                  //     width: Dimensions.width45,
                  //     height: Dimensions.height45,
                  //     child: Icon(Icons.search, color: Colors.white,size:Dimensions.radius20,),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(Dimensions.radius15),
                  //       color: AppColors.mainColor,
                  //
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          //showing the body
          Expanded(child: SingleChildScrollView(
            child:FoodPageBody(),
          )),

        ],
      ),
        bottomNavigationBar: BottomBar(indexSelect: 0,),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: _currentIndex,
      //   backgroundColor: Colors.blue,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white.withOpacity(.40),
      //   selectedLabelStyle: textTheme.caption,
      //   unselectedLabelStyle: textTheme.caption,
      //   onTap: (value) {
      //     // Respond to item press.
      //     // setState(() => _currentIndex = value);
      //     _onItemTapped(value);
      //   },
      //   items: const [
      //     BottomNavigationBarItem(
      //       label: 'Trang chủ',
      //       icon: Icon(Icons.home),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Lịch làm việc',
      //       icon: Icon(Icons.calendar_month),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Cài đặt',
      //       icon: Icon(Icons.settings),
      //     ),
      //
      //   ],
      // ),
    );
  }
}
