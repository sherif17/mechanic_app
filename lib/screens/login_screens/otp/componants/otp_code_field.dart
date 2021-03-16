import 'package:flutter/material.dart';
import 'package:mechanic_app/screens/login_screens/file_upload/step_three/confirmationcode.dart';
import 'package:mechanic_app/utils/constants.dart';

void nextField(String value, FocusNode focusNode) {
  if (value.length == 1) {
    focusNode.requestFocus();
  }
}

TextFormField buildFirstCodeField(FocusNode toNode) {
  return TextFormField(
    autofocus: true,
    obscureText: false,
    style: TextStyle(fontSize: 27, color: Color(0xFFBD4242)),
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    maxLength: 1,
    decoration: otpInputDecoration,
    onChanged: (value) {
      nextField(value, toNode);
    },
  );
}

TextFormField buildCodeFormField(FocusNode fromNode, FocusNode toNode) {
  return TextFormField(
    focusNode: fromNode,
    obscureText: false,
    style: TextStyle(fontSize: 27, color: Color(0xFFBD4242)),
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    maxLength: 1,
    decoration: otpInputDecoration,
    onChanged: (value) => nextField(value, toNode),
  );
}

TextFormField buildLastCodeField(FocusNode lastNode) {
  return TextFormField(
    focusNode: lastNode,
    obscureText: false,
    style: TextStyle(
      fontSize: 27,
      color: Color(0xFFBD4242),
    ),
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    maxLength: 1,
    decoration: otpInputDecoration,
    onChanged: (value) {
      if (value.length == 1) {
        lastNode.unfocus();
        // Then you need to check is the code is correct or not
      }
    },
    onFieldSubmitted: (value) {},
  );
}
