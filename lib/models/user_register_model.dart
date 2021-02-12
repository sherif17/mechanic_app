import 'dart:convert';

WinchRegisterRequestModel winchRegisterRequestModelFromJson(String str) =>
    WinchRegisterRequestModel.fromJson(json.decode(str));

String winchRegisterRequestModelToJson(WinchRegisterRequestModel data) =>
    json.encode(data.toJson());

class WinchRegisterRequestModel {
  WinchRegisterRequestModel({
    this.firstName,
    this.lastName,
    this.governorate,
  });

  String firstName;
  String lastName;
  String governorate;

  factory WinchRegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      WinchRegisterRequestModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        governorate: json["governorate"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "governorate": governorate,
      };
}

// To parse this JSON data, do
//
//     final userRegisterResponseModel = userRegisterResponseModelFromJson(jsonString);

WinchRegisterResponseModel winchRegisterResponseModelFromJson(String str) =>
    WinchRegisterResponseModel.fromJson(json.decode(str));

String winchRegisterResponseModelToJson(WinchRegisterResponseModel data) =>
    json.encode(data.toJson());

class WinchRegisterResponseModel {
  WinchRegisterResponseModel({
    this.token,
    this.error,
  });

  String token;
  String error;

  factory WinchRegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      WinchRegisterResponseModel(
        token: json["token"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "error": error,
      };
}
