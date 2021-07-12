import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mechanic_app/provider/appControlProvider.dart';
import 'package:mechanic_app/provider/upcoming_mechanic_service/mechanic_request_provider.dart';
import 'package:provider/provider.dart';

class IndividualNoRequestTab extends StatefulWidget {
  @override
  _IndividualNoRequestTabState createState() => _IndividualNoRequestTabState();
}

class _IndividualNoRequestTabState extends State<IndividualNoRequestTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<MechanicRequestProvider>(
      builder: (context, val, child) => val.mechanicCurrentState == false
          ? Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: size.width * 0.8,
                      height: size.height * 0.4,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: AssetImage(
                              'assets/images/pluto-no-connection.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Text(
                      'You are currently offline',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                Text(
                  'Try to swip the offline button',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  'To start receiving requests',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  "assets/illustrations/searching.svg",
                  height: size.width * 0.7,
                ),
                DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .headline6, //const TextStyle(fontSize: 20.0, color: Colors.red),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          'You are currently online',
                          textStyle: Theme.of(context).textTheme.headline3,
                        ),
                        WavyAnimatedText(
                          'Searching for upcoming requests',
                          textStyle: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                      isRepeatingAnimation: true,
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
