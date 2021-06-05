import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class center extends StatefulWidget {
  @override
  _centerState createState() => _centerState();
}

class _centerState extends State<center> {
  @override
  Widget build(BuildContext context) {
    String Mechname = 'Ahmed Mohamed';
    String Centername = 'borg';
    final titles = ["List 1", "List 2", "List 3"];
    DateTime now = DateTime.now();
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 380.0,
              height: 50.0,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: Text(
                      'Want To Apply To Center ?',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  RaisedButton(
                    padding: const EdgeInsets.all(20),
                    textColor: Colors.blue,
                    color: Colors.blue[50],
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 430.0,
              height: 220.0,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 135,
                          margin: EdgeInsets.only(right: 20),
                          height: 140.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            width: 120.0,
                                            height: 50.0,
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Container(
                                        height: 30.0,
                                        width: 130.0,
                                        color: Colors.yellow,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 0.0),
                                              child: Text(
                                                '$Centername',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 50.0),
                                              child: Container(
                                                width: 30.0,
                                                height: 10.0,
                                                color: Colors.red,
                                                child: Text(
                                                  'stars',
                                                  style: TextStyle(
                                                    fontSize: 5.0,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Container(
                                        height: 30.0,
                                        width: 125.0,
                                        color: Colors.black,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 0.0, left: 70.0),
                                          child: RaisedButton(
                                            padding: const EdgeInsets.all(10),
                                            textColor: Colors.blue,
                                            color: Colors.blue[50],
                                            onPressed: () {},
                                            child: Text(
                                              'Join',
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 135,
                          margin: EdgeInsets.only(right: 20),
                          height: 140.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            width: 120.0,
                                            height: 50.0,
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Container(
                                        height: 30.0,
                                        width: 130.0,
                                        color: Colors.yellow,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 0.0),
                                              child: Text(
                                                '$Centername',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 50.0),
                                              child: Container(
                                                width: 30.0,
                                                height: 10.0,
                                                color: Colors.red,
                                                child: Text(
                                                  'stars',
                                                  style: TextStyle(
                                                    fontSize: 5.0,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Container(
                                        height: 30.0,
                                        width: 125.0,
                                        color: Colors.black,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 0.0, left: 70.0),
                                          child: RaisedButton(
                                            padding: const EdgeInsets.all(10),
                                            textColor: Colors.blue,
                                            color: Colors.blue[50],
                                            onPressed: () {},
                                            child: Text(
                                              'Join',
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 135,
                          margin: EdgeInsets.only(right: 20),
                          height: 140.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            width: 120.0,
                                            height: 50.0,
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Container(
                                        height: 30.0,
                                        width: 130.0,
                                        color: Colors.yellow,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 0.0),
                                              child: Text(
                                                '$Centername',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 50.0),
                                              child: Container(
                                                width: 30.0,
                                                height: 10.0,
                                                color: Colors.red,
                                                child: Text(
                                                  'stars',
                                                  style: TextStyle(
                                                    fontSize: 5.0,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Container(
                                        height: 30.0,
                                        width: 125.0,
                                        color: Colors.black,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 0.0, left: 70.0),
                                          child: RaisedButton(
                                            padding: const EdgeInsets.all(10),
                                            textColor: Colors.blue,
                                            color: Colors.blue[50],
                                            onPressed: () {},
                                            child: Text(
                                              'Join',
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 430.0,
              height: 70.0,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(left: 320.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 100, height: 100),
                  child: ElevatedButton(
                    child: Text(
                      'Join Center\nUsing Code',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
