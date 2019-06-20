import 'package:notes/schemas/database.schema.dart';

class NoteEntity {
  int id;

  String title;

  String content;

  bool isLocked;

  DateTime createdAt;

  DateTime updatedAt;

  bool isNew = false;

  NoteEntity(
      {this.id,
      this.title = '',
      this.content = '',
      this.isLocked = false,
      this.createdAt,
      this.updatedAt,
      this.isNew});

  copyFrom({id, title, content, isLocked, createdAt, updatedAt}) => NoteEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isLocked: isLocked ?? this.isLocked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);

  NoteEntity.fromMap(Map map) {
    this.id = map[dbId];
    this.title = map[dbTitle];
    this.content = map[dbContent];
    this.isLocked = map[dbIsLocked] == 1 ? true : false;
    this.createdAt = DateTime.fromMicrosecondsSinceEpoch(map[dbCreatedAt]);
    this.updatedAt = DateTime.fromMicrosecondsSinceEpoch(map[dbUpdatedAt]);
  }

  toMap() {
    return {
      '$dbId': this.id,
      '$dbTitle': this.title,
      '$dbContent': this.content,
      '$dbIsLocked': this.isLocked == true ? 1 : 0,
      '$dbCreatedAt': this.createdAt.microsecondsSinceEpoch,
      '$dbUpdatedAt': this.updatedAt.microsecondsSinceEpoch,
    };
  }

  @override
  String toString() {
    return '{ id: $id, title: $title, content: $content, isLocked: $isLocked, isNew?: $isNew }';
  }
}
