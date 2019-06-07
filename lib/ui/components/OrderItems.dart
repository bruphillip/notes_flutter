import 'package:flutter/material.dart';

class OrderItems extends StatelessWidget {
  final popUp = List<PopupMenuEntry<dynamic>>()
    ..add(PopupMenuItem(
      child: Text('by modified time'),
    ))
    ..add(PopupMenuItem(
      child: Text('by created time'),
    ))
    ..add(PopupMenuItem(
      child: Text('A-Z'),
    ))
    ..add(PopupMenuItem(
      child: Text('Z-A'),
    ));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      color: Colors.deepPurple[400],
      child: FlatButton(
          onPressed: () {},
          child: PopupMenuButton(
            tooltip: 'Sort by modified time',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Sort by modified time',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
            itemBuilder: (context) {
              return popUp;
            },
          )),
    );
  }
}
