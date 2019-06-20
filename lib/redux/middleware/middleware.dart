import 'package:notes/models/NoteEntity.dart';
import 'package:notes/redux/actions/note.action.dart';
import 'package:notes/redux/store/app.store.dart';
import 'package:notes/schemas/note.schema.dart';
import 'package:redux/redux.dart';

final List<Middleware<NoteState>> combineMiddleware = [
  TypedMiddleware<NoteState, NoteState>(initialState),
  TypedMiddleware<NoteState, AddNoteAction>(addMiddleware),
  TypedMiddleware<NoteState, UpdateNoteAction>(midFunction),
];

void initialState(Store<NoteState> store, action, NextDispatcher next) {
  print('WTF???');
  print('Store: ${store.state}');
  print('Action??: $action');
  print('End');
}

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

midFunction(Store<NoteState> store, action, NextDispatcher next) async {
  print('Heello!! store: $store');

  print('Hellou action! : $action');

  await Future.delayed(Duration(seconds: 1), () {
    print('awaiting');
  });

  print('finished');

  next(action);
}
