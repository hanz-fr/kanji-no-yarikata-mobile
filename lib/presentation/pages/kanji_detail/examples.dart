import 'package:flutter/material.dart';
import 'package:kanji_no_yarikata_mobile/domain/entities/kanji.dart';
import 'package:kanji_no_yarikata_mobile/providers/examples_provider.dart';
import 'package:provider/provider.dart';

class KanjiExamplesContainer extends StatelessWidget {
  const KanjiExamplesContainer({super.key, required this.examples});

  final List<KanjiExamples?> examples;

  @override
  Widget build(BuildContext context) {
    final examplesProvider = Provider.of<ExamplesProvider>(context);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: const Text("Examples")),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: const Text(
                            "Kana Reading",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 12
                            ),
                          ),
                        ),
                        Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            value: examplesProvider.showKanaReading,
                            onChanged: examplesProvider.toggleHiragana,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsetsGeometry.only(bottom: 1)),
              Column(
                mainAxisSize: MainAxisSize.max,
                spacing: 8,
                children: examples
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 5,
                        children: [
                          Flexible(
                            child: Text(examplesProvider.showKanaReading ? '${e!.word} [${e.kanaReading}]' : e!.word),
                          ),
                          Flexible(
                            child: Text(e.meaning, textAlign: TextAlign.end),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
