import 'package:flutter/material.dart';
import 'package:food_delivery/app/widgets/text/small_text.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'text/big_text.dart';

class AppListView extends StatelessWidget {

  const AppListView({Key? key,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"name": "Nguyễn Văn Hai","date":"01/01/2021","other":true, "type": "Khám sức khỏe"},
      {"name": "Nguyễn Văn Ba","date":"01/02/2021","other":false, "type": "Đánh giá khả năng"},
      {"name": "Nguyễn Văn Bốn","date":"01/03/2021","other":true, "type": "Khám sức khỏe"},
      {"name": "Nguyễn Văn Năm","date":"01/04/2021","other":false, "type": "Đánh giá khả năng"},
      {"name": "Nguyễn Văn Sáu","date":"01/05/2021","other":false, "type": "Đánh giá khả năng"},
      {"name": "Nguyễn Văn Một","date":"01/06/2021","other":true, "type": "Khám sức khỏe"},
    ];

   return GridView.builder(
     // shrinkWrap: true,
       padding: EdgeInsets.all(5),
     shrinkWrap: true,
     physics: NeverScrollableScrollPhysics(),
       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         childAspectRatio:4/1,
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

             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Image.asset("assets/icon_home_page/Calendar.png", width: 60,height: 60,),

                     Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 children: [
                                   SmallText(text: "Người khám:", color: Colors.black,size: 14,),
                                   SizedBox(width: 4,),
                                   SmallText(text: categories[index]["name"] , fontWeight: FontWeight.w600, color: Colors.black,size: 14,),
                                   SizedBox(width: 5,),
                                   categories[index]["other"] ? Icon(Icons.people, color: Colors.blue,): Icon(null)
                                 ],
                               ),
                               SizedBox(height: 4,),
                               Row(
                                 children: [
                                   SmallText(text: "Ngày khám:", color: Colors.black,size: 14,),
                                   SizedBox(width: 4,),
                                   SmallText(text: categories[index]["date"],fontWeight: FontWeight.w600, color: Colors.black,size: 14,),
                                 ],
                               ),
                               SizedBox(height: 4,),
                               Row(
                                 children: [
                                   SmallText(text: "Loại:", color: Colors.black,size: 14,),
                                   SizedBox(width: 4,),
                                   SmallText(text: categories[index]["type"],fontWeight: FontWeight.w600, color: Colors.black,size: 14,),
                                 ],
                               ),
                               SizedBox(height: 4,),

                      ],
                      ),
                     Icon(Icons.arrow_forward_ios)
                  ],
                 ),
                 const Divider(color: Colors.black38,),
               ],
             )


             // Card(
             //   color: Colors.blue[50],
             //   child: Container(
             //     // padding: EdgeInsets.only(left: Dimensions.width10,
             //     //     right: Dimensions.width10),
             //     child:   Container(
             //       decoration: BoxDecoration(
             //         image: DecorationImage(
             //           fit: BoxFit.cover,
             //           opacity: 0.8,
             //           image: AssetImage(
             //             categories[index]["img"],
             //           ),
             //         ),
             //       ),
             //       child:  Container(
             //
             //         padding: EdgeInsets.only(
             //             left: Dimensions.width20,
             //             top: Dimensions.height20
             //
             //         ),
             //         child:  Column(
             //           crossAxisAlignment: CrossAxisAlignment.start,
             //           mainAxisAlignment: MainAxisAlignment.center,
             //           children: [
             //
             //             BigText(text: categories[index]["title"],
             //               color: AppColors.mainColor,fontWeight: FontWeight.w900,size: 16,),
             //             SizedBox(height: Dimensions.height10,),
             //             SmallText(text: categories[index]["text"],
             //                 color: Colors.black),
             //             SizedBox(height: Dimensions.height10,),
             //
             //           ],
             //         ),
             //       ),
             //
             //     ),
             //
             //
             //   ),
             //
             //
             // ),
           )
         );

       },
   );

  }
}
