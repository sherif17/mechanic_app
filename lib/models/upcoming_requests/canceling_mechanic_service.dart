// To parse this JSON data, do
//
//     final cancelingMechanicServiceResponseModel = cancelingMechanicServiceResponseModelFromJson(jsonString);

import 'dart:convert';

CancelingMechanicServiceResponseModel
    cancelingMechanicServiceResponseModelFromJson(String str) =>
        CancelingMechanicServiceResponseModel.fromJson(json.decode(str));

String cancelingMechanicServiceResponseModelToJson(
        CancelingMechanicServiceResponseModel data) =>
    json.encode(data.toJson());

class CancelingMechanicServiceResponseModel {
  CancelingMechanicServiceResponseModel({
    this.status,
    this.details,
  });

  String status;
  String details;

  factory CancelingMechanicServiceResponseModel.fromJson(
          Map<String, dynamic> json) =>
      CancelingMechanicServiceResponseModel(
        status: json["Status"],
        details: json["Details"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Details": details,
      };
}
