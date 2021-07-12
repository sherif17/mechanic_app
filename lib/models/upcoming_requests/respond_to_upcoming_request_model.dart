// To parse this JSON data, do
//
//     final respondToUpcomingRequestRequestModel = respondToUpcomingRequestRequestModelFromJson(jsonString);

import 'dart:convert';

RespondToUpcomingRequestRequestModel
    respondToUpcomingRequestRequestModelFromJson(String str) =>
        RespondToUpcomingRequestRequestModel.fromJson(json.decode(str));

String respondToUpcomingRequestRequestModelToJson(
        RespondToUpcomingRequestRequestModel data) =>
    json.encode(data.toJson());

class RespondToUpcomingRequestRequestModel {
  RespondToUpcomingRequestRequestModel({
    this.mechanicResponse,
  });

  String mechanicResponse;

  factory RespondToUpcomingRequestRequestModel.fromJson(
          Map<String, dynamic> json) =>
      RespondToUpcomingRequestRequestModel(
        mechanicResponse: json["mechanicResponse"],
      );

  Map<String, dynamic> toJson() => {
        "mechanicResponse": mechanicResponse,
      };
}
// To parse this JSON data, do
//
//     final respondToUpcomingRequestResponseModel = respondToUpcomingRequestResponseModelFromJson(jsonString);

RespondToUpcomingRequestResponseModel
    respondToUpcomingRequestResponseModelFromJson(String str) =>
        RespondToUpcomingRequestResponseModel.fromJson(json.decode(str));

String respondToUpcomingRequestResponseModelToJson(
        RespondToUpcomingRequestResponseModel data) =>
    json.encode(data.toJson());

class RespondToUpcomingRequestResponseModel {
  RespondToUpcomingRequestResponseModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.estimatedTime,
    this.estimatedFare,
    this.msg,
  });

  String firstName;
  String lastName;
  String phoneNumber;
  String estimatedTime;
  String estimatedFare;
  String msg;

  factory RespondToUpcomingRequestResponseModel.fromJson(
          Map<String, dynamic> json) =>
      RespondToUpcomingRequestResponseModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        estimatedTime: json["EstimatedTime"],
        estimatedFare: json["EstimatedFare"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "EstimatedTime": estimatedTime,
        "EstimatedFare": estimatedFare,
        "msg": msg,
      };
}
