class NoteEntity {
  int id;

  String title;

  String content;

  DateTime createdAt;

  DateTime updatedAt;

  NoteEntity(
      {this.id, this.title, this.content, this.createdAt, this.updatedAt});
}
