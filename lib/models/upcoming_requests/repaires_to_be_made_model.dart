// To parse this JSON data, do
//
//     final repairsToBeMadeRequestModel = repairsToBeMadeRequestModelFromJson(jsonString);

import 'dart:convert';

RepairsToBeMadeRequestModel repairsToBeMadeRequestModelFromJson(String str) =>
    RepairsToBeMadeRequestModel.fromJson(json.decode(str));

String repairsToBeMadeRequestModelToJson(RepairsToBeMadeRequestModel data) =>
    json.encode(data.toJson());

class RepairsToBeMadeRequestModel {
  RepairsToBeMadeRequestModel({
    this.repairsneeded,
  });

  List<Repairsneeded> repairsneeded;

  factory RepairsToBeMadeRequestModel.fromJson(Map<String, dynamic> json) =>
      RepairsToBeMadeRequestModel(
        repairsneeded: List<Repairsneeded>.from(
            json["Repairsneeded"].map((x) => Repairsneeded.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Repairsneeded":
            List<dynamic>.from(repairsneeded.map((x) => x.toJson())),
      };
}

class Repairsneeded {
  Repairsneeded({
    this.id,
    this.category,
    this.number,
  });

  String id;
  String category;
  String number;

  factory Repairsneeded.fromJson(Map<String, dynamic> json) => Repairsneeded(
        id: json["id"],
        category: json["category"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "number": number,
      };
}
// To parse this JSON data, do
//
//     final repairsToBeMadeResponseModel = repairsToBeMadeResponseModelFromJson(jsonString);

RepairsToBeMadeResponseModel repairsToBeMadeResponseModelFromJson(String str) =>
    RepairsToBeMadeResponseModel.fromJson(json.decode(str));

String repairsToBeMadeResponseModelToJson(RepairsToBeMadeResponseModel data) =>
    json.encode(data.toJson());

class RepairsToBeMadeResponseModel {
  RepairsToBeMadeResponseModel({
    this.msg,
    this.error,
  });

  String msg;
  String error;

  factory RepairsToBeMadeResponseModel.fromJson(Map<String, dynamic> json) =>
      RepairsToBeMadeResponseModel(
        msg: json["Msg"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "error": error,
      };
}
