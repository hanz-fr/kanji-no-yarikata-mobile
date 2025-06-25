import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/inu_model.dart';
import '../../domain/entities/inu.dart';
import '../../domain/repositories/inu_repository.dart';

class DogDatabase implements DogRepository {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'dog_database.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      } ,
    );
  }

  @override
  Future<void> insertDog(Dog dog) async {
    final db = await database;
    await db.insert(
      'dogs',
      DogModel(id: dog.id, name: dog.name, age: dog.age).toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Dog>> dogs() async {
    final db = await database;
    final maps = await db.query('dogs');

    return List.generate(
      maps.length,
      (i) => DogModel.fromMap(maps[i]),
    );
  }
}
