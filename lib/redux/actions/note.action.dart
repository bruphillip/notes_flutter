import 'package:notes/models/NoteEntity.dart';

enum Actions { AddNoteAction, RemoveNoteAction, UpdateNoteAction }

class AddNoteAction {
  final NoteEntity item;
  AddNoteAction(this.item);
}

class RemoveNoteAction {
  final int index;
  RemoveNoteAction(this.index);
}

class UpdateNoteAction {
  final NoteEntity item;
  UpdateNoteAction(this.item);
}
