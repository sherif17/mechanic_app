import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mechanic_app/widgets/divider.dart';

class CentersTab extends StatefulWidget {
  @override
  _CentersTabState createState() => _CentersTabState();
}

class _CentersTabState extends State<CentersTab> {
  @override
  Widget build(BuildContext context) {
    String centerName = 'Car service center';
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          width: 380.0,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  'Want To Apply To Center ?',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              RaisedButton(
                padding: const EdgeInsets.all(8),
                textColor: Colors.black,
                color: Colors.white70,
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),

        //Centers list display

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
                // child: ListView.builder (
                //   itemCount: 3,
                //   scrollDirection: Axis.horizontal,
                //   itemExtent: 5,
                //   itemBuilder: (BuildContext context, int index) {
                //     return  Container(
                //       width: 135,
                //       height: 140.0,
                //       margin: EdgeInsets.only(right: 20),
                //       decoration: BoxDecoration(
                //           border: Border.all(color: Colors.black26),
                //           color: Colors.white,
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(15),
                //           )),
                //       child: Padding(
                //         padding: const EdgeInsets.all(0.0),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                //               children: <Widget>[
                //                 Container(
                //                   child: Row(
                //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                     children: <Widget>[
                //                       Container(
                //                         width: 120.0,
                //                         height: 50.0,
                //                         child: Image(image: AssetImage("assets/images/women_truck.jpg"),),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(top: 5.0),
                //                   child: Container(
                //                     height: 30.0,
                //                     width: 130.0,
                //                     child: Row(
                //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                       children: <Widget>[
                //                         Padding(
                //                           padding: const EdgeInsets.only(right: 0.0),
                //                           child: ListView(
                //                             children:
                //                             [
                //                               Text(
                //                               '$centerName',
                //                               style: Theme.of(context).textTheme.bodyText2,
                //                             ),
                //                             ]
                //                           ),
                //                         ),
                //                         Padding(
                //                           padding: const EdgeInsets.only(left: 30.0),
                //                           child: Container(
                //                             width: 60.0,
                //                             height: 10.0,
                //                             child: RatingBarIndicator(
                //                               rating: 2.5,
                //                               itemBuilder: (context, index) => Icon(
                //                                 Icons.star,
                //                                 color: Colors.black,
                //                               ),
                //                               itemCount: 5,
                //                               itemSize: 10.0,
                //                               direction: Axis.horizontal,
                //                             ),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(top: 20.0),
                //                   child: Container(
                //                     height: 30.0,
                //                     width: 125.0,
                //                     child: Padding(
                //                       padding: const EdgeInsets.only(top: 0.0, left: 70.0),
                //                       child: RaisedButton(
                //                         padding: const EdgeInsets.all(10),
                //                         textColor: Colors.blue,
                //                         color: Colors.blue[50],
                //                         onPressed: () {},
                //                         child: Text(
                //                           'Join',
                //                           style: TextStyle(
                //                             fontSize: 10.0,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // ),

              child:  Row(
                  children: <Widget>[
                    Container(
                      width: 135,
                      margin: EdgeInsets.only(right: 20),
                      height: 140.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
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
                                        color: Colors.deepPurple[100],
                                      ),
                                    ],
                                  ),
                                ),
                                DividerWidget(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Container(
                                    height: 30.0,
                                    width: 130.0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(right: 0.0),
                                          child: Container(
                                            width: 80,
                                            height: 150,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [Text(
                                                '$centerName',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.blue,
                                                ),
                                              ),]
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 0.0),
                                          child: Container(
                                            width: 50.0,
                                            height: 10.0,
                                            child: RatingBarIndicator(
                                              rating: 2.5,
                                              itemBuilder: (context, index) => Icon(
                                                Icons.star,
                                                color: Colors.black,
                                              ),
                                              itemCount: 5,
                                              itemSize: 10.0,
                                              direction: Axis.horizontal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DividerWidget(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Container(
                                    height: 30.0,
                                    width: 125.0,
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
                          border: Border.all(color: Colors.black26),
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
                                        color: Colors.deepPurple[100],
                                      ),
                                    ],
                                  ),
                                ),
                                DividerWidget(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Container(
                                    height: 30.0,
                                    width: 130.0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(right: 0.0),
                                          child: Container(
                                            width: 80,
                                            height: 150,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [Text(
                                                '$centerName',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.blue,
                                                ),
                                              ),]
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 0.0),
                                          child: Container(
                                            width: 50.0,
                                            height: 10.0,
                                            child: RatingBarIndicator(
                                              rating: 2.5,
                                              itemBuilder: (context, index) => Icon(
                                                Icons.star,
                                                color: Colors.black,
                                              ),
                                              itemCount: 5,
                                              itemSize: 10.0,
                                              direction: Axis.horizontal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DividerWidget(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Container(
                                    height: 30.0,
                                    width: 125.0,
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
                          border: Border.all(color: Colors.black26),
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
                                        color: Colors.deepPurple[100],
                                      ),
                                    ],
                                  ),
                                ),
                                DividerWidget(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Container(
                                    height: 30.0,
                                    width: 130.0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(right: 0.0),
                                          child: Container(
                                            width: 80,
                                            height: 150,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [Text(
                                                '$centerName',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.blue,
                                                ),
                                              ),]
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 0.0),
                                          child: Container(
                                            width: 50.0,
                                            height: 10.0,
                                            child: RatingBarIndicator(
                                              rating: 2.5,
                                              itemBuilder: (context, index) => Icon(
                                                Icons.star,
                                                color: Colors.black,
                                              ),
                                              itemCount: 5,
                                              itemSize: 10.0,
                                              direction: Axis.horizontal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DividerWidget(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Container(
                                    height: 30.0,
                                    width: 125.0,
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
                          border: Border.all(color: Colors.black26),
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
                                        color: Colors.deepPurple[100],
                                      ),
                                    ],
                                  ),
                                ),
                                DividerWidget(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Container(
                                    height: 30.0,
                                    width: 130.0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(right: 0.0),
                                          child: Container(
                                            width: 80,
                                            height: 150,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [Text(
                                                '$centerName',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.blue,
                                                ),
                                              ),]
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 0.0),
                                          child: Container(
                                            width: 50.0,
                                            height: 10.0,
                                            child: RatingBarIndicator(
                                              rating: 2.5,
                                              itemBuilder: (context, index) => Icon(
                                                Icons.star,
                                                color: Colors.black,
                                              ),
                                              itemCount: 5,
                                              itemSize: 10.0,
                                              direction: Axis.horizontal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DividerWidget(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Container(
                                    height: 30.0,
                                    width: 125.0,
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

        // Join Center by code button

        Container(
          width: 430.0,
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 320.0),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 100, height: 100),
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Join Center\nUsing Code',
                    style: TextStyle(fontSize: 12.0),
                  ),
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
    );
  }
}
