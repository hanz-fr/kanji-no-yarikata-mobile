import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kanji_no_yarikata_mobile/providers/search_filter_provider.dart';

class JLPTDropdown extends StatefulWidget {
  const JLPTDropdown({super.key});

  @override
  State<JLPTDropdown> createState() => JLPTDropdownState();
}

class JLPTDropdownState extends State<JLPTDropdown> {
  
  final List<String> items = ['All', 'N5', 'N4', 'N3'];

  @override
  Widget build(BuildContext context) {
  
    final searchFilter = Provider.of<SearchFilterProvider>(context);
  
    return DropdownButton<String>(
      value: searchFilter.jlpt,
      items: items.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          Provider.of<SearchFilterProvider>(context, listen: false).jlpt = newValue;
        }
      },
    );
  }
}