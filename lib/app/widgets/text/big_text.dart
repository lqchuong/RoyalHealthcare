import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight ;
  TextAlign textAlignCenter;

  BigText({Key? key, this.color = const Color(0xff0d3f82),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 0,
    this.fontWeight = FontWeight.w400,
    this.textAlignCenter = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      textAlign: textAlignCenter,
      overflow: overflow, // hiển thị ... khi hết hàng
      style: TextStyle(
        // fontFamily: 'Roboto',

        color: color,
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: fontWeight
      ),
    );
  }
}
