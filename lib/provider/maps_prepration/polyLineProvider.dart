import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/models/maps/address.dart';
import 'package:mechanic_app/models/maps/direction_details.dart';
import 'package:mechanic_app/screens/dash_board/profile/profile_body.dart';
import 'package:mechanic_app/services/Maps_Assistants/maps_services.dart';
import 'package:mechanic_app/widgets/progress_Dialog.dart';

class PolyLineProvider extends ChangeNotifier {
  DirectionDetails tripDirectionDetails = DirectionDetails();
  List<LatLng> pLineCoordinates = [];
  Set<Polyline> polylineSet = {};
  Set<Marker> markersSet = {};
  Set<Circle> circlesSet = {};

  void resetPolyLine() {
    polylineSet.clear();
    markersSet.clear();
    circlesSet.clear();
    pLineCoordinates.clear();
    notifyListeners();
  }

  Future<void> getPlaceDirection(context, Address initialPosition,
      Address finalPosition, GoogleMapController _googleMapController) async {
    var winchLatLng =
        LatLng(initialPosition.latitude, initialPosition.longitude);
    var pickUpLatLng = LatLng(finalPosition.latitude, finalPosition.longitude);

    print("Done 1");
    showDialog(
        context: context,
        builder: (BuildContext context) => ProgressDialog(
            message: loadCurrentLangFromDB() == "en"
                ? "Please wait.."
                : "انتظر قليلا...."));

    print("Done 2");
    var details = await MapsApiService.obtainPlaceDirectionDetails(
        winchLatLng, pickUpLatLng);

    print("Done 3");

    tripDirectionDetails = details;

    print("Done 4");
    Navigator.pop(context);

    print("This is Encoded Points ::");
    print(details.encodedPoints);

    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPolylinePointsResult =
        polylinePoints.decodePolyline(details.encodedPoints);

    pLineCoordinates.clear();

    if (decodedPolylinePointsResult.isNotEmpty) {
      decodedPolylinePointsResult.forEach((PointLatLng pointLatLng) {
        pLineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }
    polylineSet.clear();

    Polyline polyline = Polyline(
      color: Theme.of(context).primaryColor,
      polylineId: PolylineId("PolylineID"),
      jointType: JointType.round,
      points: pLineCoordinates,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      geodesic: true,
    );
    polylineSet.add(polyline);

    LatLngBounds latLngBounds;

    if (winchLatLng.latitude > pickUpLatLng.latitude &&
        winchLatLng.longitude > pickUpLatLng.longitude) {
      latLngBounds =
          LatLngBounds(southwest: pickUpLatLng, northeast: winchLatLng);
    } else if (winchLatLng.longitude > pickUpLatLng.longitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(winchLatLng.latitude, pickUpLatLng.longitude),
          northeast: LatLng(pickUpLatLng.latitude, winchLatLng.longitude));
    } else if (winchLatLng.latitude > pickUpLatLng.latitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(pickUpLatLng.latitude, winchLatLng.longitude),
          northeast: LatLng(winchLatLng.latitude, pickUpLatLng.longitude));
    } else {
      latLngBounds =
          LatLngBounds(southwest: winchLatLng, northeast: pickUpLatLng);
    }

    _googleMapController
        .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));

    String initialSnippet = initialPosition.descriptor + " location";
    Marker winchLocMarker = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        infoWindow: InfoWindow(
            title: initialPosition.placeName, snippet: initialSnippet),
        position: winchLatLng,
        markerId: MarkerId("winchId"));

    Marker pickUpLocMarker = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(
            title: finalPosition.placeName, snippet: "PickUp location"),
        position: pickUpLatLng,
        markerId: MarkerId("pickUpId"));

    markersSet.add(winchLocMarker);
    markersSet.add(pickUpLocMarker);

    Circle winchLocCircle = Circle(
      fillColor: Colors.blue,
      center: winchLatLng,
      radius: 12.0,
      strokeWidth: 4,
      strokeColor: Colors.blue,
      circleId: CircleId("winchId"),
    );

    Circle pickUpLocCircle = Circle(
      fillColor: Theme.of(context).hintColor,
      center: pickUpLatLng,
      radius: 12.0,
      strokeWidth: 4,
      strokeColor: Theme.of(context).hintColor,
      circleId: CircleId("pickUpId"),
    );

    circlesSet.add(winchLocCircle);
    circlesSet.add(pickUpLocCircle);

    print("polyline");
    notifyListeners();
  }

  Future<void> getPlaceDirectionWithCustomMarker(
      context,
      Address initialPosition,
      Address finalPosition,
      GoogleMapController _googleMapController,
      BitmapDescriptor startMapMarker,
      BitmapDescriptor destinationMapMarker) async {
    var winchLatLng =
        LatLng(initialPosition.latitude, initialPosition.longitude);
    var pickUpLatLng = LatLng(finalPosition.latitude, finalPosition.longitude);
    showDialog(
        context: context,
        builder: (BuildContext context) => ProgressDialog(
            message: loadCurrentLangFromDB() == "en"
                ? "Please wait.."
                : "انتظر قليلا...."));
    var details = await MapsApiService.obtainPlaceDirectionDetails(
        winchLatLng, pickUpLatLng);
    tripDirectionDetails = details;
    Navigator.pop(context);
    print("This is Encoded Points ::");
    print(details.encodedPoints);
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPolylinePointsResult =
        polylinePoints.decodePolyline(details.encodedPoints);
    pLineCoordinates.clear();
    if (decodedPolylinePointsResult.isNotEmpty) {
      decodedPolylinePointsResult.forEach((PointLatLng pointLatLng) {
        pLineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }
    polylineSet.clear();
    Polyline polyline = Polyline(
      color: Theme.of(context).primaryColor,
      polylineId: PolylineId("PolylineID"),
      jointType: JointType.round,
      points: pLineCoordinates,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      geodesic: true,
    );
    polylineSet.add(polyline);
    LatLngBounds latLngBounds;
    if (winchLatLng.latitude > pickUpLatLng.latitude &&
        winchLatLng.longitude > pickUpLatLng.longitude) {
      latLngBounds =
          LatLngBounds(southwest: pickUpLatLng, northeast: winchLatLng);
    } else if (winchLatLng.longitude > pickUpLatLng.longitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(winchLatLng.latitude, pickUpLatLng.longitude),
          northeast: LatLng(pickUpLatLng.latitude, winchLatLng.longitude));
    } else if (winchLatLng.latitude > pickUpLatLng.latitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(pickUpLatLng.latitude, winchLatLng.longitude),
          northeast: LatLng(winchLatLng.latitude, pickUpLatLng.longitude));
    } else {
      latLngBounds =
          LatLngBounds(southwest: winchLatLng, northeast: pickUpLatLng);
    }
    _googleMapController
        .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));
    String initialSnippet = initialPosition.descriptor + " location";
    Marker winchLocMarker = Marker(
        //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        icon: startMapMarker,
        infoWindow: InfoWindow(
            title: initialPosition.placeName, snippet: initialSnippet),
        position: winchLatLng,
        markerId: MarkerId("winchId"));
    Marker pickUpLocMarker = Marker(
        //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        icon: destinationMapMarker,
        infoWindow: InfoWindow(
            title: finalPosition.placeName, snippet: "PickUp location"),
        position: pickUpLatLng,
        markerId: MarkerId("pickUpId"));
    markersSet.add(winchLocMarker);
    markersSet.add(pickUpLocMarker);
    Circle winchLocCircle = Circle(
      fillColor: Colors.blue,
      center: winchLatLng,
      radius: 12.0,
      strokeWidth: 4,
      strokeColor: Colors.blue,
      circleId: CircleId("winchId"),
    );
    Circle pickUpLocCircle = Circle(
      fillColor: Theme.of(context).hintColor,
      center: pickUpLatLng,
      radius: 12.0,
      strokeWidth: 4,
      strokeColor: Theme.of(context).hintColor,
      circleId: CircleId("pickUpId"),
    );
    circlesSet.add(winchLocCircle);
    circlesSet.add(pickUpLocCircle);
    print("polyline");
    notifyListeners();
  }

  Future<void> getPlaceDirectionWithNav(context, Address initialPosition,
      Address finalPosition, GoogleMapController _googleMapController) async {
    var initialLatLng =
        LatLng(initialPosition.latitude, initialPosition.longitude);
    var initialPointLatLng =
        PointLatLng(initialPosition.latitude, initialPosition.longitude);
    var finalLatLng = LatLng(finalPosition.latitude, finalPosition.longitude);
    var finalPointLatLng =
        PointLatLng(finalPosition.latitude, finalPosition.longitude);

    showDialog(
        context: context,
        builder: (BuildContext context) => ProgressDialog(
            message: loadCurrentLangFromDB() == "en"
                ? "Please wait.."
                : "انتظر قليلا...."));

    // var details = await MapsApiService.obtainPlaceDirectionDetails(
    //   initialLatLng, finalLatLng);

    //tripDirectionDetails = details;

    Navigator.pop(context);

    //print("This is Encoded Points ::");
    //print(details.encodedPoints);

    PolylinePoints polylinePoints = PolylinePoints();

    String mapKey = "AIzaSyAbT3_43qH7mG81Ufy4xS-GbqDjo9rrPAU";
    String googleAPiKey =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPointLatLng.latitude},${initialPointLatLng.longitude}&destination=${finalPointLatLng.latitude},${finalPointLatLng.longitude}&key=$mapKey";
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey, initialPointLatLng, finalPointLatLng,
        travelMode: TravelMode.driving);
    //print(result.points);

    pLineCoordinates.clear();

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        pLineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    polylineSet.clear();

    Polyline polyline = Polyline(
      color: Theme.of(context).primaryColor,
      polylineId: PolylineId("PolylineID"),
      jointType: JointType.round,
      points: pLineCoordinates,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      geodesic: true,
    );
    polylineSet.add(polyline);

    LatLngBounds latLngBounds;

    if (initialLatLng.latitude > finalLatLng.latitude &&
        initialLatLng.longitude > finalLatLng.longitude) {
      latLngBounds =
          LatLngBounds(southwest: finalLatLng, northeast: initialLatLng);
    } else if (initialLatLng.longitude > finalLatLng.longitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(initialLatLng.latitude, finalLatLng.longitude),
          northeast: LatLng(finalLatLng.latitude, initialLatLng.longitude));
    } else if (initialLatLng.latitude > finalLatLng.latitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(finalLatLng.latitude, initialLatLng.longitude),
          northeast: LatLng(initialLatLng.latitude, finalLatLng.longitude));
    } else {
      latLngBounds =
          LatLngBounds(southwest: initialLatLng, northeast: finalLatLng);
    }

    _googleMapController
        .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));

    String initialSnippet = initialPosition.descriptor + " location";
    Marker winchLocMarker = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        infoWindow: InfoWindow(
            title: initialPosition.placeName, snippet: initialSnippet),
        position: initialLatLng,
        markerId: MarkerId("winchId"));

    Marker pickUpLocMarker = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(
            title: finalPosition.placeName, snippet: "PickUp location"),
        position: finalLatLng,
        markerId: MarkerId("pickUpId"));

    markersSet.add(winchLocMarker);
    markersSet.add(pickUpLocMarker);

    Circle winchLocCircle = Circle(
      fillColor: Colors.blue,
      center: initialLatLng,
      radius: 12.0,
      strokeWidth: 4,
      strokeColor: Colors.blue,
      circleId: CircleId("winchId"),
    );

    Circle pickUpLocCircle = Circle(
      fillColor: Theme.of(context).hintColor,
      center: finalLatLng,
      radius: 12.0,
      strokeWidth: 4,
      strokeColor: Theme.of(context).hintColor,
      circleId: CircleId("pickUpId"),
    );

    circlesSet.add(winchLocCircle);
    circlesSet.add(pickUpLocCircle);

    print("polyline");
    notifyListeners();
  }
}
