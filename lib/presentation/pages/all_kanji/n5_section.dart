import 'package:flutter/material.dart';

class N5KanjiSection extends StatelessWidget {
  const N5KanjiSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
          child: Flex(
            direction: Axis.horizontal,
            spacing: 10,
            children: [
              Text("N5 Kanji"),
              Expanded(
                child: Divider(
                  thickness: 1.5,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        GridView.count(
          padding: EdgeInsets.all(20.0),
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(50, (index) {
            return Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
              child: InkWell(
                onTap: () {},
                child: Center(child: Text("一", style: TextStyle(fontSize: 20))),
              ),
            );
          }),
        ),
      ],
    );
  }
}
