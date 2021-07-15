// To parse this JSON data, do
//
//     final getNearestClientRequestModel = getNearestClientRequestModelFromJson(jsonString);

import 'dart:convert';

GetNearestClientRequestModel getNearestClientRequestModelFromJson(String str) =>
    GetNearestClientRequestModel.fromJson(json.decode(str));

String getNearestClientRequestModelToJson(GetNearestClientRequestModel data) =>
    json.encode(data.toJson());

class GetNearestClientRequestModel {
  GetNearestClientRequestModel({
    this.locationLat,
    this.locationLong,
  });

  String locationLat;
  String locationLong;

  factory GetNearestClientRequestModel.fromJson(Map<String, dynamic> json) =>
      GetNearestClientRequestModel(
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
//     final getNearestClientResponseModel = getNearestClientResponseModelFromJson(jsonString);

GetNearestClientResponseModel getNearestClientResponseModelFromJson(
        String str) =>
    GetNearestClientResponseModel.fromJson(json.decode(str));

String getNearestClientResponseModelToJson(
        GetNearestClientResponseModel data) =>
    json.encode(data.toJson());

class GetNearestClientResponseModel {
  GetNearestClientResponseModel({
    this.nearestRidePickupLocation,
    this.initialDiagnosis,
    this.carBrand,
    this.carModel,
    this.carYear,
    this.carPlates,
    this.error,
    this.requestId,
  });

  NearestRidePickupLocation nearestRidePickupLocation;
  List<InitialDiagnosis> initialDiagnosis;
  String carBrand;
  String carModel;
  int carYear;
  String carPlates;
  String error;
  String requestId;

  factory GetNearestClientResponseModel.fromJson(Map<String, dynamic> json) =>
      GetNearestClientResponseModel(
        nearestRidePickupLocation: NearestRidePickupLocation.fromJson(
            json["Nearest Ride: Pickup Location"]),
        initialDiagnosis: List<InitialDiagnosis>.from(
            json["Initial Diagnosis"].map((x) => InitialDiagnosis.fromJson(x))),
        carBrand: json["CarBrand"],
        carModel: json["CarModel"],
        carYear: json["CarYear"],
        carPlates: json["CarPlates"],
        error: json["error"],
        requestId: json["requestId"],
      );

  Map<String, dynamic> toJson() => {
        "Nearest Ride: Pickup Location": nearestRidePickupLocation.toJson(),
        "Initial Diagnosis":
            List<dynamic>.from(initialDiagnosis.map((x) => x.toJson())),
        "CarBrand": carBrand,
        "CarModel": carModel,
        "CarYear": carYear,
        "CarPlates": carPlates,
        "error": error,
        "requestId": requestId,
      };
}

class InitialDiagnosis {
  InitialDiagnosis({
    this.requestCategory,
    this.problemCategory,
    this.problem,
    this.subProblem,
    this.serviceCategory,
    this.serviceDesc,
    this.serviceFare,
  });

  String requestCategory;
  String problemCategory;
  String problem;
  String subProblem;
  String serviceCategory;
  String serviceDesc;
  int serviceFare;

  factory InitialDiagnosis.fromJson(Map<String, dynamic> json) =>
      InitialDiagnosis(
        requestCategory: json["RequestCategory"],
        problemCategory:
            json["ProblemCategory"] == null ? null : json["ProblemCategory"],
        problem: json["Problem"] == null ? null : json["Problem"],
        subProblem: json["SubProblem"] == null ? null : json["SubProblem"],
        serviceCategory:
            json["ServiceCategory"] == null ? null : json["ServiceCategory"],
        serviceDesc: json["ServiceDesc"] == null ? null : json["ServiceDesc"],
        serviceFare: json["ServiceFare"] == null ? null : json["ServiceFare"],
      );

  Map<String, dynamic> toJson() => {
        "RequestCategory": requestCategory,
        "ProblemCategory": problemCategory == null ? null : problemCategory,
        "Problem": problem == null ? null : problem,
        "SubProblem": subProblem == null ? null : subProblem,
        "ServiceCategory": serviceCategory == null ? null : serviceCategory,
        "ServiceDesc": serviceDesc == null ? null : serviceDesc,
        "ServiceFare": serviceFare == null ? null : serviceFare,
      };
}

class NearestRidePickupLocation {
  NearestRidePickupLocation({
    this.lat,
    this.lng,
  });

  String lat;
  String lng;

  factory NearestRidePickupLocation.fromJson(Map<String, dynamic> json) =>
      NearestRidePickupLocation(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
