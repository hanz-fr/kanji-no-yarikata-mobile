import '../entities/kanji.dart';

abstract class KanjiRepository {
  Future<List<Kanji>> getAllKanji();
  Future<List<Kanji>> getN5Kanji();
  Future<List<Kanji>> getN4Kanji();
  Future<List<Kanji>> getN3Kanji();
}