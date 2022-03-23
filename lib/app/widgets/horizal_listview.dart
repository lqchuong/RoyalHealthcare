import 'package:flutter/material.dart';
import 'package:food_delivery/app/utils/dimensions.dart';
import 'package:food_delivery/app/widgets/big_text.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.height30),
      height: Dimensions.pageViewTextContainer,
      transformAlignment: Alignment.center,
      child: ListView(
        scrollDirection: Axis.horizontal,

        children: const <Widget>[
          Category(
            imageLocation: 'assets/icon_home_page/register.png',
            imageCaption: '  Đăng ký \nkhám bệnh',
          ),
          Category(
            imageLocation: 'assets/icon_home_page/Calendar.png',
            imageCaption: '    Xem\nlịch khám',
          ),
          Category(
            imageLocation: 'assets/icon_home_page/heart.png',
            imageCaption: 'Xét nghiệm\n        tim',
          ),
          Category(
            imageLocation: 'assets/icon_home_page/chemist.png',
            imageCaption: 'Cung cấp \n    Thuốc',
          ),
          Category(
            imageLocation: 'assets/icon_home_page/support.png',
            imageCaption: 'Hỗ trợ',
          ),

        ],
      ),
    );
  }
}

class Category extends StatelessWidget {

  final imageLocation;
  final imageCaption;

  const Category({Key? key,  this.imageLocation, this.imageCaption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        // onTap: new (){},
        child: SizedBox(
          width: 100.0,
          child: ListTile(
              title: Image.asset(imageLocation, width: 80.0,),

              subtitle: Container(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                alignment: Alignment.topCenter,
                child: BigText(text: imageCaption, size: 12,fontWeight: FontWeight.w500,),
              )
          ),
        ),

      ),
    );
  }
}
