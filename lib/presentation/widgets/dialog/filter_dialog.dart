import 'package:flutter/material.dart';
import 'package:kanji_no_yarikata_mobile/presentation/widgets/dropdown/grade_dropdown.dart';
import 'package:kanji_no_yarikata_mobile/presentation/widgets/dropdown/jlpt_dropdown.dart';
import 'package:kanji_no_yarikata_mobile/presentation/widgets/dropdown/search_by_dropdown.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Filters"),
      content: const Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("JLPT"),
              JLPTDropdown(),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Grade"),
              GradeDropdown(),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Search By"),
              SearchByDropdown(),
            ],
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: (){},
          child: const Text("Test")
        ),
      ],
    );
  }
}