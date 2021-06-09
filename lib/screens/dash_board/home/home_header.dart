import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HomeHeader extends StatefulWidget {

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String mechanicName = "Sherif Ahmed";
    return  Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0, top: 25.0),
        child: Container(
          width: 500.0,
          height: 153.0,
          color: Theme.of(context).primaryColorLight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 290.0,left: 8.0),
                        child: Text(
                          '${now.day}/${now.month}/${now.year} ',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                          'Hey, $mechanicName',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      Expanded(child: Container()),
                      CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Theme.of(context).accentColor,
                          backgroundImage: AssetImage("assets/icons/profile.png"),
                        ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      LiteRollingSwitch(
                        //initial value
                        value: true,
                        textOn: 'Online',
                        textOff: 'Offline',
                        colorOn: Colors.greenAccent[700],
                        colorOff: Colors.redAccent[700],
                        iconOn: Icons.done,
                        iconOff: Icons.remove_circle_outline,
                        textSize: 16.0,
                        onChanged: (bool state) {
                          //Use it to manage the different states
                          print('Current State of SWITCH IS: $state');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
