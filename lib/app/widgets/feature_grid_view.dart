import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class AppGridView extends StatelessWidget {

  const AppGridView({Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"img": "assets/icon_home_page/register.png","title":"ĐÁNH GIÁ KHẢ NĂNG GẮNG SỨC,\nKHẢ NĂNG TIM PHỔI", "text": "Đánh giá khả năng gắng sức, chức năng tim phổi"},
      {"img": "assets/icon_home_page/registerOther.png","title":"KHÁM SỨC KHỎE TỔNG QUÁT,\n CHUYÊN KHOA", "text": "Khám sức khỏe tổng quát, chuyên khoa"},
      {"img": "assets/icon_home_page/support.png","title":"XÉT NGHIỆM MÁU", "text": "Xét nghiệm máu"},
      {"img": "assets/icon_home_page/heart.png","title":"CHUẨN ĐOÁN HÌNH ẢNH", "text": "Chuẩn đoán hình ảnh"},
      {"img": "assets/icon_home_page/chemist.png","title":"CUNG CẤP THUỐC", "text": "Cung cấp thuốc"},
      {"img": "assets/icon_home_page/Calendar.png","title":"CUNG CẤP TRANG THIẾT BỊ Y TẾ", "text": "Cung cấp trang thiết bị y tế"},
      {"img": "assets/icon_home_page/register.png","title":"CÁC GÓI KHÁM SỨC KHỎE", "text": "Các gói khám sức khỏe"},
      {"img": "assets/icon_home_page/support.png","title":"CÂU LẠC BỘ BỆNH NHÂN", "text": "Câu lạc bộ bệnh nhân"},


    ];

    return Ink(
      color: Colors.black,
       child: GridView.builder(
          // shrinkWrap: true,
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio:3/2,
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
          ),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/detail');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      top: Dimensions.height20

                  ),
                  child:  ListTile(
                      tileColor:  null,
                      title: Image.asset(categories[index]["img"], width: 80.0,height: 80.0,),

                      subtitle: Container(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        alignment: Alignment.topCenter,
                        child: BigText(text: categories[index]["title"], size: 12,fontWeight: FontWeight.w500,),
                      )
                  ),
                ),
            );





          },
        ),
    );


  }
}
