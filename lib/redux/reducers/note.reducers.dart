import 'package:notes/models/NoteEntity.dart';
import 'package:notes/redux/actions/note.action.dart';
import 'package:notes/redux/store/app.store.dart';
import 'package:redux/redux.dart';

final combineReducer = combineReducers<NoteState>([
  TypedReducer<NoteState, AddNoteAction>(_noteAddReducer),
  TypedReducer<NoteState, RemoveNoteAction>(_noteRemoveReducer),
  TypedReducer<NoteState, UpdateNoteAction>(_updateNoteReducer),
]);

NoteState _noteAddReducer(NoteState state, AddNoteAction action) {
  return NoteState(List.from(state.notes)..add(action.item));
}

NoteState _noteRemoveReducer(NoteState state, RemoveNoteAction action) {
  return NoteState(List.from(state.notes)..removeAt(action.index));
}

NoteState _updateNoteReducer(NoteState state, UpdateNoteAction action) {
  return NoteState(List<NoteEntity>.from(state.notes)
      .map((note) => note.id == action.item.id ? action.item : note)
      .toList());
}
