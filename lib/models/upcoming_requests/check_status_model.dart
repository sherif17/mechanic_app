// To parse this JSON data, do
//
//     final checkStatusResponseModel = checkStatusResponseModelFromJson(jsonString);

import 'dart:convert';

CheckStatusResponseModel checkStatusResponseModelFromJson(String str) =>
    CheckStatusResponseModel.fromJson(json.decode(str));

String checkStatusResponseModelToJson(CheckStatusResponseModel data) =>
    json.encode(data.toJson());

class CheckStatusResponseModel {
  CheckStatusResponseModel({
    this.error,
    this.status,
    this.timePassedSinceRequestAcceptance,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.customerLocation,
    this.timePassedSinceDriverArrival,
    this.timePassedSinceServiceStart,
    this.customerResponse,
    this.fare,
  });

  String error;
  String status;
  double timePassedSinceRequestAcceptance;
  String firstName;
  String lastName;
  String phoneNumber;
  CustomerLocation customerLocation;
  double timePassedSinceDriverArrival;
  double timePassedSinceServiceStart;
  bool customerResponse;
  int fare;

  factory CheckStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      CheckStatusResponseModel(
        error: json["error"],
        status: json["Status"],
        timePassedSinceRequestAcceptance:
            json["Time Passed Since Request Acceptance"].toDouble(),
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        customerLocation: CustomerLocation.fromJson(json["Customer_Location"]),
        timePassedSinceDriverArrival:
            json["Time Passed Since Driver Arrival"].toDouble(),
        timePassedSinceServiceStart:
            json["Time Passed Since Service Start "].toDouble(),
        customerResponse: json["customerResponse"],
        fare: json["Fare"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "Status": status,
        "Time Passed Since Request Acceptance":
            timePassedSinceRequestAcceptance,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "Customer_Location": customerLocation.toJson(),
        "Time Passed Since Driver Arrival": timePassedSinceDriverArrival,
        "Time Passed Since Service Start ": timePassedSinceServiceStart,
        "customerResponse": customerResponse,
        "Fare": fare,
      };
}

class CustomerLocation {
  CustomerLocation({
    this.lat,
    this.lng,
  });

  String lat;
  String lng;

  factory CustomerLocation.fromJson(Map<String, dynamic> json) =>
      CustomerLocation(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
