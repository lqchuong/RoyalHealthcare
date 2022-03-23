import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/widgets/text_field.dart';

class AppDatePicker extends StatefulWidget {
  @override
  _AppDatePickerState createState()
  {
    return _AppDatePickerState();
  }
}

class _AppDatePickerState extends State<AppDatePicker> {
  String date = "";
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TextEditingController changeDate = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 250,
          child: AppTextField(text: "Chọn ngày khám", icon: Icons.calendar_month,editcontroller: changeDate, ),
        ),

        ElevatedButton(
              style: ElevatedButton.styleFrom(

              fixedSize: const Size(120, 58),
          ),
          onPressed: () {
            _selectDate(context);

          },
          child: Text("Chọn ngày"),
        ),


      ],
    );
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