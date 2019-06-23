import 'package:notes/models/NoteEntity.dart';

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

class FetchNotesAction {
  final List<NoteEntity> items;
  FetchNotesAction({this.items});
}

class ByModifiedAction {}

class ByCreatedAction {}

class ByAzAction {}

class ByZaAction {}
