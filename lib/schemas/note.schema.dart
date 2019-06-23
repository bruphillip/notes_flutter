import 'package:notes/models/NoteEntity.dart';
import 'package:notes/schemas/database.schema.dart';

class NoteSchema {
  DatabaseSchema dbSchema = DatabaseSchema();

  Future<NoteEntity> get(int id) async {
    var db = await dbSchema.db;

    List<Map> maps = await db.query(
      dbName,
      columns: [dbId, dbTitle, dbContent, dbPassword, dbCreatedAt, dbUpdatedAt],
      where: '$dbId = ?',
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return NoteEntity.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<NoteEntity>> getAll() async {
    var db = await dbSchema.db;

    // await db.rawDelete('DELETE FROM $dbName');

    List<Map> maps = await db.rawQuery('SELECT * FROM $dbName');

    List<NoteEntity> notes = List();

    for (var map in maps) {
      NoteEntity note = NoteEntity.fromMap(map);
      notes.add(note);
    }

    return notes;
  }

  Future<NoteEntity> save(NoteEntity note) async {
    var db = await dbSchema.db;

    note.id = await db.insert(dbName, note.toMap());
    return note;
  }

  Future<int> update(NoteEntity note) async {
    var db = await dbSchema.db;

    return await db
        .update(dbName, note.toMap(), where: '$dbId = ?', whereArgs: [note.id]);
  }

  Future<int> delete(int id) async {
    var db = await dbSchema.db;
    return await db.delete(dbName, where: '$dbId = ?', whereArgs: [id]);
  }
}
