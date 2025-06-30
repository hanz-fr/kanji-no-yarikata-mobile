import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/kanji.dart';
import '../../../providers/kanji_provider.dart';

class N4KanjiSection extends StatelessWidget {
  final void Function(Kanji kanjiId) onKanjiTap;

  const N4KanjiSection({super.key, required this.onKanjiTap});

  @override
  Widget build(BuildContext context) {
    final kanjiProvider = Provider.of<KanjiProvider>(context);
    final n4Kanji = kanjiProvider.n4Kanji;

    if (kanjiProvider.n4Kanji.isEmpty) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Flex(
              direction: Axis.horizontal,
              spacing: 10,
              children: [
                const Text("N4 Kanji"),
                Expanded(
                  child: Divider(
                    thickness: 1.5,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Text("No N4 Kanji has been added yet."),
          ),
        ],
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Flex(
            direction: Axis.horizontal,
            spacing: 10,
            children: [
              const Text("N4 Kanji"),
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
          padding: const EdgeInsets.all(20.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: n4Kanji.length,
          itemBuilder: (context, int index) {
            final kanji = n4Kanji[index];

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
