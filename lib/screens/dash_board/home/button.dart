import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button extends StatefulWidget {
  @override
  _buttonState createState() => _buttonState();
}

class _buttonState extends State<button> {
  bool _enabled = false;
  @override
  Widget build(BuildContext context) {
    var _onpressed;
    if (_enabled) {
      _onpressed = () {
        print("tap");
      };
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 30.0),
        child: Container(
          width: 330.0,
          height: 50.0,
          child: RaisedButton(
            child: Text("Complete"),
            onPressed: _onpressed,
            disabledColor: Colors.white,
            disabledElevation: 1,
            disabledTextColor: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
