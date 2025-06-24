import 'package:flutter/material.dart';

class N4KanjiSection extends StatelessWidget {
  final void Function(String kanjiId) onKanjiTap;
  
  const N4KanjiSection({
    super.key,
    required this.onKanjiTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Flex(
            direction: Axis.horizontal,
            spacing: 10,
            children: [
              Text("N4 Kanji"),
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
          children: List.generate(30, (index) {
            return Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
              child: InkWell(
                onTap: () => onKanjiTap('出'),
                child: Center(child: Text("出", style: TextStyle(fontSize: 20))),
              ),
            );
          }),
        ),
      ],
    );
  }
}
