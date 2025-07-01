import 'package:flutter/material.dart';
import '../domain/entities/kanji.dart';
import '../domain/repositories/kanji_repository.dart';

class KanjiProvider extends ChangeNotifier {
  
  final KanjiRepository repository;

  List<Kanji> n5Kanji = [];
  List<Kanji> n4Kanji = [];
  List<Kanji> n3Kanji = [];
  
  String? components;
  List<KanjiExamples?> examples = [];

  KanjiProvider({required this.repository});

  Future<void> loadAllKanji() async {
    n5Kanji = await repository.getN5Kanji();
    n4Kanji = await repository.getN4Kanji();
    n3Kanji = await repository.getN3Kanji();
    notifyListeners();
  }

  Future<void> loadKanjiComponents(String kanjiId) async {
    components = await repository.getKanjiComponents(kanjiId);
    notifyListeners();
  }

  Future<void> loadKanjiExamples(String kanjiId) async {
    examples = await repository.getKanjiExamples(kanjiId);
    notifyListeners();
  }

  /* Future<void> loadAllKanji() async {
    allKanji = await repository.getAllKanji();
    notifyListeners();
  }

  Future<void> loadAllN5Kanji() async {
    n5Kanji = await repository.getN5Kanji();
    notifyListeners();
  }

  Future<void> loadAllN4Kanji() async {
    n4Kanji = await repository.getN4Kanji();
    notifyListeners();
  }

  Future<void> loadAllN3Kanji() async {
    n3Kanji = await repository.getN3Kanji();
    notifyListeners();
  } */

}