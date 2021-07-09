import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/localization/localization_constants.dart';
import 'package:mechanic_app/models/phone_num_model.dart';
import 'package:mechanic_app/screens/login_screens/confirm_user/confirm_is_that_user.dart';
import 'package:mechanic_app/screens/login_screens/file_upload/step_three/confirmationcode.dart';
import 'package:mechanic_app/screens/login_screens/user_register/register_body.dart';
import 'package:mechanic_app/screens/login_screens/user_register/register_new_user.dart';
import 'package:mechanic_app/services/api_services.dart';
import 'package:mechanic_app/shared_prefrences/winch_user_model.dart';
import 'package:mechanic_app/utils/constants.dart';
import 'package:mechanic_app/utils/size_config.dart';
import 'package:mechanic_app/widgets/rounded_button.dart';
import 'componants/navigation_args.dart';
import 'componants/otp_code_field.dart';
import 'componants/progress_bar.dart';

class OtpForm extends StatefulWidget {
  PhoneRequestModel phoneRequestModel;
  String phone_num;
  ScaffoldState scafoldKey;
  OtpForm({Key key, this.phoneRequestModel, this.phone_num, this.scafoldKey});

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  bool checkFirebase = false;
  String fireToken;
  final _pinKey_two = GlobalKey<FormState>();

  bool isApiCallProcess = false;
  PhoneRequestModel phoneRequestModel;

  String jwtToken;
  String responseID;
  String responseFName;
  String responseLName;
  bool responseVerificationState;
  int responseIat;
  String winchPlates;
  String governorate;

  String pin1;
  String pin2;
  String pin3;
  String pin4;
  String pin5;
  String pin6;

  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  String _verificationCode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
    _verifyPhone();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0,
    );
  }

  Widget _uiSetup(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _pinKey_two,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(45),
                  child: TextFormField(
                    autofocus: true,
                    obscureText: false,
                    style: TextStyle(fontSize: 27, color: Color(0xFFBD4242)),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      nextField(value, pin2FocusNode);
                    },
                    onSaved: (newValue) => pin1 = newValue,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(45),
                  child: TextFormField(
                    focusNode: pin2FocusNode,
                    obscureText: false,
                    style: TextStyle(fontSize: 27, color: Color(0xFFBD4242)),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin3FocusNode),
                    onSaved: (newValue) => pin2 = newValue,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(45),
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    obscureText: false,
                    style: TextStyle(fontSize: 27, color: Color(0xFFBD4242)),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin4FocusNode),
                    onSaved: (newValue) => pin3 = newValue,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(45),
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    obscureText: false,
                    style: TextStyle(fontSize: 27, color: Color(0xFFBD4242)),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin5FocusNode),
                    onSaved: (newValue) => pin4 = newValue,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(45),
                  child: TextFormField(
                    focusNode: pin5FocusNode,
                    obscureText: false,
                    style: TextStyle(fontSize: 27, color: Color(0xFFBD4242)),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin6FocusNode),
                    onSaved: (newValue) => pin5 = newValue,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(45),
                  child: TextFormField(
                    focusNode: pin6FocusNode,
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
                        pin6FocusNode.unfocus();
                      }
                    },
                    onSaved: (newValue) => pin6 = newValue,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: size.height * 0.04),
          RoundedButton(
              text: getTranslated(context, "Verify"),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).accentColor,
              press: () async {
                isApiCallProcess = true;
                _pinKey_two.currentState.save();
                String code = pin1 + pin2 + pin3 + pin4 + pin5 + pin6;
                print(code);
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: code))
                      .then((value) async {
                    if (value.user != null) {
                      fireToken = FirebaseAuth.instance.currentUser.uid;
                      // setPrefFirebaseID(fireToken);
                      saveFirebaseIDInDB(fireToken);
                      checkFirebase = true;
                      print(checkFirebase);
                      print("Firebase Token:${fireToken}");
                    }
                  });
                } catch (e) {
                  print("invalid otp");
                  checkFirebase = false;
                  _showModalBottomSheet(context, size.height * 0.45, code,
                      getTranslated(context, "failed to get user fire token"));
                }
                if (checkFirebase == true) {
                  widget.phoneRequestModel.fireBaseId = fireToken;
                  print("Request body: ${widget.phoneRequestModel.toJson()}.");
                  setState(() {
                    isApiCallProcess = true;
                  });
                  ApiService apiService = new ApiService();
                  apiService
                      .phoneCheck(widget.phoneRequestModel)
                      .then((value) async {
                    if (value.error == null) {
                      print("Response:");
                      jwtToken = value.token;
                      saveJwtTokenInDB(jwtToken);
                      Map<String, dynamic> decodedToken =
                          JwtDecoder.decode(jwtToken);
                      if (value.firstName != null &&
                          value.lastName != null &&
                          value.governorate != null) {
                        setState(() {
                          isApiCallProcess = false;
                        });
                        saveFirstNameInDB(value.firstName);
                        saveLastNameInDB(value.lastName);
                        saveWorkingCityInDB(value.governorate);
                        //printAllMechanicSavedInfoInDB();
                        await Navigator.pushNamedAndRemoveUntil(context,
                            ConfirmThisUser.routeName, (route) => false);
                      } else if (value.firstName == null &&
                          value.lastName == null &&
                          value.governorate == null) {
                        setState(() {
                          isApiCallProcess = false;
                        });
                        Navigator.pushNamedAndRemoveUntil(context,
                            RegisterNewUser.routeName, (route) => false);
                      } else {
                        setState(() {
                          isApiCallProcess = false;
                        });
                        print("Something wrong");
                        showRegisterModalBottomSheet(
                            context, size.height * 0.45, false, " ", "");
                      }
                    } else {
                      print(value.error);
                      setState(() {
                        isApiCallProcess = false;
                      });
                      showRegisterModalBottomSheet(context, size.height * 0.45,
                          false, "InvalidUserToken", "");
                    }
                  });
                }
              }),
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+20${widget.phone_num}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print("LOGGEDINNNNNN");
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          /* setState(() {
            _verificationCode = verificationID;
          });*/
        },
        timeout: Duration(seconds: 120));
  }
}

_showModalBottomSheet(context, container_size, otpcode, errorCousal) {
  Size size = MediaQuery.of(context).size;
  bool x;
  if (otpcode == "")
    x = false;
  else
    x = true;
  showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Container(
        height: container_size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: SvgPicture.asset(
                'assets/icons/error_large.svg',
                height: size.height * 0.12,
                width: size.width * 0.12,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: size.height * 0.015),
            Text(
                x
                    ? getTranslated(context, "Invalid OTP")
                    : getTranslated(context, "Empty Fields"),
                style: Theme.of(context).textTheme.headline3),
            SizedBox(height: size.height * 0.015),
            Text(
              x
                  ? getTranslated(context, "This Code") +
                      otpcode +
                      getTranslated(
                          context, "doesn't match with the code we sent to you")
                  : getTranslated(context, "Please Enter the Received code"),
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.015),
            Text(
              errorCousal,
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.005),
            RoundedButton(
              text: getTranslated(context, "Try Again"),
              color: Theme.of(context).primaryColor,
              press: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    ),
  );
}
