// To parse this JSON data, do
//
//     final endingMechanicServiceResponseModel = endingMechanicServiceResponseModelFromJson(jsonString);

import 'dart:convert';

EndingMechanicServiceResponseModel endingMechanicServiceResponseModelFromJson(
        String str) =>
    EndingMechanicServiceResponseModel.fromJson(json.decode(str));

String endingMechanicServiceResponseModelToJson(
        EndingMechanicServiceResponseModel data) =>
    json.encode(data.toJson());

class EndingMechanicServiceResponseModel {
  EndingMechanicServiceResponseModel({
    this.status,
    this.fare,
    this.totalTimeForService,
  });

  String status;
  double fare;
  TotalTimeForService totalTimeForService;

  factory EndingMechanicServiceResponseModel.fromJson(
          Map<String, dynamic> json) =>
      EndingMechanicServiceResponseModel(
        status: json["STATUS"],
        fare: json["Fare"],
        totalTimeForService:
            TotalTimeForService.fromJson(json["TotalTimeForService"]),
      );

  Map<String, dynamic> toJson() => {
        "STATUS": status,
        "Fare": fare,
        "TotalTimeForService": totalTimeForService.toJson(),
      };
}

class TotalTimeForService {
  TotalTimeForService({
    this.days,
    this.hours,
    this.minutes,
    this.seconds,
  });

  int days;
  int hours;
  int minutes;
  double seconds;

  factory TotalTimeForService.fromJson(Map<String, dynamic> json) =>
      TotalTimeForService(
        days: json["days"],
        hours: json["hours"],
        minutes: json["minutes"],
        seconds: json["seconds"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "days": days,
        "hours": hours,
        "minutes": minutes,
        "seconds": seconds,
      };
}
