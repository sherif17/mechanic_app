import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:mechanic_app/provider/appControlProvider.dart';
import 'package:mechanic_app/provider/maps_prepration/maps_provider.dart';
import 'package:mechanic_app/provider/maps_prepration/polyLineProvider.dart';
import 'package:mechanic_app/screens/dash_board/home/home_body.dart';
import 'package:provider/provider.dart';

import 'home_map.dart';

class HomeHeader extends StatefulWidget {

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String mechanicName = "Sherif Ahmed";

    return Consumer<AppControlProvider>(
    builder: (context, val,
    child) =>
    Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0, top: 25.0),
        child: Container(
          width: 500.0,
          height: 157.0,
          color: Theme.of(context).primaryColorLight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              LinearProgressIndicator(
                backgroundColor: (val.mechanicState == true)
                    ? Colors.white
                    : Theme.of(context).primaryColorLight,
                color: (val.mechanicState == true)
                    ? Colors.greenAccent
                    : Theme.of(context).primaryColorLight,
              ),
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
                      (val.currentPage == "Main")?
                      GestureDetector(
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Theme.of(context).accentColor,
                          backgroundImage: AssetImage("assets/icons/map-icon-white-21.jpg"),
                        ),
                        onTap: () {
                          val.updateCurrentPage("Map");
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeMap.routeName,
                                  (route) => false);
                        },
                      ):
                      GestureDetector(
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Theme.of(context).accentColor,
                          backgroundImage: AssetImage("assets/icons/3425038.png"),
                        ),
                        onTap: () {
                           val.updateCurrentPage("Main");
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeBody.routeName,
                                  (route) => false);
                        },
                      ),
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
                          val.updateMechanicState(state);
                          print('Current State of SWITCH IS: $state');
                        },
                      ),
                      Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
