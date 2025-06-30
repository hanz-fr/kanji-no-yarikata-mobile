class Kanji {
  final String id;
  final String kanji;
  final String meaning;
  final String jlpt;
  final int grade;
  final int strokeCount;
  final String onyomi;
  final String onyomiRomaji;
  final String kunyomi;
  final String kunyomiRomaji;
  final String radical;
  final int radicalNumber;
  final String frequency;
  final String joyoListStatus;
  final String mnemonic;
  final String svg;

  const Kanji({
    required this.id,
    required this.kanji,
    required this.meaning,
    required this.jlpt,
    required this.grade,
    required this.strokeCount,
    required this.onyomi,
    required this.onyomiRomaji,
    required this.kunyomi,
    required this.kunyomiRomaji,
    required this.radical,
    required this.radicalNumber,
    required this.frequency,
    required this.joyoListStatus,
    required this.mnemonic,
    required this.svg,
  });
}

class KanjiComponents {
  final String id;
  final String kanjiId;
  final String component;


  const KanjiComponents({
    required this.id,
    required this.kanjiId,
    required this.component
  });
}