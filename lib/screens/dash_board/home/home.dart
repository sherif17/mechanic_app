import 'package:flutter/material.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/acceptted_service/accepted_service_map.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/jomana_files/sarting_mechanic_service.dart';

import 'package:mechanic_app/screens/dash_board/home/home_body.dart';

class Home extends StatefulWidget {
  static String routeName = '/Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /*appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                    "Welcome user,",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.notifications_rounded,
                  color: Colors.redAccent,
                  size: 30,
                ),
              )
            ],
          ),
          centerTitle: false,
        ),*/
        body:
            //AcceptedServiceScreen(),
            //HomeBody(),
            HomeBody(),
      ),
    );
  }
}
