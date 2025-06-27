import 'package:flutter/material.dart';
import 'package:kanji_no_yarikata_mobile/providers/kanji_provider.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/kanji.dart';

class N5KanjiSection extends StatelessWidget {
  final void Function(Kanji kanji) onKanjiTap;

  const N5KanjiSection({super.key, required this.onKanjiTap});

  @override
  Widget build(BuildContext context) {
    final kanjiProvider = Provider.of<KanjiProvider>(context);
    final n5Kanji = kanjiProvider.n5Kanji;

    if (kanjiProvider.n5Kanji.isEmpty) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Flex(
              direction: Axis.horizontal,
              spacing: 10,
              children: [
                Text("N5 Kanji"),
                Expanded(
                  child: Divider(
                    thickness: 1.5,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text("No N5 Kanji has been added yet."),
          ),
        ],
      );
    }

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
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          padding: EdgeInsets.all(20.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: n5Kanji.length,
          itemBuilder: (context, int index) {
            final kanji = n5Kanji[index];

            return Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
              ),
              child: InkWell(
                onTap: () => onKanjiTap(kanji),
                child: Center(
                  child: Text(kanji.kanji, style: TextStyle(fontSize: 20)),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
