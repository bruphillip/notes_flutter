import 'package:notes/redux/middleware/middleware.dart';
import 'package:notes/redux/reducers/note.reducers.dart';
import 'package:notes/redux/store/app.store.dart';
import 'package:notes/schemas/note.schema.dart';
import 'package:redux/redux.dart';

Future<Store<NoteState>> createStore() async {
  NoteSchema noteModel = NoteSchema();
  var list = await noteModel.getAll();

  var noteState = NoteState(list);

  return Store<NoteState>(
    combineReducer,
    initialState: noteState,
    middleware: combineMiddleware,
  );
}
