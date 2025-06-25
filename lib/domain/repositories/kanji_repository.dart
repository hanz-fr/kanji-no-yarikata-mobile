import '../entities/kanji.dart';

abstract class KanjiRepository {
  Future<void> insertKanji(Kanji kanji);
  Future<List<Kanji>> getAllKanji();
  Future<void> editKanji(Kanji updatedKanji);
  Future<void> deleteKanji(int id);
}