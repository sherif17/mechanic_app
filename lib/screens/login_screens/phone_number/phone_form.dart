import 'package:flutter/material.dart';
import 'package:mechanic_app/models/phone_num_model.dart';
import 'package:mechanic_app/screens/login_screens/otp/phone_verification.dart';
import 'package:mechanic_app/screens/login_screens/phone_number/componants/phone_number.dart';
import 'package:mechanic_app/shared_prefrences/winch_user_model.dart';
import 'package:mechanic_app/utils/constants.dart';
import 'package:mechanic_app/widgets/form_error.dart';
import 'package:mechanic_app/widgets/rounded_button.dart';

import 'componants/country_code_field.dart';

class PhoneForm extends StatefulWidget {
  @override
  _PhoneFormState createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  PhoneRequestModel phoneRequestModel;
  String phone;

  @override
  void initState() {
    super.initState();
    phoneRequestModel = new PhoneRequestModel();
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: CountryCode(
                      radius: 5,
                      borderColor: Theme.of(context).primaryColor,
                      width: 100,
                    )),
                Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      buildPhoneField(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FormError(size: size, errors: errors),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.2,
            ),
            child: RoundedButton(
              text: "Continue",
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).accentColor,
              press: () {
                if (validateAndSave()) {
                  Navigator.pushNamed(context, VerifyPhoneNumber.routeName,
                      arguments: phoneNum(
                          phoneNumber: phone,
                          phoneRequestModel: phoneRequestModel));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final phoneFormKey = _formKey.currentState;
    if (phoneFormKey.validate()) {
      phoneFormKey.save();
      return true;
    } else
      return false;
  }

  TextFormField buildPhoneField() {
    return TextFormField(
      style: Theme.of(context).textTheme.subtitle1,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      decoration: InputDecoration(
        hintText: "enter Your Phone Number",
        hintStyle: Theme.of(context).textTheme.bodyText2,
        border: OutlineInputBorder(),
      ),
      onSaved: (newValue) {
        String numberCodeFormat = "+20${newValue}";
        phoneRequestModel.phoneNumber = numberCodeFormat;
        setPrefPhoneNumber(numberCodeFormat);
      },
      onChanged: (value) {
        this.phone = value;
        if (value.isNotEmpty) {
          removeError(error: NullPhoneNumberError);
          removeError(error: SmallPhoneNumberError);
          removeError(error: ValidPhoneNumberError);
          removeError(error: StartWithOneNumberError);
          return "";
        }
        if (value.length > 10) {
          removeError(error: SmallPhoneNumberError);
          return "";
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: NullPhoneNumberError);
          return "";
        } else if (value.length < 10) {
          addError(error: SmallPhoneNumberError);
          return "";
        }
        if (value.startsWith("1")) {
          if (phoneValidatorRegExp.hasMatch(value) == true) {
            removeError(error: ValidPhoneNumberError);
            //return "";
          } else if (phoneValidatorRegExp.hasMatch(value) == false) {
            addError(error: ValidPhoneNumberError);
            return "";
          }
        } else {
          addError(error: StartWithOneNumberError);
          return "";
        }
        return null;
      },
    );
  }
}
