
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../pages/register/popular_register_detail.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';
import 'dart:convert';

class AppListView extends StatelessWidget {

  const AppListView({Key? key,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"img": "assets/icon_home_page/ic1.png","title":"ĐÁNH GIÁ KHẢ NĂNG GẮNG SỨC,\nKHẢ NĂNG TIM PHỔI", "text": "Đánh giá khả năng gắng sức, chức năng tim phổi"},
      {"img": "assets/icon_home_page/ic2.png","title":"KHÁM SỨC KHỎE TỔNG QUÁT,\n CHUYÊN KHOA", "text": "Khám sức khỏe tổng quát, chuyên khoa"},
      {"img": "assets/icon_home_page/ic3.png","title":"XÉT NGHIỆM MÁU", "text": "Xét nghiệm máu"},
      {"img": "assets/icon_home_page/ic4.png","title":"CHUẨN ĐOÁN HÌNH ẢNH", "text": "Chuẩn đoán hình ảnh"},
      {"img": "assets/icon_home_page/ic5.png","title":"CUNG CẤP THUỐC", "text": "Cung cấp thuốc"},
      {"img": "assets/icon_home_page/ic6.png","title":"CUNG CẤP TRANG THIẾT BỊ Y TẾ", "text": "Cung cấp trang thiết bị y tế"},
      {"img": "assets/icon_home_page/ic5.png","title":"CÁC GÓI KHÁM SỨC KHỎE", "text": "Các gói khám sức khỏe"},
      {"img": "assets/icon_home_page/ic6.png","title":"CÂU LẠC BỘ BỆNH NHÂN", "text": "Câu lạc bộ bệnh nhân"},


    ];

   return GridView.builder(
     // shrinkWrap: true,
       padding: EdgeInsets.all(10),
     shrinkWrap: true,
     physics: NeverScrollableScrollPhysics(),
       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         childAspectRatio:3/1,
         crossAxisCount: 1,
         crossAxisSpacing: 5,
         mainAxisSpacing: 5


       ),
       itemCount: categories.length,
       itemBuilder: (BuildContext context, int index) {
         return InkWell(
          onTap: () {
              Navigator.of(context).pushNamed('/detail');
            },
           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30),
               boxShadow: [
                 BoxShadow(
                   color: AppColors.shadowColor,
                   blurRadius: 5.0,
                   offset: Offset(0,3),
                 ),

               ],
             ),
             child: Card(
               color: Colors.blue[50],
               child: Container(
                 // padding: EdgeInsets.only(left: Dimensions.width10,
                 //     right: Dimensions.width10),
                 child:   Container(
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       fit: BoxFit.cover,
                       opacity: 0.8,
                       image: AssetImage(
                         categories[index]["img"],
                       ),
                     ),
                   ),
                   child:  Container(

                     padding: EdgeInsets.only(
                         left: Dimensions.width20,
                         top: Dimensions.height20

                     ),
                     child:  Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [

                         BigText(text: categories[index]["title"],
                           color: AppColors.mainColor,fontWeight: FontWeight.w900,size: 16,),
                         SizedBox(height: Dimensions.height10,),
                         SmallText(text: categories[index]["text"],
                             color: Colors.black),
                         SizedBox(height: Dimensions.height10,),

                       ],
                     ),
                   ),

                 ),


               ),


             ),
           )
         );

       },
   );

  }
}
