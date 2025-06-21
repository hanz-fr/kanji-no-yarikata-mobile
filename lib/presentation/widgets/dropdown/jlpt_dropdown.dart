import 'package:flutter/material.dart';

class JLPTDropdown extends StatefulWidget {
  const JLPTDropdown({super.key});

  @override
  State<JLPTDropdown> createState() => JLPTDropdownState();
}

class JLPTDropdownState extends State<JLPTDropdown> {
  String selectedValue = 'All';

  final List<String> items = ['All', 'N5', 'N4', 'N3'];

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