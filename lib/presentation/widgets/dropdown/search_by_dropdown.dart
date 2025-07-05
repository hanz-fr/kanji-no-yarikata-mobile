import 'package:flutter/material.dart';
import 'package:kanji_no_yarikata_mobile/providers/search_filter_provider.dart';
import 'package:provider/provider.dart';

class SearchByDropdown extends StatefulWidget {
  const SearchByDropdown({super.key});

  @override
  State<SearchByDropdown> createState() => SearchByDropdownState();
}

class SearchByDropdownState extends State<SearchByDropdown> {

  final List<String> items = ['All', 'Kanji', 'Meaning', 'On\'yomi', 'Kun\'yomi'];

  @override
  Widget build(BuildContext context) {

    final searchFilter = Provider.of<SearchFilterProvider>(context);

    return DropdownButton<String>(
      value: searchFilter.searchBy,
      items: items.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          Provider.of<SearchFilterProvider>(context, listen: false).searchBy = newValue;
        }
      },
    );
  }
}