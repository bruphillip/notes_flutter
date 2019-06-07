import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:notes/models/NoteEntity.dart';
import 'package:notes/ui/components/ActionButton.dart';

class NotePage extends StatefulWidget {
  final NoteEntity note;

  NotePage({this.note});
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text(widget.note.title),
        backgroundColor: Colors.black54,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(right: 10, left: 10)),
                ActionButton(onTap: () {}, icon: Icons.save),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: Colors.white,
                autocorrect: true,
                cursorWidth: 2.0,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: 'Type your note here!',
                    hintStyle: TextStyle(color: Colors.white, shadows: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2.0,
                          offset: Offset(1.0, 2.0))
                    ]),
                    enabledBorder: OutlineInputBorder(
                        gapPadding: 0.0,
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.transparent)))),
          ),
        ],
      ),
    );
  }
}
