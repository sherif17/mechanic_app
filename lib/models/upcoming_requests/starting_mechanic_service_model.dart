// To parse this JSON data, do
//
//     final startingMechanicServiceRequestModel = startingMechanicServiceRequestModelFromJson(jsonString);

import 'dart:convert';

StartingMechanicServiceRequestModel startingMechanicServiceRequestModelFromJson(
        String str) =>
    StartingMechanicServiceRequestModel.fromJson(json.decode(str));

String startingMechanicServiceRequestModelToJson(
        StartingMechanicServiceRequestModel data) =>
    json.encode(data.toJson());

class StartingMechanicServiceRequestModel {
  StartingMechanicServiceRequestModel({
    this.mechanicResponse,
  });

  String mechanicResponse;

  factory StartingMechanicServiceRequestModel.fromJson(
          Map<String, dynamic> json) =>
      StartingMechanicServiceRequestModel(
        mechanicResponse: json["mechanicResponse"],
      );

  Map<String, dynamic> toJson() => {
        "driverResponse": mechanicResponse,
      };
}
// To parse this JSON data, do
//
//     final startingMechanicServiceResponseModel = startingMechanicServiceResponseModelFromJson(jsonString);

StartingMechanicServiceResponseModel
    startingMechanicServiceResponseModelFromJson(String str) =>
        StartingMechanicServiceResponseModel.fromJson(json.decode(str));

String startingMechanicServiceResponseModelToJson(
        StartingMechanicServiceResponseModel data) =>
    json.encode(data.toJson());

class StartingMechanicServiceResponseModel {
  StartingMechanicServiceResponseModel({
    this.msg,
    this.error,
  });

  String msg;
  String error;

  factory StartingMechanicServiceResponseModel.fromJson(
          Map<String, dynamic> json) =>
      StartingMechanicServiceResponseModel(
        msg: json["msg"],
        error: json["Error"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "Error": error,
      };
}
