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
  Future<List<Kanji>> getAllKanji() async {
    final db = await database;
    final mappedKanji = await db.query('Kanji',);

    return List.generate(
      mappedKanji.length,
      (i) => KanjiModel.fromMap(mappedKanji[i]),
    );
  }

  @override
  Future<List<Kanji>> getN5Kanji() async {
    final db = await database;
    final mappedN5Kanji = await db.query(
      'Kanji',
      where: 'jlpt = ?',
      whereArgs: ['N5'],
    );

    return List.generate(
      mappedN5Kanji.length,
      (i) => KanjiModel.fromMap(mappedN5Kanji[i]),
    );
  }

  @override
  Future<List<Kanji>> getN4Kanji() async {
    final db = await database;
    final mappedN4Kanji = await db.query(
      'Kanji',
      where: 'jlpt = ?',
      whereArgs: ['N4'],
    );

    return List.generate(
      mappedN4Kanji.length,
      (i) => KanjiModel.fromMap(mappedN4Kanji[i]),
    );
  }

  @override
  Future<List<Kanji>> getN3Kanji() async {
    final db = await database;
    final mappedN3Kanji = await db.query(
      'Kanji',
      where: 'jlpt = ?',
      whereArgs: ['N3'],
    );

    return List.generate(
      mappedN3Kanji.length,
      (i) => KanjiModel.fromMap(mappedN3Kanji[i]),
    );
  }
}
