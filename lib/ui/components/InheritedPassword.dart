import 'package:flutter/material.dart';

class InhreritedPassword extends InheritedWidget {
  InhreritedPassword({Key key, this.child, this.onSubmmitPassword})
      : super(key: key, child: child);

  final Function onSubmmitPassword;

  final Widget child;

  static InhreritedPassword of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(InhreritedPassword)
        as InhreritedPassword);
  }

  @override
  bool updateShouldNotify(InhreritedPassword oldWidget) {
    return true;
  }
}
