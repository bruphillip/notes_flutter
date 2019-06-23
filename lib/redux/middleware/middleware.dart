import 'package:notes/models/NoteEntity.dart';
import 'package:notes/redux/actions/note.action.dart';
import 'package:notes/redux/store/app.store.dart';
import 'package:notes/schemas/note.schema.dart';
import 'package:redux/redux.dart';

final List<Middleware<NoteState>> combineMiddleware = [
  TypedMiddleware<NoteState, FetchNotesAction>(fetchNotesMiddleware),
  TypedMiddleware<NoteState, AddNoteAction>(addMiddleware),
  TypedMiddleware<NoteState, UpdateNoteAction>(updateMiddleware),
  TypedMiddleware<NoteState, RemoveNoteAction>(deleteMiddleware),
];

void addMiddleware(
    Store<NoteState> store, AddNoteAction action, NextDispatcher next) async {
  print('Add Middleware');
  NoteSchema schema = NoteSchema();
  action.item.isNew = false;
  action.item.createdAt = DateTime.now();
  action.item.updatedAt = DateTime.now();
  NoteEntity note = await schema.save(action.item);
  next(AddNoteAction(note));
}

void updateMiddleware(Store<NoteState> store, UpdateNoteAction action,
    NextDispatcher next) async {
  print('Update Middleware');

  NoteSchema schema = NoteSchema();
  action.item.updatedAt = DateTime.now();

  await schema.update(action.item);

  next(action);
}

void deleteMiddleware(Store<NoteState> store, RemoveNoteAction action,
    NextDispatcher next) async {
  print('Delete Middleware');

  NoteSchema schema = NoteSchema();
  await schema.delete(action.index);

  next(action);
}

void fetchNotesMiddleware(Store<NoteState> store, FetchNotesAction action,
    NextDispatcher next) async {
  print('hey there!');
  NoteSchema schema = NoteSchema();
  var items = await schema.getAll();
  next(FetchNotesAction(items: items));
}
