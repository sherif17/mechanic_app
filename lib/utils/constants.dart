//try to use colors from this file ,instead of  using theme.
import 'package:flutter/material.dart';
import 'package:mechanic_app/utils/size_config.dart';

const animationDuration = Duration(microseconds: 2000);
final RegExp phoneValidatorRegExp = RegExp(r"(1)[0-9]{9}$");
//form Error
const String NullPhoneNumberError = "Please Enter Your Phone Number";
const String SmallPhoneNumberError =
    "This Number is too short to be Phone number";
const String ValidPhoneNumberError = "please enter valid phone number";
const String StartWithOneNumberError = "Your number should start with 1";

const String NullFirstNameError = "Please Enter Your First Name";
const String InvalidFirstNameError = "Please Valid First Name";
const String SmallFirstNameError = " Entered First Name is too Short";

const String NullLastNameError = "Please Enter Your Last Name";
const String InvalidLastNameError = "Please Valid Last Name";
const String SmallLastNameError = " Entered Last Name is too Short";

//winch plates
const String NullCharPlateError = "Please Enter Winch Plate Characters";
const String InvalidCharPlateError =
    "Please Enter Valid Winch Plate Characters";
const String SmallCharPlateError =
    " Entered Winch Plate Character is too Short";
const String LargeCharPlateError =
    "Maximum allowed Characters is 3 ,please remove extra ones";

const String NullNumPlateError = "Please Enter Winch Plate Numbers";
const String InvalidNumPlateError = "Please Enter Valid Winch Plate Numbers";
const String SmallNumPlateError = " Entered Winch Plate Numbers is too Short";

final otpInputDecoration = InputDecoration(
  counterText: '',
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: enableInputBorder(),
  focusedBorder: enableInputBorder(),
  enabledBorder: enableInputBorder(),
  disabledBorder: disableInputBorder(),
  errorBorder: errorBorder(),
);

OutlineInputBorder errorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: Colors.grey[800]),
  );
}

OutlineInputBorder disableInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
    borderSide: BorderSide(color: Colors.grey[900], width: 3.0),
  );
}

OutlineInputBorder enableInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: Color(0xFF470000)),
  );
}
