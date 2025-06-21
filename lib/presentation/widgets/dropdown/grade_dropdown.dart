import 'package:flutter/material.dart';

class GradeDropdown extends StatefulWidget {
  const GradeDropdown({super.key});

  @override
  State<GradeDropdown> createState() => GradeDropdownState();
}

class GradeDropdownState extends State<GradeDropdown> {
  String selectedValue = 'All';

  final List<String> items = ['All', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      items: items.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
    );
  }
}