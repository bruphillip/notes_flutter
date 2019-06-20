import 'package:flutter/material.dart';
import 'package:notes/models/NoteEntity.dart';
import 'package:notes/ui/components/ActionButton.dart';
import 'package:notes/ui/components/NotesContainer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        leading: Center(
          child: ActionButton(onTap: () {}, icon: Icons.format_list_bulleted),
        ),
        backgroundColor: Colors.black54,
        title: Text('Notes'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              children: <Widget>[
                ActionButton(
                    onTap: () {
                      _handleAddNote(context);
                    },
                    icon: Icons.add_to_photos),
                Padding(padding: EdgeInsets.only(right: 10, left: 10)),
                ActionButton(onTap: () {}, icon: Icons.search),
              ],
            ),
          )
        ],
      ),
      body: NotesContainer(),
    );
  }

  _handleAddNote(BuildContext context) {
    var note = NoteEntity(isNew: true);
    Navigator.of(context).pushNamed('/NotePage', arguments: note);
  }
}
