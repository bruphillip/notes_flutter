import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:notes/models/NoteEntity.dart';
import 'package:notes/ui/components/Password.dart';

import 'InheritedPassword.dart';

class NoteCard extends StatefulWidget {
  final NoteEntity note;

  NoteCard({this.note}) : assert(note != null);

  @override
  _NoteCardState createState() => _NoteCardState(note: note);
}

class _NoteCardState extends State<NoteCard> {
  _NoteCardState({this.note});
  final NoteEntity note;
  bool _isValidPassword;

  void _onSubmmitPassword(String password) {
    if (password == this.widget.note.password)
      _isValidPassword = true;
    else
      _isValidPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.purpleAccent,
      onPressed: () async {
        if (this.widget.note.password != null) {
          await showDialog(
              context: context,
              builder: (context) {
                return InhreritedPassword(
                    onSubmmitPassword: _onSubmmitPassword, child: Password());
              });
          if (_isValidPassword == null)
            return;
          else if (_isValidPassword) {
            Navigator.of(context)
                .pushNamed('/NotePage', arguments: this.widget.note);
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.black54,
              duration: Duration(seconds: 2),
              content: Container(
                child: Text('Invalid password :('),
              ),
            ));
          }
        } else {
          Navigator.of(context)
              .pushNamed('/NotePage', arguments: this.widget.note);
        }
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
              this.widget.note.title,
              style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              _dateFormmater(this.widget.note.updatedAt),
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

  String _dateFormmater(DateTime date) {
    var formatter = new DateFormat('yMMMd');
    return formatter.format(date);
  }
}
