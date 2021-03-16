import 'package:flutter/widgets.dart';
import 'package:mechanic_app/screens/dash_board/dash_board.dart';
import 'package:mechanic_app/screens/login_screens/confirm_user/confirm_is_that_user.dart';
import 'package:mechanic_app/screens/login_screens/file_upload/main_stepper.dart';
import 'package:mechanic_app/screens/login_screens/otp/phone_verification.dart';
import 'package:mechanic_app/screens/login_screens/phone_number/enter_phone_number.dart';
import 'package:mechanic_app/screens/login_screens/user_register/register_new_user.dart';
import 'package:mechanic_app/screens/onboarding_screens/intro_screens/intro.dart';

final Map<String, WidgetBuilder> routes = {
  Intro.routeName: (context) => Intro(),
  EnterPhoneNumber.routeName: (context) => EnterPhoneNumber(),
  VerifyPhoneNumber.routeName: (context) => VerifyPhoneNumber(),
  ConfirmThisUser.routeName: (context) => ConfirmThisUser(),
  RegisterNewUser.routeName: (context) => RegisterNewUser(),
  MainStepper.routeName: (context) => MainStepper(),
  DashBoard.routeName: (context) => DashBoard(),
};
