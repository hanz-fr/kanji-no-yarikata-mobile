import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../models/kanji_model.dart';
import '../../domain/entities/kanji.dart';
import '../../domain/repositories/kanji_repository.dart';

class KanjiDatabase implements KanjiRepository {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initKanjiDatabase();
    return _database!;
  }

  Future<Database> _initKanjiDatabase() async {
    final dbName = 'kanji.db';
    final directory = await getApplicationDocumentsDirectory();
    final dbPath = join(directory.path, dbName);

    final exists = await File(dbPath).exists();

    if (!exists) {
      final data = await rootBundle.load('assets/database/kanji.db');
      final bytes = data.buffer.asUint8List();

      await File(dbPath).writeAsBytes(bytes);
    }

    return openDatabase(dbPath);
  }

  @override
  Future<void> deleteKanji(int id) {
    // TODO: implement deleteKanji
    throw UnimplementedError();
  }

  @override
  Future<void> editKanji(Kanji updatedKanji) {
    // TODO: implement editKanji
    throw UnimplementedError();
  }

  @override
  Future<List<Kanji>> getAllKanji() async {
    final db = await database;
    final mappedKanji = await db.query('kanji');

    return List.generate(
      mappedKanji.length,
      (i) => KanjiModel.fromMap(mappedKanji[i]),
    );
  }

  @override
  Future<void> insertKanji(Kanji kanji) {
    // TODO: implement insertKanji
    throw UnimplementedError();
  }
}
