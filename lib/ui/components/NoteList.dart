import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/models/NoteEntity.dart';
import 'package:notes/redux/store/app.store.dart';
import 'package:notes/ui/components/NoteCard.dart';

class NotesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoteList();
}

class _NoteList extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StoreConnector<NoteState, NoteState>(
      converter: (store) => store.state,
      builder: (ctx, noteState) {
        return _listNote(noteState.notes);
      },
    ));
  }

  Widget _listNote(List<NoteEntity> notes) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return NoteCard(
          note: notes[index],
        );
      },
      itemCount: notes.length,
    );
  }
}
