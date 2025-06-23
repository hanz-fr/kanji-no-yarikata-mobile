import 'package:flutter/material.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/all_kanji/n3_section.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/all_kanji/n4_section.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/all_kanji/n5_section.dart';

class AllKanjiScreen extends StatelessWidget {
  const AllKanjiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the arguments in your screen
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        title: Text('All Kanji'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            N5KanjiSection(),
            N4KanjiSection(),
            N3KanjiSection(),
          ],
        ),
      ),
    );
  }
}
