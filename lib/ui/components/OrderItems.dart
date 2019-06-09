import 'package:flutter/material.dart';

class OrderItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      color: Colors.deepPurple[400],
      child: FlatButton(
          onPressed: () {},
          child: Theme(
            data: ThemeData(cardColor: Colors.black87),
            child: PopupMenuButton(
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
                return popupMenuBuilder(
                  [
                    Text(
                      'by modified time',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'by created time',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'A-Z',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Z-A',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                );
              },
            ),
          )),
    );
  }
}

List<PopupMenuEntry<dynamic>> popupMenuBuilder(List<Widget> items) {
  List<PopupMenuEntry<dynamic>> popUp = List();

  for (Widget item in items) {
    popUp.add(PopupMenuItem(
      child: item,
    ));
  }

  return popUp;
}
