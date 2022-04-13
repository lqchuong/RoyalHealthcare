import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/widgets/text/text_field.dart';

class AppTimePicker extends StatefulWidget {
  @override
  _AppTimePickerState createState()
  {
    return _AppTimePickerState();
  }
}

class _AppTimePickerState extends State<AppTimePicker> {
  String date = "";
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TextEditingController changeDate = TextEditingController();
    return
      AppTextField(text: "Chọn giờ khám", icon: Icons.calendar_month,editcontroller: changeDate,
        onPressed: () {
          _selectDate(context);
        },);

    //   Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   crossAxisAlignment: CrossAxisAlignment.end,
    //   children: [
    //     Container(
    //       width: 250,
    //       child:
    //     ),
    //
    //     // ElevatedButton(
    //     //       style: ElevatedButton.styleFrom(
    //     //
    //     //       fixedSize: const Size(120, 58),
    //     //   ),
    //     //   onPressed: () {
    //     //     _selectDate(context);
    //     //
    //     //   },
    //     //   child: Text("Chọn ngày"),
    //     // ),
    //   ],
    // );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }
}