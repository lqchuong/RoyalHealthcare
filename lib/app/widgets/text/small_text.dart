
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  FontWeight fontWeight ;

  SmallText({Key? key, this.color = const Color(0xFF89dad0),
    required this.text,
    this.size = 0,
    this.height = 1.2,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        // fontFamily: 'Roboto',
          color: color,
          fontSize: size==0?Dimensions.font12:size,
          fontWeight: fontWeight
      ),
    );
  }
}
