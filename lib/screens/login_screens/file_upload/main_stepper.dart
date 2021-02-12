import 'package:flutter/material.dart';
import 'package:mechanic_app/screens/login_screens/file_upload/stepper_body.dart';

class MainStepper extends StatelessWidget {
  static String routeName = '/FilesStepper';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: StepperBody());
  }
}
