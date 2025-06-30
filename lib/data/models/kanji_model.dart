import '../../domain/entities/kanji.dart';

class KanjiModel extends Kanji {
  KanjiModel({
    required super.id,
    required super.kanji,
    required super.meaning,
    required super.jlpt,
    required super.grade,
    required super.strokeCount,
    required super.onyomi,
    required super.onyomiRomaji,
    required super.kunyomi,
    required super.kunyomiRomaji,
    required super.radical,
    required super.radicalNumber,
    required super.frequency,
    required super.joyoListStatus,
    required super.mnemonic,
    required super.svg,
  });

  factory KanjiModel.fromMap(Map<String, dynamic> map) {
    return KanjiModel(
      id: map['id'],
      kanji: map['kanji'],
      meaning: map['meaning'],
      jlpt: map['jlpt'],
      grade: map['grade'],
      strokeCount: map['strokeCount'],
      onyomi: map['onyomi'],
      onyomiRomaji: map['onyomiRomaji'],
      kunyomi: map['kunyomi'],
      kunyomiRomaji: map['kunyomiRomaji'],
      radical: map['radical'],
      radicalNumber: map['radicalNumber'],
      frequency: map['frequency'],
      joyoListStatus: map['joyoListStatus'],
      mnemonic: map['mnemonic'],
      svg: map['svg'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kanji': kanji,
      'meaning': meaning,
      'jlpt': jlpt,
      'grade': grade,
      'strokeCount': strokeCount,
      'onyomi': onyomi,
      'onyomiRomaji': onyomiRomaji,
      'kunyomi': kunyomi,
      'kunyomiRomaji': kunyomiRomaji,
      'radical': radical,
      'radicalNumber': radicalNumber,
      'frequency': frequency,
      'joyoListStatus': joyoListStatus,
      'mnemonic': mnemonic,
      'svg': svg,
    };
  }
}

class KanjiComponentsModel extends KanjiComponents {
  KanjiComponentsModel({
    required super.id,
    required super.kanjiId,
    required super.component,
  });
}
