import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/models/NoteEntity.dart';
import 'package:notes/redux/actions/note.action.dart';
import 'package:notes/redux/store/app.store.dart';
import 'package:notes/ui/components/CreationNote.dart';
import 'package:notes/ui/components/InheritedPassword.dart';
import 'package:notes/ui/components/OrderItems.dart';
import 'package:notes/ui/components/Password.dart';

class NotePage extends StatefulWidget {
  static const routeName = '/NotePage';

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  NoteEntity note = NoteEntity();
  TextEditingController _titleValue = TextEditingController();
  bool _isEdditing = false;

  @override
  void initState() {
    super.initState();
  }

  void _handleInitializing() {
    if (this.note.isNew) {
      this.setState(() {
        this._isEdditing = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    this.note = ModalRoute.of(context).settings.arguments;
    _handleInitializing();
    return StoreConnector<NoteState, Function>(
        converter: (store) => store.dispatch,
        builder: (context, callback) {
          return Scaffold(
            backgroundColor: Colors.deepPurpleAccent,
            appBar: AppBar(
              title:
                  this._isEdditing ? cupertinoInput() : Text(this.note.title),
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
                        child: PopupMenuButton<ValueKey>(
                          onSelected: (ValueKey item) {
                            if (item.value == Type.save.toString())
                              return _handleSave(callback);

                            if (item.value == Type.delete.toString()) {
                              return _handleDelete(callback);
                            }

                            if (item.value == Type.lock.toString()) {
                              return _handleLock(callback);
                            }
                            if (item.value == Type.edit.toString())
                              return this.setState(() {
                                this._titleValue.text = this.note.title;
                                this._isEdditing = true;
                              });

                            return;
                          },
                          itemBuilder: (context) =>
                              popupMenuBuilder(popUpButtom),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            body: CreationNote(
              content: this.note.content,
              handleUpdateNoteContent: _handleUpdateNoteContent,
            ),
          );
        });
  }

  Widget cupertinoInput() {
    return CupertinoTextField(
      controller: _titleValue,
      placeholder: 'Type your title here',
      placeholderStyle: TextStyle(color: Colors.white),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(3))),
      maxLines: 1,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: Colors.white,
      style: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
    );
  }

  void _handleSave(Function callback) {
    if (this._isEdditing) {
      this.note.title = this._titleValue.text;
    }
    if (this.note.isNew) {
      callback(AddNoteAction(this.note));
    } else {
      callback(UpdateNoteAction(this.note));
    }
    this._isEdditing = false;
  }

  void _handleUpdateNoteContent(String value) {
    note.content = value;
  }

  void _handleLock(Function callback) {
    showDialog(
        context: context,
        builder: (context) {
          return InhreritedPassword(
              onSubmmitPassword: _onSubmmitPassword, child: Password());
        });
  }

  void _onSubmmitPassword(String password) {
    this.note.password = password;
  }

  void _handleDelete(Function callback) {
    Navigator.of(context).pop();
    callback(RemoveNoteAction(this.note.id));
  }
}

enum Type { save, lock, edit, delete }

final popUpButtom = [
  Row(
    key: Key(Type.save.toString()),
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
  Row(key: Key(Type.edit.toString()), children: [
    Icon(
      Icons.edit,
      color: Colors.white,
    ),
    Text(
      'Edit',
      style: TextStyle(color: Colors.white),
    ),
  ]),
  Row(key: Key(Type.lock.toString()), children: [
    Icon(
      Icons.lock_open,
      color: Colors.white,
    ),
    Text(
      'Lock',
      style: TextStyle(color: Colors.white),
    ),
  ]),
  Row(key: Key(Type.delete.toString()), children: [
    Icon(
      Icons.delete_outline,
      color: Colors.white,
    ),
    Text(
      'Delete',
      style: TextStyle(color: Colors.white),
    ),
  ]),
];
