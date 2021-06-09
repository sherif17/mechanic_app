import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/my_timer.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/service_done_button.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/services_checklist.dart';

class ActionsTab extends StatefulWidget {

  @override
  _ActionsTabState createState() => _ActionsTabState();
}

class _ActionsTabState extends State<ActionsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Time Passed',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 280.0,
                        height: 140.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ServiceTimer(),
                          //timer(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 330.0,
                        height: 425.0,
                        child: Checklist(),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 330.0,
                        height: 100.0,
                        child: Button(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
