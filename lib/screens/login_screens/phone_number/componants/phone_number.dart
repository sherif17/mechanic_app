import 'package:flutter/material.dart';
import 'package:mechanic_app/models/phone_num_model.dart';

class phoneNum {
  PhoneRequestModel phoneRequestModel;
  String phoneNumber;
  String Fname;
  String LName;
  String info;
  ScaffoldState scafoldKey;
  phoneNum(
      {this.phoneNumber,
      this.phoneRequestModel,
      this.Fname,
      this.LName,
      this.info});
}
