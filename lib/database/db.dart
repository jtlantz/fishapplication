import 'dart:core';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/fish.dart';
import '../services/api_service.dart';

// SQLite tutorials
// https://www.youtube.com/watch?v=UpKrhZ0Hppk
// https://docs.flutter.dev/cookbook/persistence/sqlite
class DatabaseHelper {

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async{
    if (_database != null) return _database!;
    _database = await _initDB('FISH_DATABASE.db');
    return _database!;
  }

  factory DatabaseHelper() => instance;

  Future<Database> _initDB(String filePath) async{
    final database = openDatabase(
      join(await getDatabasesPath(), filePath),
      onCreate: (db, version) async {
        return await db.execute(
            'CREATE TABLE FISH('
                'id INTEGER PRIMARY KEY AUTOINCREMENT, '
                'thaiName TEXT, '
                'localName TEXT, '
                'enName TEXT, '
                'scienceName TEXT, '
                'familyName TEXT, '
                'description TEXT, '
                'location TEXT)'
        );
      },
      version: 1,
    );
    return database;
  }

}