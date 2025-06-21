import 'package:flutter/material.dart';

class SearchByDropdown extends StatefulWidget {
  const SearchByDropdown({super.key});

  @override
  State<SearchByDropdown> createState() => SearchByDropdownState();
}

class SearchByDropdownState extends State<SearchByDropdown> {
  String selectedValue = 'All';

  final List<String> items = ['All', 'Kanji', 'Meaning', 'On\'yomi', 'Kun\'yomi'];

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