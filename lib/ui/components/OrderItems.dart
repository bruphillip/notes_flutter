import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/redux/actions/note.action.dart';
import 'package:notes/redux/store/app.store.dart';

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
            child: StoreConnector<NoteState, Function>(
              converter: (store) => store.dispatch,
              builder: (context, callback) {
                return PopupMenuButton<ValueKey>(
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
                  onSelected: (ValueKey key) {
                    if (key.value == FilterBy.byCreated.toString()) {
                      StoreProvider.of<NoteState>(context)
                          .dispatch(ByCreatedAction());
                    }
                    if (key.value == FilterBy.byModified.toString()) {
                      StoreProvider.of<NoteState>(context)
                          .dispatch(ByModifiedAction());
                    }
                    if (key.value == FilterBy.Az.toString()) {
                      StoreProvider.of<NoteState>(context)
                          .dispatch(ByAzAction());
                    }
                    if (key.value == FilterBy.Za.toString()) {
                      StoreProvider.of<NoteState>(context)
                          .dispatch(ByZaAction());
                    }
                  },
                  itemBuilder: (context) {
                    return popupMenuBuilder(
                      [
                        Text(
                          'by modified time',
                          key: Key(FilterBy.byModified.toString()),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'by created time',
                          key: Key(FilterBy.byCreated.toString()),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'A-Z',
                          key: Key(FilterBy.Az.toString()),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Z-A',
                          key: Key(FilterBy.Za.toString()),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )),
    );
  }
}

enum FilterBy {
  byModified,
  byCreated,
  Az,
  Za,
}

List<PopupMenuEntry<dynamic>> popupMenuBuilder(List<Widget> items) {
  List<PopupMenuEntry<ValueKey<String>>> popUp = List();
  for (Widget item in items) {
    popUp.add(PopupMenuItem(
      value: item.key,
      child: item,
    ));
  }

  return popUp;
}
