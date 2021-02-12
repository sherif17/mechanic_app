import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mechanic_app/screens/login_screens/user_register/register_body.dart';

class RegisterNewUser extends StatelessWidget {
  static String routeName = '/RegisterNewUser';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register New User',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).primaryColorDark),
        ),
      ),
      body: Body(),
    );
  }
}
// Helped Resources https://youtu.be/ExKYjqgswJg
