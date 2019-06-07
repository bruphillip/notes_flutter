import 'package:flutter/material.dart';
import 'package:notes/models/NoteEntity.dart';
import 'package:notes/ui/components/NoteCard.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List notes = List<NoteEntity>();
    notes.add(new NoteEntity(
        id: 1,
        title: 'Apocalyptica',
        content: 'I have listen to apocalyptica'));

    notes.add(new NoteEntity(
        id: 1,
        title: 'Stratovarius',
        content: 'Stratovarius also is good band'));

    return Expanded(
      child: ListView(
        children: <Widget>[
          NoteCard(
            note: notes[0],
          ),
          NoteCard(
            note: notes[1],
          ),
          NoteCard(
            note: notes[0],
          ),
        ],
      ),
    );
  }
}
