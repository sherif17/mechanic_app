import 'dart:async';

import 'package:flutter/cupertino.dart';
//import 'package:flutter_mapbox_navigation/library.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:mechanic_app/local_db/winch_driver_info_db.dart';
import 'package:mechanic_app/models/maps/address.dart';
import 'package:mechanic_app/services/Maps_Assistants/maps_services.dart';

class MapsProvider extends ChangeNotifier {
  Address customerPickUpLocation = Address(descriptor: "PickUp");
  Address customerDropOffLocation = Address(descriptor: "DropOff");
  Address currentLocation = Address(descriptor: "My current Position");
  GoogleMapController googleMapController;
  //MapBoxNavigation _directions;
  //MapBoxOptions _options;
  bool _isMultipleStop = false;
  double _distanceRemaining, _durationRemaining;
  //MapBoxNavigationViewController _controller;
  bool _routeBuilt = false;
  bool _isNavigating = false;
  bool _arrived = false;
  String _instruction = "";

  void updateCustomerPickUpLocationAddress(Address pickUpAddress) {
    customerPickUpLocation = pickUpAddress;
    notifyListeners();
  }

  void updateCustomerDropOffLocationAddress(Address dropOffAddress) {
    customerDropOffLocation = dropOffAddress;
    notifyListeners();
  }

  void updateCurrentLocation(context) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentLocation.latitude = position.latitude;
    currentLocation.longitude = position.longitude;
    await getCurrentLocationAddress(
        position.latitude.toString(), position.longitude.toString(), context);
    print("Current position:: ${currentLocation.placeName}");
    notifyListeners();
  }

  void locatePosition(context, {bool x}) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentLocation.latitude = position.latitude;
    currentLocation.longitude = position.longitude;
    await getCurrentLocationAddress(
        position.latitude.toString(), position.longitude.toString(), context);
    print("Current position:: ${currentLocation.placeName}");
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: x == true ? 14 : 15.5);
    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  getPickUpAddress(String pickUpPositionLatitude,
      String pickUpPositionLongitude, context) async {
    customerPickUpLocation.latitude = double.parse(pickUpPositionLatitude);
    customerPickUpLocation.longitude = double.parse(pickUpPositionLongitude);
    LatLng pickUpPosition = LatLng(
        customerPickUpLocation.latitude, customerPickUpLocation.longitude);
    customerPickUpLocation.placeName =
        await MapsApiService.searchCoordinateAddress(pickUpPosition, context);

    print("Customer pickUp location:: ${customerPickUpLocation.placeName}");
    print("updated");
    print("provider pickUp location:: $customerPickUpLocation");
    print("provider pickup latitude:: ${customerPickUpLocation.latitude}");
    print("provider pickup longitude:: ${customerPickUpLocation.longitude}");
    print("provider pickup place name:: ${customerPickUpLocation.placeName}");
    notifyListeners();
  }

  getDropOffAddress(String dropOffPositionLatitude,
      String dropOffPositionLongitude, context) async {
    customerDropOffLocation.latitude = double.parse(dropOffPositionLatitude);
    customerDropOffLocation.longitude = double.parse(dropOffPositionLongitude);
    LatLng dropOffPosition = LatLng(
        customerDropOffLocation.latitude, customerDropOffLocation.longitude);
    customerDropOffLocation.placeName =
        await MapsApiService.searchCoordinateAddress(dropOffPosition, context);

    print("updated");
    print("provider dropOff location:: $customerDropOffLocation");
    print("provider dropOff latitude:: ${customerDropOffLocation.latitude}");
    print("provider dropOff longitude:: ${customerDropOffLocation.longitude}");
    print("provider dropOff place name:: ${customerDropOffLocation.placeName}");
    notifyListeners();
  }

  getCurrentLocationAddress(String currentPositionLatitude,
      String currentPositionLongitude, context) async {
    currentLocation.latitude = double.parse(currentPositionLatitude);
    currentLocation.longitude = double.parse(currentPositionLongitude);
    LatLng currentPosition =
        LatLng(currentLocation.latitude, currentLocation.longitude);
    currentLocation.placeName =
        await MapsApiService.searchCoordinateAddress(currentPosition, context);

    print("updated");
    print("provider Current location:: $currentLocation");
    print("provider Current latitude:: ${currentLocation.latitude}");
    print("provider Current longitude:: ${currentLocation.longitude}");
    print("provider Current place name:: ${currentLocation.placeName}");
    notifyListeners();
  }

  launchGMapFromWinchToCustomer() async {
    String fromWinchToCustomerGMapUrl =
        "https://www.google.com/maps/dir/?api=1&origin=${currentLocation.latitude},${currentLocation.longitude}&destination=${customerPickUpLocation.latitude},${customerPickUpLocation.longitude}&travelmode=driving&dir_action=navigate";
    return await canLaunch(fromWinchToCustomerGMapUrl)
        ? await launch(fromWinchToCustomerGMapUrl)
        : throw 'Could not launch $fromWinchToCustomerGMapUrl';
  }

  // beginMapBoxNavigationFromWinchToCustomer() async {
  //   _directions = MapBoxNavigation(onRouteEvent: _onRouteEvent);
  //   final cityhall = WayPoint(
  //       name: currentLocation.placeName,
  //       latitude: currentLocation.latitude,
  //       longitude: currentLocation.longitude);
  //   final downtown = WayPoint(
  //       name: customerPickUpLocation.placeName,
  //       latitude: customerPickUpLocation.latitude,
  //       longitude: customerPickUpLocation.longitude);
  //   var wayPoints = <WayPoint>[];
  //   wayPoints.add(cityhall);
  //   wayPoints.add(downtown);
  //   _options = MapBoxOptions(
  //       initialLatitude: currentLocation.latitude,
  //       initialLongitude: currentLocation.longitude,
  //       zoom: 13.0,
  //       tilt: 0.0,
  //       bearing: 0.0,
  //       enableRefresh: true,
  //       alternatives: true,
  //       voiceInstructionsEnabled: true,
  //       bannerInstructionsEnabled: true,
  //       allowsUTurnAtWayPoints: true,
  //       mode: MapBoxNavigationMode.drivingWithTraffic,
  //       // mapStyleUrlDay: "https://url_to_day_style",
  //       // mapStyleUrlNight: "https://url_to_night_style",
  //       units: VoiceUnits.metric,
  //       simulateRoute: true,
  //       animateBuildRoute: true,
  //       isOptimized: true,
  //       enableFreeDriveMode: true,
  //       language: "ar");
  //   await _directions.startNavigation(wayPoints: wayPoints, options: _options);
  // }
  //
  // Future<void> _onRouteEvent(e) async {
  //   _distanceRemaining = await _directions.distanceRemaining;
  //   _durationRemaining = await _directions.durationRemaining;
  //
  //   switch (e.eventType) {
  //     case MapBoxEvent.progress_change:
  //       var progressEvent = e.data as RouteProgressEvent;
  //       _arrived = progressEvent.arrived;
  //       if (progressEvent.currentStepInstruction != null)
  //         _instruction = progressEvent.currentStepInstruction;
  //       break;
  //     case MapBoxEvent.route_building:
  //     case MapBoxEvent.route_built:
  //       _routeBuilt = true;
  //       break;
  //     case MapBoxEvent.route_build_failed:
  //       _routeBuilt = false;
  //       break;
  //     case MapBoxEvent.navigation_running:
  //       _isNavigating = true;
  //       break;
  //     case MapBoxEvent.on_arrival:
  //       _arrived = true;
  //       if (!_isMultipleStop) {
  //         await Future.delayed(Duration(seconds: 3));
  //         await _controller.finishNavigation();
  //       } else {}
  //       break;
  //     case MapBoxEvent.navigation_finished:
  //     case MapBoxEvent.navigation_cancelled:
  //       _routeBuilt = false;
  //       _isNavigating = false;
  //       break;
  //     default:
  //       break;
  //   }
  //   //refresh UI
  //   //setState(() {});
  // }

}
