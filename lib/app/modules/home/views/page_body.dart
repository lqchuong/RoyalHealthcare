import 'package:carousel_pro/carousel_pro.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/home/controller/main_controler.dart';
import 'package:food_delivery/app/utils/dimensions.dart';
import 'package:food_delivery/app/widgets/text/big_text.dart';
import 'package:food_delivery/app/widgets/feature_grid_view.dart';
import 'package:food_delivery/app/widgets/horizal_listview.dart';
import 'package:get/get.dart';

class PageBody extends GetView<MainController> {
  PageController pageController =
      PageController(viewportFraction: 0.85); //hiện hình cạnh 2 bên
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> slides = [
      {"img": "assets/icon_home_page/background1.jpeg"},
      {"img": "assets/icon_home_page/background2.jpeg"},
      {"img": "assets/icon_home_page/background3.jpeg"},
      {"img": "assets/icon_home_page/background6.jpeg"},
      {"img": "assets/icon_home_page/background5.jpeg"},
    ];
    return Column(
      children: [
        Container(
          height: 200.0,
          child: Carousel(
            boxFit: BoxFit.cover,
            images: const [
              AssetImage('assets/icon_home_page/background1.jpeg'),
              AssetImage('assets/icon_home_page/background2.jpeg'),
              AssetImage('assets/icon_home_page/background3.jpeg'),
              AssetImage('assets/icon_home_page/background6.jpeg'),
              AssetImage('assets/icon_home_page/background5.jpeg'),
            ],
            autoplay: true,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: const Duration(milliseconds: 100),
            dotSize: 5.0,
            dotSpacing: 20.0,
            indicatorBgPadding: 6.0,
          ),
        ),

        // SizedBox(height: Dimensions.width10,),
        // Container(
        //     alignment: Alignment.centerLeft,
        //     height:30,
        //     padding: EdgeInsets.only(left: Dimensions.width10),
        //     width: Dimensions.screenWidth - Dimensions.width20*2,
        //
        //     decoration: BoxDecoration(
        //
        //       image: DecorationImage(
        //         fit: BoxFit.fill , //fix ảnh theo box
        //
        //         image: AssetImage(
        //             "assets/icon_home_page/titleBackground.png"
        //         ),
        //       ),
        //
        //     ),
        //     child: BigText(text: "Chức năng chính",color: Colors.white, fontWeight: FontWeight.w500,size: 14,),
        // ),

        // HorizontalList(),
        SizedBox(
          height: Dimensions.height30,
        ),
        // Container(
        //   alignment: Alignment.centerLeft,
        //   height: 30,
        //   padding: EdgeInsets.only(left: Dimensions.width10),
        //   width: Dimensions.screenWidth - Dimensions.width20 * 2,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       fit: BoxFit.fill, //fix ảnh theo box
        //
        //       image: AssetImage("assets/icon_home_page/titleBackground.png"),
        //     ),
        //   ),
        //   child: BigText(
        //     text: "Chức năng chính",
        //     color: Colors.white,
        //     fontWeight: FontWeight.w500,
        //     size: 14,
        //   ),
        // ),

        //list of food and image
        Container(
          height: 1200,
          decoration: BoxDecoration(color: Colors.white),
          child: AppGridView(),
        )
      ],
    );
  }

  Widget _buildPageItem(int index, List slide) {
    final String img;
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor), 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover, //fix ảnh theo box
                image: AssetImage(slide[index]['img']),
              ),
            ),
          ),
          //slide nho?
          // Align(
          //   alignment: Alignment.bottomCenter,
          //
          //   child: Container(
          //
          //       height: Dimensions.pageViewTextContainer,
          //       margin: EdgeInsets.only(left: Dimensions.height30 ,right: Dimensions.height30, bottom: Dimensions.height30),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(Dimensions.radius20),
          //         color: Colors.white,
          //         boxShadow: [
          //           BoxShadow(
          //             color: Color(0xFFe8e8e8),
          //             blurRadius: 5.0,
          //             offset: Offset(0,5),
          //           ),
          //           BoxShadow(
          //             color: Colors.white,
          //               offset: Offset(-5,0),
          //           ),
          //           BoxShadow(
          //             color: Colors.white,
          //             offset: Offset(5,0),
          //           )
          //         ]
          //
          //       ),
          //       child: Container (
          //         padding: EdgeInsets.only(top:Dimensions.height20, left:Dimensions.width20, right:Dimensions.width20),
          //         child: AppColumn(text: 'A',)
          //       )
          //   ),
          // ),
        ],
      ),
    );
  }
}
//
// class _HopitalPageBodyState extends State<HopitalPageBody> {
//
//   @override
//   void initState(){
//     super.initState();
//     pageController.addListener(() {
//       setState(() {
//         _currPageValue =  pageController.page!;
//         print("current value is "+_currPageValue.toString());
//       });
//     });
//   }
//
//   @override
//   void dispose(){
//     pageController.dispose();
//
//   }
//
//
// }
//
