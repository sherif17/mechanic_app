import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/localization/localization_constants.dart';
import 'package:mechanic_app/shared_prefrences/winch_user_model.dart';

class WatchTutorial extends StatefulWidget {
  @override
  _WatchTutorialState createState() => _WatchTutorialState();
}

class _WatchTutorialState extends State<WatchTutorial> {
  String CurrentWinchUserFname = loadFirstNameFromDB(); // " ";
  @override
  void initState() {
    // getWinchUserData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CurrentWinchUserFname == " "
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.indigoAccent))
        : Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: size.height * 0),
                  child: SvgPicture.asset(
                    "assets/icons/checkmark.svg",
                    height: size.height * 0.4,
                    color: Colors.greenAccent,
                  )),
              SizedBox(height: size.height * 0.05),
              Text(
                getTranslated(context, "Congratulations") +
                    CurrentWinchUserFname,
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: size.height * 0.04),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  getTranslated(context,
                      "You Have Successfully Registered as Mechanic In Our App"),
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                getTranslated(context, "Let's Start Your Mission With Us"),
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),

              /*Padding(
          padding:
          const EdgeInsets.only(top: 60.0, left: 10.0, bottom: 10.0),
          child: Text(
            'Please Watch this Tutorial How to use our App to start Earring Money',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
            left: 10.0,
          ),
          child: Container(
            height: 250.0,
            width: 380.0,
            decoration: BoxDecoration(
                border:
                Border.all(color: Theme.of(context).primaryColorDark),
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0, top: 20.0),
              child: Container(
                child: FlatButton(
                  onPressed: () {
                    /*...*/
                  },
                  child: Image.asset('assets/new.png'),
                  height: 60.0,
                  minWidth: 60.0,
                ),
              ),
            ),
          ),
        ),*/
            ],
          );
  }

  // getWinchUserData() async {
  //   getPrefFirstName().then((value) {
  //     setState(() {
  //       CurrentWinchUserFname = value;
  //     });
  //   });
  // }
}
