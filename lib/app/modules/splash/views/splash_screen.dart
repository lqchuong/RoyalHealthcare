import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:food_delivery/app/routes/app_pages.dart';
import 'package:food_delivery/app/utils/colors.dart';
import 'package:food_delivery/app/utils/dimensions.dart';
import 'package:food_delivery/app/widgets/big_text.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pageController = PageController(viewportFraction: 0.85);//hiện hình cạnh 2 bên
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  List<Map<String, dynamic>> slides = [
    {"img": "assets/icon_home_page/background1.jpeg", "label":"Sức khỏe tốt và trí tuệ minh mẫn là hai điêu hạnh phúc nhất của cuộc đời"},
    {"img": "assets/icon_home_page/background2.jpeg","label":"Không có gì khiến con người tiến gần đến thần thánh hơn việc trao sức khỏe cho con người"},
    {"img": "assets/icon_home_page/background3.jpeg","label":"Thể chất là điều kiện tiên quyết đầu tiên của hạnh phúc."},
    {"img": "assets/icon_home_page/background6.jpeg","label":"Sức khỏe mới là của cải thực sự, chứ không phải vàng bạc."},
    {"img": "assets/icon_home_page/background5.jpeg","label":"Sức khỏe tốt và trí tuệ minh mẫn là hai điêu hạnh phúc nhất của cuộc đời"},
  ];

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue =  pageController.page!;
        print("current value is "+_currPageValue.toString());
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();

  }
  Widget build(BuildContext context) {
    return Material(
      child: Container(

          height: Dimensions.screenHeight,
          width: Dimensions.screenWidth,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child:
          Column(
              children: [
                SizedBox(height: Dimensions.height45,),
                SizedBox(height: Dimensions.height45,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logoHealth.png", width: Dimensions.width45, height: Dimensions.height45,),
                    SizedBox(width: Dimensions.width10),
                    BigText(text: "ROYAL HEALTHCARE", fontWeight: FontWeight.w700,size: 24,)
                  ],
                ),
                SizedBox(height: Dimensions.height20,),
                //slider section
                Container(
                  height:Dimensions.pageSplash2,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: slides.length,
                      itemBuilder: (context, position){
                        return _buildPageItem(position);
                      }),
                ),
                //dots
                SizedBox(height: Dimensions.height10,),
                new DotsIndicator(
                  dotsCount: 5,
                  position: _currPageValue,
                  decorator: DotsDecorator(
                    activeColor: AppColors.mainColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0,9.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
                  ),
                ),
                SizedBox(height: Dimensions.height45,),
                SizedBox(height: Dimensions.height45,),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.MAIN);
                    // Respond to button press
                  },
                  style: ElevatedButton.styleFrom(

                      fixedSize: const Size(200, 42),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimensions.width20)),

                      primary: AppColors.mainColor,
                      // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  child: Text("Tiếp tục"),
                  // icon: Icon(Icons.arrow_forward_ios, size: 18),
                )
              ]
          ))
    );

  }


  Widget _buildPageItem(int index) {
    // Matrix4 matrix = new Matrix4.identity();
    // if (index == _currPageValue.floor()) {
    //   var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, currTrans, 0);
    // } else if (index == _currPageValue.floor() + 1) {
    //   var currScale = _scaleFactor +
    //       (_currPageValue - index + 1) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, currTrans, 0);
    // } else if (index == _currPageValue.floor() - 1) {
    //   var currScale = 1 -
    //       (_currPageValue - index) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, currTrans, 0);
    // } else {
    //   var currScale = 0.9;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, _height * (1 - _scaleFactor), 0);
    // }

    return Container(
      // transform: matrix,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
           padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
           child: Text(
             slides[index]['label'],
             textAlign: TextAlign.center,style: TextStyle(
             color: Colors.black38,
           ),
           ),
          ),

          SizedBox(height: Dimensions.height45,),
        Stack(
          children: [
            Container(
              height: Dimensions.pageSplash,
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover, //fix ảnh theo box
                  image: AssetImage(
                    slides[index]['img'],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]
    ),

    );
  }
}


//
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       height: Dimensions.screenHeight,
//       width: Dimensions.screenWidth,
//       decoration: BoxDecoration(
//         color: Colors.white
//       ),
//       child:
//       Column(
//         children: [
//         //slider section
//         Container(
//         height:Dimensions.pageView,
//         child: PageView.builder(
//             controller: pageController,
//             itemCount: 5,
//             itemBuilder: (context, position){
//               return _buildPageItem(position);
//             }),
//       ),
//       //dots
//       new DotsIndicator(
//         dotsCount: 5,
//         position: _currPageValue,
//         decorator: DotsDecorator(
//           activeColor: AppColors.mainColor,
//           size: const Size.square(9.0),
//           activeSize: const Size(18.0,9.0),
//           activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
//         ),
//       ),
//     ),
//       // Column(
//       //   children:[
//       //     // SizedBox(height: Dimensions.height30,),
//       //     Text("aaaa"),
//       //     Container(
//       //       height: 400,
//       //       child:Carousel(
//       //         boxFit: BoxFit.cover,
//       //         images: const [
//       //           AssetImage('assets/icon_home_page/background1.jpeg'),
//       //           AssetImage('assets/icon_home_page/background2.jpeg'),
//       //           AssetImage('assets/icon_home_page/background3.jpeg'),
//       //           AssetImage('assets/icon_home_page/background6.jpeg'),
//       //           AssetImage('assets/icon_home_page/background5.jpeg'),
//       //         ],
//       //         autoplay: true,
//       //         animationCurve: Curves.fastOutSlowIn,
//       //         animationDuration: const Duration(milliseconds: 100),
//       //         dotSize: 5.0,
//       //         dotSpacing: 20.0,
//       //         indicatorBgPadding: 6.0,
//       //       ),
//       //     )
//       //
//       //   ],
//       // ),
//     );
//
//   }
//   Widget _buildPageItem(int index){
//     Matrix4 matrix = new Matrix4.identity();
//     if (index==_currPageValue.floor()){
//       var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
//       var currTrans = _height*(1-currScale)/2;
//       matrix = Matrix4.diagonal3Values(1,  currScale, 1);
//       matrix = Matrix4.diagonal3Values(1,  currScale, 1)..setTranslationRaw(0, currTrans, 0);
//
//     } else if (index == _currPageValue.floor()+1){
//       var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
//       var currTrans = _height*(1-currScale)/2;
//       matrix = Matrix4.diagonal3Values(1,  currScale, 1);
//       matrix = Matrix4.diagonal3Values(1,  currScale, 1)..setTranslationRaw(0, currTrans, 0);
//
//     } else if (index == _currPageValue.floor()-1){
//       var currScale = _scaleFactor+(_currPageValue-index)*(1-_scaleFactor);
//       var currTrans = _height*(1-currScale)/2;
//       matrix = Matrix4.diagonal3Values(1,  currScale, 1);
//       matrix = Matrix4.diagonal3Values(1,  currScale, 1)..setTranslationRaw(0, currTrans, 0);
//
//     } else {
//       var currScale = 0.8;
//       matrix = Matrix4.diagonal3Values(1,  currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor), 0);
//
//     }
//
//     return Transform(
//       transform: matrix,
//       child: Stack(
//         children: [
//           Container(
//             height: Dimensions.pageViewContainer,
//             margin: EdgeInsets.only(left: 5, right: 5),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
//               image: DecorationImage(
//                 fit: BoxFit.cover, //fix ảnh theo box
//                 image: AssetImage(
//                     "assets/images/yte1.png"
//                 ),
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
//


