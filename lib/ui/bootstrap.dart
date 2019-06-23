import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/redux/store.dart';
import 'package:notes/redux/store/app.store.dart';
import 'package:notes/schemas/note.schema.dart';
import 'package:notes/ui/screen/Home.dart';
import 'package:notes/ui/screen/NotePage.dart';

Future<Widget> boostrap() async {
  NoteSchema schema = NoteSchema();
  var notes = await schema.getAll();

  return StoreProvider<NoteState>(
    store: createStore(notes),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      home: Home(),
      initialRoute: '/Home',
      routes: <String, WidgetBuilder>{
        '/NotePage': (BuildContext context) => NotePage(),
        '/Home': (BuildContext context) => Home(),
      },
    ),
  );
}
