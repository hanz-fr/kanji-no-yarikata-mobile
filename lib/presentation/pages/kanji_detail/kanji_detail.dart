import 'package:flutter/material.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/kanji_detail/examples.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/kanji_detail/header.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/kanji_detail/main_information.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/kanji_detail/onyomi_kunyomi.dart';

import '../../../domain/entities/kanji.dart';

class KanjiDetailScreen extends StatelessWidget {
  const KanjiDetailScreen({
    super.key,
    required this.kanji
  });

  final Kanji kanji;

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                kanji.kanji,
                style: TextStyle(
                  fontSize: 40
                ),
              ),
              Text(kanji.meaning),
              Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Color.fromRGBO(227, 227, 227, 1),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.volume_up_outlined)
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Color.fromRGBO(227, 227, 227, 1),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.draw_outlined)
                  )
                ],
              ),
              KanjiHeader(),
              OnyomiKunyomiContainer(),
              MainInformationContainer(),
              KanjiExamplesContainer(),
            ],
          ),
        ),
      ),
    );
  }
}