import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_app/provider/appControlProvider.dart';
import 'package:provider/provider.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _enabled = false;
  @override
  Widget build(BuildContext context) {
    var _onpressed;
    if (Provider.of<AppControlProvider>(context).completeServiceButtonEnabled) {
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
           color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
    );
  }
}
