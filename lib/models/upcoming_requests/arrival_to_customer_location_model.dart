// To parse this JSON data, do
//
//     final arrivalToCustomerLocationRequestModel = arrivalToCustomerLocationRequestModelFromJson(jsonString);

import 'dart:convert';

ArrivalToCustomerLocationRequestModel
    arrivalToCustomerLocationRequestModelFromJson(String str) =>
        ArrivalToCustomerLocationRequestModel.fromJson(json.decode(str));

String arrivalToCustomerLocationRequestModelToJson(
        ArrivalToCustomerLocationRequestModel data) =>
    json.encode(data.toJson());

class ArrivalToCustomerLocationRequestModel {
  ArrivalToCustomerLocationRequestModel({
    this.driverResponse,
  });

  String driverResponse;

  factory ArrivalToCustomerLocationRequestModel.fromJson(
          Map<String, dynamic> json) =>
      ArrivalToCustomerLocationRequestModel(
        driverResponse: json["driverResponse"],
      );

  Map<String, dynamic> toJson() => {
        "driverResponse": driverResponse,
      };
}
// To parse this JSON data, do
//
//     final arrivalToCustomerLocationResponseModel = arrivalToCustomerLocationResponseModelFromJson(jsonString);

ArrivalToCustomerLocationResponseModel
    arrivalToCustomerLocationResponseModelFromJson(String str) =>
        ArrivalToCustomerLocationResponseModel.fromJson(json.decode(str));

String arrivalToCustomerLocationResponseModelToJson(
        ArrivalToCustomerLocationResponseModel data) =>
    json.encode(data.toJson());

class ArrivalToCustomerLocationResponseModel {
  ArrivalToCustomerLocationResponseModel({
    this.msg,
    this.error,
  });

  String msg;
  String error;

  factory ArrivalToCustomerLocationResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ArrivalToCustomerLocationResponseModel(
        msg: json["msg"],
        error: json["Error"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "Error": error,
      };
}
