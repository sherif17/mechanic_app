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
    this.dropoffLocation,
    this.error,
    this.requestId,
    this.CarBrand,
    this.CarModel,
    this.CarYear,
    this.CarPlates,
  });

  Location nearestRidePickupLocation;
  Location dropoffLocation;
  String error;
  String requestId;
  String CarBrand;
  String CarModel;
  int CarYear;
  String CarPlates;

  factory GetNearestClientResponseModel.fromJson(Map<String, dynamic> json) =>
      GetNearestClientResponseModel(
        nearestRidePickupLocation: json["Nearest Ride: Pickup Location"] != null
            ? Location.fromJson(json["Nearest Ride: Pickup Location"])
            : null,
        dropoffLocation: json["Dropoff Location"] != null
            ? Location.fromJson(json["Dropoff Location"])
            : null,
        error: json["error"],
        requestId: json["requestId"],
        CarBrand: json["CarBrand"],
        CarModel: json["CarModel"],
        CarPlates: json["CarPlates"],
        CarYear: json["CarYear"],
      );

  Map<String, dynamic> toJson() => {
        "Nearest Ride: Pickup Location": nearestRidePickupLocation.toJson(),
        "Dropoff Location": dropoffLocation.toJson(),
        "error": error,
        "requestId": requestId,
        "CarBrand": CarBrand,
        "CarModel": CarModel,
        "CarPlates": CarPlates,
        "CarYear": CarYear,
      };
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  String lat;
  String lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
