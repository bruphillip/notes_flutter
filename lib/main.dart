import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/redux/store.dart';
import 'package:notes/ui/screen/Home.dart';
import 'package:notes/ui/screen/NotePage.dart';

void main() async {
  runApp(StoreProvider(
    store: await createStore(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/NotePage': (BuildContext context) => NotePage(),
      },
    ),
  ));
}
