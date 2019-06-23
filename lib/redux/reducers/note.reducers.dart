import 'package:notes/models/NoteEntity.dart';
import 'package:notes/redux/actions/note.action.dart';
import 'package:notes/redux/store/app.store.dart';
import 'package:redux/redux.dart';

final combineReducer = combineReducers<NoteState>([
  TypedReducer<NoteState, FetchNotesAction>(_fetchNotesReducer),
  TypedReducer<NoteState, AddNoteAction>(_noteAddReducer),
  TypedReducer<NoteState, RemoveNoteAction>(_noteRemoveReducer),
  TypedReducer<NoteState, UpdateNoteAction>(_updateNoteReducer),
  TypedReducer<NoteState, ByCreatedAction>(_sortByCreated),
  TypedReducer<NoteState, ByModifiedAction>(_sortByModified),
  TypedReducer<NoteState, ByAzAction>(_sortByAz),
  TypedReducer<NoteState, ByZaAction>(_sortByZa)
]);

NoteState _noteAddReducer(NoteState state, AddNoteAction action) {
  return NoteState(List.from(state.notes)..add(action.item));
}

NoteState _noteRemoveReducer(NoteState state, RemoveNoteAction action) {
  return NoteState(
      List.from(state.notes)..removeWhere((note) => note.id == action.index));
}

NoteState _updateNoteReducer(NoteState state, UpdateNoteAction action) {
  return NoteState(List<NoteEntity>.from(state.notes)
      .map((note) => note.id == action.item.id ? action.item : note)
      .toList());
}

NoteState _fetchNotesReducer(NoteState state, FetchNotesAction action) {
  return NoteState(List.from(action.items));
}

NoteState _sortByModified(NoteState state, ByModifiedAction action) {
  print('Modified Reducer');
  state.notes.sort((a, b) {
    return b.updatedAt.compareTo(a.updatedAt);
  });

  return NoteState(state.notes);
}

NoteState _sortByCreated(NoteState state, ByCreatedAction action) {
  print('Created Reducer');
  state.notes.sort((a, b) {
    return b.createdAt.compareTo(a.createdAt);
  });

  return NoteState(state.notes);
}

NoteState _sortByAz(NoteState state, ByAzAction action) {
  print('Az Reducer');
  state.notes.sort((a, b) {
    return a.title.toLowerCase().compareTo(b.title.toLowerCase());
  });

  return NoteState(state.notes);
}

NoteState _sortByZa(NoteState state, ByZaAction action) {
  print('Za Reducer');
  state.notes.sort((a, b) {
    return b.title.toLowerCase().compareTo(a.title.toLowerCase());
  });

  return NoteState(state.notes);
}
