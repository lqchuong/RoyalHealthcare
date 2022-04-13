import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DoctorDropdown extends StatefulWidget {
  const
  DoctorDropdown({Key? key}) : super(key: key);

  @override
  State<DoctorDropdown> createState() => _DoctorDropdownState();
}

class _DoctorDropdownState extends State<DoctorDropdown> {

  final List<String> genderItems = [
    'Nguyễn Văn A',
    'Nguyễn Văn B',
    'Nguyễn Văn C',
    'Nguyễn Văn D',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField2(
      decoration: InputDecoration(
        //Add isDense true and zero Padding.
        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(15),
        ),
        //Add more decoration as you want here
        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
      ),
      isExpanded: true,
      hint: const Text(
        'Chọn bác sĩ',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      iconSize: 30,
      buttonHeight: 60,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      // dropdownDecoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(15),
      // ),
      items: genderItems
          .map((item) =>
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Vui lòng chọn bác sĩ.';
        }
      },
      onChanged: (value) {
        //Do something when changing the item if you want.
      },
      onSaved: (value) {
        selectedValue = value.toString();
      },
    );
  }
}
