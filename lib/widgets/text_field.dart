

import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  Color? color;
  final String text;
  String helpText;
  double size;
  double padding;
  double height;
  IconData icon;
  TextEditingController? editcontroller;

  AppTextField({Key? key, this.color = Colors.black,
    required this.text,
    this.size = 14,
    this.height = 1.5,
    this.padding = 10,
    this.helpText = 'Keep it short, this is just a demo.',
    this.icon = Icons.person,
    this.editcontroller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //config container to set width
    return TextFormField(
      controller: editcontroller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: Icon(icon),
            border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
      ),
        label: Text(text),
        hintText: text,
      ),
    );
  }
}
//
// TextField(
// style: TextStyle(color: Colors.black, decorationColor: Colors.black),
//
// decoration: new InputDecoration(
//
// hintText: text,
// helperText: helpText,
// labelText: text,
// suffixIcon: Icon(
// icon,
// color: Colors.grey,
// ),
// prefixText: ' ',
// suffixText: '',
// filled: true,
// fillColor: Color(0xFFF2F2F2),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(4)),
// borderSide: BorderSide(width: 1,color: Colors.black38),
// ),
// disabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(4)),
// borderSide: BorderSide(width: 1,color: Colors.orange),
// ),
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(4)),
// borderSide: BorderSide(width: 1,color: Colors.green),
// ),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(4)),
// borderSide: BorderSide(width: 1,)
// ),
// errorBorder: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(4)),
// borderSide: BorderSide(width: 1,color: Colors.black38)
// ),
// focusedErrorBorder: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(4)),
// borderSide: BorderSide(width: 1,color: Colors.black)
// ),
//
// hintStyle: TextStyle(fontSize: 16,color: Color(0xFFB3B1B1)),
// errorText: "",
// suffixStyle: const TextStyle(color: Colors.green)),
// );