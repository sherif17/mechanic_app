import 'package:flutter/material.dart';

import 'home_body.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: HomeBody(),
    );
  }
}
