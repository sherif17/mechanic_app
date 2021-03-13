import 'package:flutter/material.dart';
import 'package:mechanic_app/screens/login_screens/file_upload/stepper_body.dart';
import 'package:mechanic_app/screens/login_screens/user_register/register_body.dart';

class MainStepper extends StatelessWidget {
  static String routeName = '/FilesStepper';

  @override
  Widget build(BuildContext context) {
    LangModel res = ModalRoute.of(context).settings.arguments;
    return Scaffold(body: StepperBody(res.language));
  }
}
