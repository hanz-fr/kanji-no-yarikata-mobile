import 'package:flutter/material.dart';
import '../domain/entities/kanji.dart';
import '../domain/repositories/kanji_repository.dart';

class KanjiProvider extends ChangeNotifier {
  final KanjiRepository repository;

  KanjiProvider({required this.repository});

  List<Kanji> kanji = [];

  Future<void> loadKanji() async {
    kanji = await repository.getAllKanji();
    notifyListeners();
  }

  Future<void> insertKanji(Kanji kanji) async {
    await repository.insertKanji(kanji);
    await loadKanji();
  }

  Future<void> editKanji(Kanji updatedKanji) async {
    await repository.editKanji(updatedKanji);
    await loadKanji(); 
  }

  Future<void> deleteKanji(int id) async {
    await repository.deleteKanji(id);
    await loadKanji();
  }
}