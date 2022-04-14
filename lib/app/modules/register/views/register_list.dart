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
import '../../../widgets/list_view.dart';
import '../../../widgets/text/text_field.dart';

class RegisterList extends StatefulWidget {
  const RegisterList({Key? key}) : super(key: key);

  @override
  State<RegisterList> createState() => _RegisterListState();
}
enum SingingCharacter { personal, other }
enum Gender { male, female }
enum CheckType {plan, require}



class _RegisterListState extends State<RegisterList> {

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
                      child: AppListView()
                  )
              ),
            ),
          )
        ],
      ),

    );
  }
}

