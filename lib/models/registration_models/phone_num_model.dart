// To parse this JSON data, do
//
//     final phoneRequestModel = phoneRequestModelFromJson(jsonString);

import 'dart:convert';

PhoneRequestModel phoneRequestModelFromJson(String str) =>
    PhoneRequestModel.fromJson(json.decode(str));

String phoneRequestModelToJson(PhoneRequestModel data) =>
    json.encode(data.toJson());

class PhoneRequestModel {
  PhoneRequestModel({
    this.phoneNumber,
    this.fireBaseId,
  });

  String phoneNumber;
  String fireBaseId;

  factory PhoneRequestModel.fromJson(Map<String, dynamic> json) =>
      PhoneRequestModel(
        phoneNumber: json["phoneNumber"],
        fireBaseId: json["fireBaseId"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "fireBaseId": fireBaseId,
      };
}

// To parse this JSON data, do
//
//     final phoneResponseModel = phoneResponseModelFromJson(jsonString);

PhoneResponseModel phoneResponseModelFromJson(String str) =>
    PhoneResponseModel.fromJson(json.decode(str));

String phoneResponseModelToJson(PhoneResponseModel data) =>
    json.encode(data.toJson());

class PhoneResponseModel {
  PhoneResponseModel({
    this.token,
    this.firstName,
    this.lastName,
    this.governorate,
    this.error,
  });

  String token;
  String firstName;
  String lastName;
  String governorate;
  String error;

  factory PhoneResponseModel.fromJson(Map<String, dynamic> json) =>
      PhoneResponseModel(
        token: json["token"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        governorate: json["governorate"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "firstName": firstName,
        "lastName": lastName,
        "governorate": governorate,
        "error": error,
      };
}
