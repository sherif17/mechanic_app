import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:mechanic_app/models/maps/address.dart';
import 'package:mechanic_app/models/maps/direction_details.dart';
import 'package:mechanic_app/services/Maps_Assistants/RequestAssistant.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapsApiService {
  static Future<String> searchCoordinateAddress(
      LatLng position, context) async {
    String mapKey = "AIzaSyAK0cIYx9Ph4ld0CzcG4LRFAWcNeXFAXT8";
    String placeAddress = "";
    String st1, st2, st3, st4;
    //String url = 'https//maps.googleapis.com/maps/api/geocode/json?lating-${position.latitude},${position.longitude}&key-$mapKey';
    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey';
    var response = await RequestAssistant.getRequest(url);
    if (response != "failed") {
      //placeAddress = response["results"][0]["formatted_address"];
      st1 = response["results"][0]["address_components"][0]["long_name"];
      st2 = response["results"][0]["address_components"][1]["long_name"];
      st3 = response["results"][0]["address_components"][2]["long_name"];
      st4 = response["results"][0]["address_components"][3]["long_name"];
      placeAddress = st1 + ", " + st2 + ", " + st3 + ", " + st4;
    }
    return placeAddress;
  }

  static Future<DirectionDetails> obtainPlaceDirectionDetails(
      LatLng initialPosition, LatLng finalPosition) async {
    String mapKey = "AIzaSyAbT3_43qH7mG81Ufy4xS-GbqDjo9rrPAU";
    String directionUrl =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&travelMode=${TravelMode.driving}&key=$mapKey";

    var res = await RequestAssistant.getRequest(directionUrl);

    if (res == "failed") {
      return null;
    }

    DirectionDetails directionsDetails = DirectionDetails();

    directionsDetails.encodedPoints =
        res["routes"][0]["overview_polyline"]["points"];
    directionsDetails.distanceText =
        res["routes"][0]["legs"][0]["distance"]["text"];
    directionsDetails.distanceValue =
        res["routes"][0]["legs"][0]["distance"]["value"];
    directionsDetails.durationText =
        res["routes"][0]["legs"][0]["duration"]["text"];
    directionsDetails.durationValue =
        res["routes"][0]["legs"][0]["duration"]["value"];

    return directionsDetails;
  }

  static int calculateFares(DirectionDetails directionDetails) {
    //in terms USD
    double timeTraveledFare = (directionDetails.durationValue / 60) * 0.20;
    double distanceTraveledFare =
        (directionDetails.distanceValue / 1000) * 0.20;
    double totalFareAmount = timeTraveledFare + distanceTraveledFare;

    //Local Currency
    //1$ = 16 egp
    double totalLocalAmount = totalFareAmount * 16;

    return totalLocalAmount.truncate();
  }
}
