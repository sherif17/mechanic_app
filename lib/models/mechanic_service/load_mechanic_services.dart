// To parse this JSON data, do
//
//     final loadMechanicServicesResponseModel = loadMechanicServicesResponseModelFromJson(jsonString);

import 'dart:convert';

List<LoadMechanicServicesResponseModel>
    loadMechanicServicesResponseModelFromJson(String str) =>
        List<LoadMechanicServicesResponseModel>.from(json
            .decode(str)
            .map((x) => LoadMechanicServicesResponseModel.fromJson(x)));

String loadMechanicServicesResponseModelToJson(
        List<LoadMechanicServicesResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoadMechanicServicesResponseModel {
  LoadMechanicServicesResponseModel({
    this.id,
    this.category,
    this.serviceDesc,
    this.expectedFare,
    this.v,
  });

  String id;
  String category;
  String serviceDesc;
  int expectedFare;
  int v;

  factory LoadMechanicServicesResponseModel.fromJson(
          Map<String, dynamic> json) =>
      LoadMechanicServicesResponseModel(
        id: json["_id"],
        category: json["Category"],
        serviceDesc: json["ServiceDesc"],
        expectedFare: json["ExpectedFare"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Category": category,
        "ServiceDesc": serviceDesc,
        "ExpectedFare": expectedFare,
        "__v": v,
      };

  static List<LoadMechanicServicesResponseModel> parseMechanicServices(
      String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<LoadMechanicServicesResponseModel> mechanicServicesList = list
        .map((model) => LoadMechanicServicesResponseModel.fromJson(model))
        .toList();
    return mechanicServicesList;
  }
}
