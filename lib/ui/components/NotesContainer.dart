import 'package:flutter/material.dart';
import 'package:notes/ui/components/NoteList.dart';
import 'package:notes/ui/components/OrderItems.dart';

class NotesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OrderItems(),
        NotesList(),
        // Notes(),
      ],
    );
  }
}
