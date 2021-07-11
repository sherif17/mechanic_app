import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mechanic_app/widgets/divider.dart';

class UpComingRequestCard extends StatefulWidget {

  @override
  _UpComingRequestCardState createState() => _UpComingRequestCardState();
}

class _UpComingRequestCardState extends State<UpComingRequestCard> {
  @override
  Widget build(BuildContext context) {

    String location = '1 Ash Park,Pembroke Dock,5A27';
    String customerName = 'Sherif hany';
    double customerRating = 3.5;
    String estimatedDurationToCustomer = "5-7 min";
    String price1 = '100L.E';
    String price2 = '200L.E';

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColorLight,
                      radius: 30.0,
                      backgroundImage: AssetImage("assets/icons/profile.png"),
                    ),
                    Column(
                      children: [
                        Text(
                            customerName,
                            style: Theme.of(context).textTheme.headline2
                        ),
                        RatingBarIndicator(
                          rating: customerRating,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 17.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                            'ETA',
                            style: Theme.of(context).textTheme.headline4
                        ),
                        Text(estimatedDurationToCustomer, style: Theme.of(context).textTheme.bodyText1,)
                      ],
                    ),
                  ],
                )),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 70),
                      child: Column(
                        children: [
                          Text(
                              'Services Needed',
                              style: Theme.of(context).textTheme.bodyText2
                          ),
                          Text(
                              'Ac Repair ',
                              style: Theme.of(context).textTheme.bodyText1
                          ),
                          Text(
                              'Oil Exchange',
                              style: Theme.of(context).textTheme.bodyText1
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Column(
                        children: [
                          Text(
                              'Estimated Fare',
                              style: Theme.of(context).textTheme.bodyText2
                          ),
                          Text(
                              price1,
                              style: Theme.of(context).textTheme.bodyText1
                          ),
                          Text(
                              price2,
                              style: Theme.of(context).textTheme.bodyText1
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            DividerWidget(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_pin,
                        size: 25.0,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      Text(
                          location,
                          style: Theme.of(context).textTheme.bodyText2
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
                          textColor: Colors.black,
                          color: Theme.of(context).primaryColorLight,
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
                        textColor: Theme.of(context).accentColor,
                        color: Theme.of(context).primaryColorDark,
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Accept',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(width: 5.0,),
                            CircularCountDownTimer(
                              width: 40,
                              height: 40,
                              duration: 59,
                              fillColor: Colors.grey,
                              ringColor: Theme.of(context).primaryColorLight,
                              isReverse: true,
                              backgroundColor: Theme.of(context).accentColor,
                              onComplete: () {},
                              isTimerTextShown: true,
                            ),

                            // Container(
                            //   width: 30,
                            //   height: 30,
                            //   decoration:
                            //   BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle,
                            //   ),
                            //   child: Text(_timer, style: Theme.of(context).textTheme.bodyText2,),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
