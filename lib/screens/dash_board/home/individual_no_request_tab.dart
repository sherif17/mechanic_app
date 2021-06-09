import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndividualNoRequestTab extends StatefulWidget {

  @override
  _IndividualNoRequestTabState createState() => _IndividualNoRequestTabState();
}

class _IndividualNoRequestTabState extends State<IndividualNoRequestTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Text(
                    'No Requests Available',
                    style: Theme.of(context).textTheme.headline2,
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: 300.0,
                  height: 180.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage('assets/illustrations/1523585112957.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
