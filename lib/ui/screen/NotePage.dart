import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:notes/models/NoteEntity.dart';
import 'package:notes/ui/components/OrderItems.dart';

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
            margin: EdgeInsets.only(right: 10),
            child: Row(
              children: <Widget>[
                Theme(
                  data: ThemeData(
                    cardColor: Colors.black87,
                    iconTheme: IconThemeData(color: Colors.white),
                  ),
                  child: PopupMenuButton(
                    itemBuilder: (context) => popupMenuBuilder(
                          [
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.save,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            Row(children: [
                              Icon(
                                Icons.lock_open,
                                color: Colors.white,
                              ),
                              Text(
                                'Lock',
                                style: TextStyle(color: Colors.white),
                              ),
                            ]),
                            Row(children: [
                              Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              ),
                              Text(
                                'Delete',
                                style: TextStyle(color: Colors.white),
                              ),
                            ]),
                          ],
                        ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  cursorColor: Colors.white,
                  autocorrect: true,
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
          ),
        ],
      ),
    );
  }
}
