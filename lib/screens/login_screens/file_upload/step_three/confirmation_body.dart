import 'package:flutter/material.dart';
import 'confirmationcode.dart';

class ConfirmationBody extends StatelessWidget {
  final bool islogin = false;
  final otpInput = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 40),
      counter: Offstage(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black),
      ));
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 80.0,
              left: 10.0,
              bottom: 20.0,
            ),
            child: Text(
              'Please Enter Your Confirmation Code Provided by the administration',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.5),
            child: Text(
              'These process of confirmation may take from 1 to 3 weeks to check your files',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          confirmationcode(),
          buildTimer(),
        ],
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code Will Expire in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 40.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
