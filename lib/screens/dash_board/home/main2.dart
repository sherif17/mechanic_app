import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'bottombar.dart';
import 'button.dart';
import 'checklist.dart';
import 'timer.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'center.dart';
import 'individual.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutterTabs',
      home: tabs(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class tabs extends StatefulWidget {
  @override
  _tabsState createState() => _tabsState();
}

class _tabsState extends State<tabs> with SingleTickerProviderStateMixin {
  List list_name = ["individual", "center"];
  DateTime now = DateTime.now();
  String firstname = 'first last';
  String brand = 'seat';
  String model = 'lbiza';
  String time = '1:15';
  String production = '2019';
  SwiperController _scrollController = new SwiperController();

  TabController tabController;
  List<Widget> itemsData = [];

  int currentindex2 = 0; // for swiper index initial

  int selectedIndex = 0; // for tab

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: selectedIndex,
      length: list_name.length,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {
        print(tabController.index);
        _scrollController.move(tabController.index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String Mechname = 'Ahmed Mohamed';
    String Centername = 'Borg';
    final List<Tab> myTabs = List.generate(
      2,
      (index) => Tab(text: 'TAB $index'),
    );
    DateTime now = DateTime.now();

    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0, top: 25.0),
              child: Container(
                width: 440.0,
                height: 120.0,
                color: Colors.lightBlueAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 290.0),
                              child: Text(
                                '${now.day}/${now.month}/${now.year} ',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 120.0),
                              child: Text(
                                'Hey,$Mechname',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                              ),
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
            Container(
              width: 300.0,
              height: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DefaultTabController(
                    length: list_name.length,
                    child: Container(
                      width: 300,
                      height: 30,
                      constraints: BoxConstraints(maxHeight: 35.0),
                      child: Material(
                        child: TabBar(
                          onTap: (index) => _scrollController.move(index),
                          controller: tabController,
                          isScrollable: true,
                          indicatorColor: Color.fromRGBO(0, 202, 157, 1),
                          labelColor: Colors.black,
                          labelStyle: TextStyle(fontSize: 20),
                          unselectedLabelColor: Colors.black,
                          tabs: List<Widget>.generate(list_name.length, (int index) {
                            return new Tab(text: list_name[index]);
                          }),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: new Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          selectedIndex = index;
                          tabController.animateTo(index);
                          currentindex2 = index;
                          print(index);
                        });
                      },
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                          tabController.animateTo(index);
                          currentindex2 = index;
                          print(index);
                        });
                      },
                      duration: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return new Swiper(
                          duration: 2,
                          controller: _scrollController,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return VisibilityDetector(
                              key: Key(index.toString()),
                              child: Container(
                                child: selectedIndex == 1 ? individual() : center(),
                              ),
                              onVisibilityChanged: (VisibilityInfo info) {
                                if (info.visibleFraction == 1)
                                  setState(() {
                                    selectedIndex = index;
                                    tabController.animateTo(index);
                                    currentindex2 = index;
                                    print(index);
                                  });
                              },
                            );
                          },
                          itemCount: list_name.length,
                        );
                      },
                      itemCount: list_name.length,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: 300.0,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: Text(
                        'No Requests Available',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 300.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: AssetImage('assets/new2.png'),
                      ),
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
                    width: 391.0,
                    height: 300.0,
                    child: Home(),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            'Time Passed',
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.blue,
                            ),
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
                          height: 130.0,
                          child: timer(),
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
                          child: checklist(),
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
                          child: button(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.lightBlueAccent[100],
                                // width: 3.0 --> you can set a custom width too!
                              ),
                              bottom: BorderSide(
                                color: Colors.lightBlueAccent[100],
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'customer name:',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.blue,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    firstname,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0, right: 20.0),
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.lightBlueAccent[100],
                                  // width: 3.0 --> you can set a custom width too!
                                ),
                                bottom: BorderSide(
                                  color: Colors.lightBlueAccent[100],
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Trip start Time:',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 60.0),
                                    child: Text(
                                      '${now.hour}:${now.minute}',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, right: 220.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Car Details:',
                                style: TextStyle(
                                  fontSize: 23.0,
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.lightBlueAccent[100],
                                  // width: 3.0 --> you can set a custom width too!
                                ),
                                bottom: BorderSide(
                                  color: Colors.lightBlueAccent[100],
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Brand',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 120.0),
                                    child: Text(
                                      brand,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.lightBlueAccent[100],
                                  // width: 3.0 --> you can set a custom width too!
                                ),
                                bottom: BorderSide(
                                  color: Colors.lightBlueAccent[100],
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Model',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 120.0),
                                    child: Text(
                                      model,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 80.0),
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.lightBlueAccent[100],
                                  // width: 3.0 --> you can set a custom width too!
                                ),
                                bottom: BorderSide(
                                  color: Colors.lightBlueAccent[100],
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Production Year',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Text(
                                    '${now.year} ',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
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
