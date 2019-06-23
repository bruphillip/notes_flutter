import 'package:notes/models/NoteEntity.dart';
import 'package:notes/redux/middleware/middleware.dart';
import 'package:notes/redux/reducers/note.reducers.dart';
import 'package:notes/redux/store/app.store.dart';
import 'package:redux/redux.dart';

Store<NoteState> createStore(List<NoteEntity> notes) => Store<NoteState>(
      combineReducer,
      initialState: NoteState(notes),
      middleware: combineMiddleware,
    );
