// To parse this JSON data, do
//
//     final liveTrackerRequestModel = liveTrackerRequestModelFromJson(jsonString);

import 'dart:convert';

LiveTrackerRequestModel liveTrackerRequestModelFromJson(String str) =>
    LiveTrackerRequestModel.fromJson(json.decode(str));

String liveTrackerRequestModelToJson(LiveTrackerRequestModel data) =>
    json.encode(data.toJson());

class LiveTrackerRequestModel {
  LiveTrackerRequestModel({
    this.locationLat,
    this.locationLong,
  });

  String locationLat;
  String locationLong;

  factory LiveTrackerRequestModel.fromJson(Map<String, dynamic> json) =>
      LiveTrackerRequestModel(
        locationLat: json["Location_Lat"],
        locationLong: json["Location_Long"],
      );

  Map<String, dynamic> toJson() => {
        "Location_Lat": locationLat,
        "Location_Long": locationLong,
      };
}
// To parse this JSON data, do
//
//     final liveTrackerResponseModel = liveTrackerResponseModelFromJson(jsonString);

LiveTrackerResponseModel liveTrackerResponseModelFromJson(String str) =>
    LiveTrackerResponseModel.fromJson(json.decode(str));

String liveTrackerResponseModelToJson(LiveTrackerResponseModel data) =>
    json.encode(data.toJson());

class LiveTrackerResponseModel {
  LiveTrackerResponseModel({
    this.done,
  });

  String done;

  factory LiveTrackerResponseModel.fromJson(Map<String, dynamic> json) =>
      LiveTrackerResponseModel(
        done: json["Done"],
      );

  Map<String, dynamic> toJson() => {
        "Done": done,
      };
}
