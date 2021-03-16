import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mechanic_app/screens/login_screens/otp/otp_body.dart';

class VerifyPhoneNumber extends StatelessWidget {
  static String routeName = '/PhoneVerification';
  final scafoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scafoldKey,
      body: Otp_Body(),
    );
  }
}
// Helped Resources :https://youtu.be/iZqxIvlzXVw
