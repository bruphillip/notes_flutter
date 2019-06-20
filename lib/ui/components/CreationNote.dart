import 'package:flutter/material.dart';

class CreationNote extends StatefulWidget {
  final Function handleUpdateNoteContent;
  final String content;

  CreationNote({this.handleUpdateNoteContent, @required this.content})
      : assert(content != null);

  @override
  _CreationNoteState createState() => _CreationNoteState();
}

class _CreationNoteState extends State<CreationNote> {
  TextEditingController contentEditting = TextEditingController();

  @override
  void initState() {
    contentEditting.text = widget.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
                keyboardType: TextInputType.multiline,
                onChanged: widget.handleUpdateNoteContent,
                maxLines: null,
                cursorColor: Colors.white,
                autocorrect: true,
                controller: this.contentEditting,
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
                        borderRadius: BorderRadius.zero,
                        borderSide:
                            const BorderSide(color: Colors.transparent)))),
          ),
        ),
      ],
    );
  }
}
