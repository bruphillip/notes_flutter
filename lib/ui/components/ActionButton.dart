import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData icon;

  ActionButton({this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.deepPurpleAccent,
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(icon),
      ),
    );
  }
}
