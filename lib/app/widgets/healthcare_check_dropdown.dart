import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class HealthCheckPackageDropdown extends StatefulWidget {
  final ValueChanged<String>? selectedValue;

  HealthCheckPackageDropdown({Key? key, this.selectedValue}) : super(key: key);

  @override
  State<HealthCheckPackageDropdown> createState() =>
      _HealthCheckPackageDropdownState();
}

class _HealthCheckPackageDropdownState
    extends State<HealthCheckPackageDropdown> {
  final List<String> genderItems = [
    'Khám tại bệnh viện',
    'Khám tại phòng khám',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
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
        'Chọn gói khám sức khỏe',
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
          .map((item) => DropdownMenuItem<String>(
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
          return 'Vui lòng chọn gói khám.';
        }
      },
      onChanged: (value) {
        widget.selectedValue!(value.toString());
        //Do something when changing the item if you want.
      },
      onSaved: (value) {
        widget.selectedValue!(value.toString());
      },
    );
  }
}
