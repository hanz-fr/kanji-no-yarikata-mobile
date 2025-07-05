import 'package:flutter/material.dart';
import 'package:kanji_no_yarikata_mobile/providers/search_filter_provider.dart';
import 'package:provider/provider.dart';

class GradeDropdown extends StatefulWidget {
  const GradeDropdown({super.key});

  @override
  State<GradeDropdown> createState() => GradeDropdownState();
}

class GradeDropdownState extends State<GradeDropdown> {

  final List<String> items = ['All', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  @override
  Widget build(BuildContext context) {

    final searchFilter = Provider.of<SearchFilterProvider>(context);

    return DropdownButton<String>(
      value: searchFilter.grade,
      items: items.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          Provider.of<SearchFilterProvider>(context, listen: false).grade = newValue;
        }
      },
    );
  }
}