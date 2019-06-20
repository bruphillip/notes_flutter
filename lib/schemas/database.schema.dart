import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String dbName = 'notes';

const String dbId = 'id';

const String dbTitle = 'title';

const String dbContent = 'content';

const String dbCreatedAt = 'createdAt';

const String dbUpdatedAt = 'updatedAt';

const String dbIsLocked = 'isLocked';

class DatabaseSchema {
  static final DatabaseSchema _instance = DatabaseSchema._();
  factory DatabaseSchema() => _instance;
  DatabaseSchema._();

  static Database _db;

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

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $dbName (' +
          '$dbId INTEGER PRIMARY KEY AUTOINCREMENT,' +
          '$dbTitle TEXT,' +
          '$dbContent TEXT,' +
          '$dbCreatedAt INT,' +
          '$dbUpdatedAt INT,' +
          '$dbIsLocked INT' +
          ')',
    );
  }
}
