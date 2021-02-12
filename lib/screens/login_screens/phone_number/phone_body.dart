import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mechanic_app/screens/login_screens/phone_number/phone_form.dart';

import 'componants/country_code_field.dart';

class Body extends StatelessWidget {
  String phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.1, left: size.width * 0.03),
            child: Text('Enter Mobile Number:',
                style: Theme.of(context).textTheme.headline1),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.05, top: size.height * 0.02),
            child: Text(
              'Enter your mobile number ,to create an account or to log in to your existing one.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          PhoneForm(),
        ],
      ),
    );
  }
}
