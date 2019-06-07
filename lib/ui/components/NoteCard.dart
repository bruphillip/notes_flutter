import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/models/NoteEntity.dart';
import 'package:notes/ui/screen/NotePage.dart';

class NoteCard extends StatelessWidget {
  final NoteEntity note;

  NoteCard({this.note}) : assert(note != null);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.purpleAccent,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) {
                  return NotePage(
                    note: note,
                  );
                },
                settings: RouteSettings(name: '/NoteCard')));
      },
      padding: EdgeInsets.all(0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(width: 0.1),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple[900],
            )
          ],
          color: Colors.deepPurple,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              this.note.title,
              style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              this.note.createdAt.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w100),
            ),
          ],
        ),
      ),
    );
  }
}
