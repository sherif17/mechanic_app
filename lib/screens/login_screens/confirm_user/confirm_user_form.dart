import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/localization/localization_constants.dart';
import 'package:mechanic_app/models/user_register_model.dart';
import 'package:mechanic_app/screens/dash_board/dash_board.dart';
import 'package:mechanic_app/screens/login_screens/otp/componants/progress_bar.dart';
import 'package:mechanic_app/services/api_services.dart';
import 'package:mechanic_app/shared_prefrences/winch_user_model.dart';
import 'package:mechanic_app/utils/constants.dart';
import 'package:mechanic_app/widgets/form_error.dart';
import 'package:mechanic_app/widgets/rounded_button.dart';

class ConfirmUserForm extends StatefulWidget {
  String prefFName;
  String prefLName;
  String prefJwtToken;
  String prefPhone;
  String currentLang;
  String workingCity;

  ConfirmUserForm(this.prefFName, this.prefLName, this.prefJwtToken,
      this.prefPhone, this.currentLang, this.workingCity);

  @override
  _ConfirmUserFormState createState() => _ConfirmUserFormState();
}

class _ConfirmUserFormState extends State<ConfirmUserForm> {
  final _formKey = GlobalKey<FormState>();
  WinchRegisterRequestModel winchRegisterRequestModel;
  bool isApiCallProcess = false;

  String jwtToken;
  String responseID;
  String responseFName;
  String responseLName;
  int responseIat;
  String responseWinchPlates;
  String responseGovernorate;

  bool FName_Changed = false;
  bool LName_changed = false;
  bool WinchPlateNum_changed = false;
  bool WinchPlateChar_changed = false;

  @override
  void initState() {
    // getCurrentPrefData();
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
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: confirm_build(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0,
    );
  }

  Widget confirm_build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Container(
        height: size.height,
        margin: EdgeInsets.only(top: size.height * 0.01, left: 5, right: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: size.height * 0.1,
              width: size.width * 0.6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.45,
                    child: DecoratedEditFNameTextField()),
                SizedBox(
                  width: size.width * 0.03,
                ),
                SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.45,
                    child: DecoratedEditLNameTextField())
              ],
            ),
            /*Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Expanded(
                  child: BuildCharPlateTextFormField(),
                ),
                Expanded(child: BuildNumPlateTextFormField()),
              ],
            ),*/
            SizedBox(
                width: size.height * 0.1,
                child: FormError(size: size, errors: errors)),
            SizedBox(
                height: size.height * 0.1,
                width: size.width * 0.5,
                child: DecoratedPhoneTField()),
            RoundedButton(
                text: getTranslated(context, "Edit my info"),
                color: Theme.of(context).primaryColor,
                press: () async {
                  if (confirmValidateAndSave()) {
                    if (FName_Changed == true || LName_changed == true) {
                      winchRegisterRequestModel.governorate =
                          widget.workingCity;
                      print(
                          "Request body: ${winchRegisterRequestModel.toJson()}.");
                      print("hii ${widget.prefJwtToken}");
                      setState(() {
                        isApiCallProcess = true;
                      });
                      ApiService apiService = new ApiService();
                      apiService
                          .registerUser(winchRegisterRequestModel,
                              widget.prefJwtToken, widget.currentLang)
                          .then(
                        (value) {
                          if (value.error == null) {
                            saveJwtTokenInDB(value.token);
                            saveFirstNameInDB(
                                winchRegisterRequestModel.firstName);
                            saveLastNameInDB(
                                winchRegisterRequestModel.lastName);
                            Map<String, dynamic> decodedToken =
                                JwtDecoder.decode(value.token);
                            saveBackendIBInDB(decodedToken["_id"]);
                            saveVerificationStateInDB(
                                decodedToken["verified"].toString());
                            saveIATInDB(decodedToken["iat"].toString());
                            setState(() {
                              isApiCallProcess = false;
                            });
                            printAllMechanicSavedInfoInDB();
                            Navigator.pushNamedAndRemoveUntil(
                                context, DashBoard.routeName, (route) => false);
                          } else
                            print(value.error);
                        },
                      );
                    } else {
                      setState(() {
                        Navigator.pop(context);
                      });
                    }
                  } else {
                    print("Validation error");
                  }
                }),
          ],
        ),
      ),
    );
  }

  bool confirmValidateAndSave() {
    final registerFormKey = _formKey.currentState;
    if (registerFormKey.validate()) {
      registerFormKey.save();
      return true;
    } else
      return false;
  }

  TextFormField DecoratedEditFNameTextField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      initialValue: widget.prefFName,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        labelText: widget.currentLang == "en" ? 'First Name' : "الاسم الاول",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onSaved: (newValue) {
        if (newValue != widget.prefFName) {
          FName_Changed = true;
        }
        winchRegisterRequestModel.firstName = newValue;
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

  TextFormField DecoratedEditLNameTextField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      initialValue: widget.prefLName,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        labelText: widget.currentLang == "en" ? 'Last Name' : "اسم العائله",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onSaved: (newValue) {
        if (newValue != widget.prefLName) {
          LName_changed = true;
          print("two");
        }
        winchRegisterRequestModel.lastName = newValue;
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

  TextFormField DecoratedPhoneTField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      enabled: false,
      initialValue: widget.prefPhone,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        labelText: widget.currentLang == "en" ? 'Phone number' : "رقم الهاتف",
        //disabledBorder: disableInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
