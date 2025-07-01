import 'package:flutter/material.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/all_kanji/n3_section.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/all_kanji/n4_section.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/all_kanji/n5_section.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/kanji_detail/kanji_detail.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/kanji.dart';
import '../../../providers/kanji_provider.dart';

class AllKanjiScreen extends StatelessWidget {
  const AllKanjiScreen({super.key});

  void _navigateToKanjiDetailPage(BuildContext context, Kanji kanji) {
    Provider.of<KanjiProvider>(context, listen: false).loadKanjiComponents(kanji.id);
    Provider.of<KanjiProvider>(context, listen: false).loadKanjiExamples(kanji.id);
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => KanjiDetailScreen(kanji: kanji,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        title: const Text('All Kanji'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            N5KanjiSection(onKanjiTap: (kanji) => _navigateToKanjiDetailPage(context, kanji),),
            N4KanjiSection(onKanjiTap: (kanji) => _navigateToKanjiDetailPage(context, kanji),),
            N3KanjiSection(onKanjiTap: (kanji) => _navigateToKanjiDetailPage(context, kanji),),
          ],
        ),
      ),
    );
  }
}
