import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class individual extends StatefulWidget {
  @override
  _individualState createState() => _individualState();
}

class _individualState extends State<individual> {
  String location = 'ash park,pembroke Dock,5a27';
  String locationreq = 'ash park,pembroke Dock,5a27';
  String Mechname = 'Ahmed Mohamed';
  String CarType = 'BMW-200';
  String CarNum = 'XYZ-1234';
  final titles = ["List 1", "List 2", "List 3"];
  List<String> items = ["Oil Exchange", ", Ac Repair"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];
  DateTime now = DateTime.now();
  String Req1 = 'Oil';
  String Req2 = 'Ac';
  String Customername = 'Sherif hany';
  String price1 = '100L.E';
  String price2 = '200L.E';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 440.0,
              height: 120.0,
              color: Colors.lightBlueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Container(
                width: 400.0,
                height: 280.0,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.lightBlueAccent,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                          ),
                          Text(
                            Customername,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            'ETA',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      )),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: Text(
                              'Services ',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              'Fare',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      )),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 100.0),
                            child: Text(
                              'Ac Repair ',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 55.0),
                            child: Text(
                              price1,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 100.0),
                            child: Text(
                              'Oil Exchange',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              price2,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )),
                      Divider(
                        color: Colors.lightBlueAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                            child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_pin,
                              size: 25.0,
                              color: Colors.blue,
                            ),
                            Text(
                              location,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: RaisedButton(
                                padding: const EdgeInsets.all(20),
                                textColor: Colors.blue,
                                color: Colors.blue[50],
                                onPressed: () {},
                                child: Text(
                                  'Decline',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            RaisedButton(
                              padding: const EdgeInsets.all(20),
                              textColor: Colors.blue,
                              color: Colors.blue[50],
                              onPressed: () {},
                              child: Text(
                                'Accept',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                right: 200.0,
              ),
              child: Text(
                'Repair Request',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blue[200],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 180.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.lightBlueAccent,
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 90.0),
                                  child: Text(
                                    CarNum,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${now.day}/${now.month}/${now.year}  ${now.hour}:${now.minute}',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            )),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  width: 20.0,
                                  height: 30.0,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: items.length,
                                      itemBuilder: (BuildContext txt, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10.0,
                                          ),
                                          child: Text(items[index],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.blue,
                                              )),
                                        );
                                      }),
                                ),
                              ],
                            )),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Icon(
                                    Icons.location_pin,
                                    size: 25.0,
                                    color: Colors.blue,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Text(
                                    locationreq,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    CarType,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
