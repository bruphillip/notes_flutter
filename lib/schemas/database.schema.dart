import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String dbName = 'notes';

const String dbId = 'id';

const String dbTitle = 'title';

const String dbContent = 'content';

const String dbPassword = 'password';

const String dbCreatedAt = 'createdAt';

const String dbUpdatedAt = 'updatedAt';

const String dbIsLocked = 'isLocked';

class DatabaseSchema {
  static final DatabaseSchema _instance = DatabaseSchema._();
  factory DatabaseSchema() => _instance;
  DatabaseSchema._();

  static Database _db;

  final bool shouldDrop = false;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> _initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'note-dev.db');

    return await openDatabase(path,
        version: 1, onCreate: _onCreate, onOpen: _onSelectQuery);
  }

  _onSelectQuery(Database db) {
    if (this.shouldDrop) {
      this._onDrop(db);
    } else {
      this._onCreate(db, 1);
    }
  }

  FutureOr<void> _onDrop(Database db) async {
    await db.execute('DROP TABLE IF EXISTS $dbName');
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE IF NOT EXISTS $dbName (' +
          '$dbId INTEGER PRIMARY KEY AUTOINCREMENT,' +
          '$dbTitle TEXT,' +
          '$dbContent TEXT,' +
          '$dbCreatedAt INT,' +
          '$dbUpdatedAt INT,' +
          '$dbIsLocked INT,' +
          '$dbPassword TEXT' +
          ')',
    );
  }
}
