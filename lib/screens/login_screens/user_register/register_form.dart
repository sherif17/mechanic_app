import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mechanic_app/models/user_register_model.dart';
import 'package:mechanic_app/screens/login_screens/file_upload/main_stepper.dart';
import 'package:mechanic_app/screens/login_screens/otp/componants/progress_bar.dart';
import 'package:mechanic_app/shared_prefrences/winch_user_model.dart';
import 'package:mechanic_app/utils/constants.dart';
import 'package:mechanic_app/widgets/rounded_button.dart';

import '../../../widgets/form_error.dart';

class RegisterForm extends StatefulWidget {
  String otpResponse_jwt;
  String otpResponse_phone;
  RegisterForm({Key key, this.otpResponse_jwt, this.otpResponse_phone});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  WinchRegisterRequestModel winchRegisterRequestModel;

  String jwtToken;
  String responseID;
  String responseFName;
  String responseLName;
  int responseIat;

  bool isApiCallProcess = false;
  @override
  void initState() {
    super.initState();
    winchRegisterRequestModel = new WinchRegisterRequestModel();
  }

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  final List<String> errors = [];
  String firstName;
  String lastName;
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: register_build(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0,
    );
  }

  Widget register_build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Expanded(
                child: Column(
              children: [
                buildFirstNameField(),
                SizedBox(height: size.height * 0.02),
              ],
            )),
            SizedBox(width: 15),
            Expanded(
                child: Column(
              children: [
                buildLastField(),
                SizedBox(height: size.height * 0.02),
              ],
            )),
          ],
        ),
        FormError(size: size, errors: errors),
        SizedBox(height: size.height * 0.03),
        RoundedButton(
          text: 'Create Account',
          color: Theme.of(context).primaryColor,
          press: () async {
            if (registerValidateAndSave()) {
              print("Request body: ${winchRegisterRequestModel.toJson()}.");
              Navigator.pushNamed(context, MainStepper.routeName);
              print(await getPrefJwtToken());
              print(await getPrefPhoneNumber());
              print(await getPrefLastName());
              print(await getPrefFirstName());
              print(await getPrefFirebaseID());
              /* setState(() {
                isApiCallProcess = true;
              });
              ApiService apiService = new ApiService();
              apiService
                  .registerUser(
                      winchRegisterRequestModel, widget.otpResponse_jwt)
                  .then((value) {
                if (value.error == null) {
                  jwtToken = value.token;
                  Map<String, dynamic> decodedToken =
                      JwtDecoder.decode(jwtToken);
                  responseID = decodedToken["_id"];
                  responseFName = decodedToken["firstName"];
                  responseLName = decodedToken["lastName"];
                  responseIat = decodedToken["iat"];
                  print(responseID);
                  print(responseLName);
                  print(responseFName);
                  print(responseIat);
                  print(value.token);
                  setState(() {
                    isApiCallProcess = false;
                  });
                } else {
                  setState(() {
                    isApiCallProcess = false;
                  });
                  print(value.error);
                  showRegisterModalBottomSheet(
                      context, size.height * 0.4, false, "byNameError", "");
                }
              });*/
            } else
              print("Error on Saving Data");
          },
        ),
      ]),
    );
  }

  bool registerValidateAndSave() {
    final registerFormKey = _formKey.currentState;
    if (registerFormKey.validate()) {
      registerFormKey.save();
      return true;
    } else
      return false;
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: 'Your First Name',
        labelText: 'First Name',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      onSaved: (newValue) {
        //firstName = newValue;
        winchRegisterRequestModel.firstName = newValue;
        setPrefFirstName(newValue);
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: NullFirstNameError);
          removeError(error: SmallFirstNameError);
          return "";
        }
        if (value.length > 1) {
          removeError(error: SmallFirstNameError);
          return "";
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: NullFirstNameError);
          return "";
        } else if (value.length == 1) {
          addError(error: SmallFirstNameError);
          return "";
        }
        return null;
      },
    );
  }

  TextFormField buildLastField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: 'Your Last Name',
        labelText: 'Last Name',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      onSaved: (newValue) {
        //lastName = newValue;
        winchRegisterRequestModel.lastName = newValue;
        setPrefLastName(newValue);
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: NullLastNameError);
          removeError(error: SmallLastNameError);
          return "";
        }
        if (value.length > 1) {
          removeError(error: SmallLastNameError);
          return "";
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: NullLastNameError);
          return "";
        } else if (value.length == 1) {
          addError(error: SmallLastNameError);
          return "";
        }
        return null;
      },
    );
  }
}
