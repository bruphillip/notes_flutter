import 'package:notes/models/NoteEntity.dart';

class NoteState {
  final List<NoteEntity> notes;
  NoteState(this.notes);

  factory NoteState.initial() {
    return NoteState(List());
  }
}
