import 'package:flutter/material.dart';
import 'package:notes/ui/components/InheritedPassword.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController _password = TextEditingController();

  bool isObscure = true;
  Function _onSubmmitPassword;

  @override
  Widget build(BuildContext context) {
    this._onSubmmitPassword = InhreritedPassword.of(context).onSubmmitPassword;
    return Theme(
      data: ThemeData(
          textTheme: TextTheme(
              body1: TextStyle(color: Colors.white60),
              subhead: TextStyle(color: Colors.white60),
              title: TextStyle(color: Colors.white60))),
      child: AlertDialog(
        backgroundColor: Color(0xAD000000), // black with ~70% opaccity
        title: Text('Choose your password'),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            splashColor: Colors.deepPurpleAccent,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              width: 100,
              child: Text('Close'),
            ),
          ),
          InkWell(
            onTap: () {
              this._onSubmmitPassword(this._password.text);
              Navigator.of(context).pop();
            },
            splashColor: Colors.deepPurpleAccent,
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                width: 100,
                child: Text('Confirm')),
          ),
        ],
        content: Container(
          height: 150,
          width: 250,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                style: TextStyle(height: 1, fontSize: 18),
                obscureText: this.isObscure,
                controller: _password,
                decoration: InputDecoration(
                  focusedBorder: _borderOpt(),
                  enabledBorder: _borderOpt(),
                  focusColor: Colors.white60,
                  hoverColor: Colors.white60,
                  fillColor: Colors.white60,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white60),
                  suffix: Container(
                    width: 50,
                    child: FlatButton(
                        textColor: Colors.white60,
                        splashColor: Colors.deepPurpleAccent,
                        shape: CircleBorder(),
                        onPressed: () {
                          setState(() {
                            this.isObscure = !this.isObscure;
                          });
                        },
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white60,
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  UnderlineInputBorder _borderOpt() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
      style: BorderStyle.solid,
      color: Colors.white60,
    ));
  }
}
