import 'package:flutter/material.dart';
import 'package:kanji_no_yarikata_mobile/domain/entities/kanji.dart';

class KanjiExamplesContainer extends StatelessWidget {
  const KanjiExamplesContainer({super.key, required this.examples});

  final List<KanjiExamples?> examples;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: BorderSide(color: Color.fromRGBO(208, 208, 208, 1), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Examples"),
              const Padding(padding: EdgeInsetsGeometry.only(bottom: 1)),
              Column(
                mainAxisSize: MainAxisSize.max,
                spacing: 8,
                children: examples.map(
                  (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 5,
                    children: [
                      Flexible(child: Text('${e!.word} [${e.kanaReading}]')),
                      Flexible(child: Text(e.meaning, textAlign: TextAlign.end,)),
                    ],
                  ),
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
