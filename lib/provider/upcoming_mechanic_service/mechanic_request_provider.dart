import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/models/maps/address.dart';
import 'package:mechanic_app/models/upcoming_requests/arrival_to_customer_location_model.dart';
import 'package:mechanic_app/models/upcoming_requests/canceling_mechanic_service.dart';
import 'package:mechanic_app/models/upcoming_requests/ending_mechanic_service.dart';
import 'package:mechanic_app/models/upcoming_requests/get_nearest_client_model.dart';
import 'package:mechanic_app/models/upcoming_requests/live_tracker_model.dart';
import 'package:mechanic_app/models/upcoming_requests/respond_to_upcoming_request_model.dart';
import 'package:mechanic_app/models/upcoming_requests/starting_mechanic_service_model.dart';
import 'package:mechanic_app/provider/maps_prepration/maps_provider.dart';
import 'package:mechanic_app/provider/maps_prepration/polyLineProvider.dart';
import 'package:mechanic_app/screens/dash_board/dash_board.dart';
import 'package:mechanic_app/screens/dash_board/home/upcoming_request/upcoming_request.dart';
import 'package:mechanic_app/services/requesting_mechanic/mechanic_request_service.dart';
import 'package:provider/provider.dart';

class MechanicRequestProvider extends ChangeNotifier {
  bool mechanicCurrentState = false;
  bool isLoading = false;
  Timer liveTrackerTimer;
  Timer searchingForCustomerTimer;
  Position mechanicCurrentPosition;

  bool SEARCHING_FOR_CUSTOMER = false;
  bool CUSTOMER_FOUNDED = false;
  bool ALREADY_HAVE_RIDE = false;
  bool RIDE_ACCEPTED = false;
  bool DriverARRIVED = false;
  bool SERVICE_STARTTED = false;
  bool SERVICE_FINISHED = false;
  bool isPopRequestDataReady = false;
  bool RATING_SUBMITTED = false;
  bool CANCELLING_SERVICE = false;
  bool isHomeMapOpened = false;
  //BuildContext ctx;

  MechanicRequestService requestService = MechanicRequestService();
  /////////////////////////////////////////////////////////////////////////////
  GetNearestClientRequestModel getNearestClientRequestModel =
      new GetNearestClientRequestModel();
  GetNearestClientResponseModel getNearestClientResponseModel =
      new GetNearestClientResponseModel();
  /////////////////////////////////////////////////////////////////////////////
  RespondToUpcomingRequestRequestModel upcomingRequestAcceptRequestModel =
      RespondToUpcomingRequestRequestModel(mechanicResponse: "Accept");
  RespondToUpcomingRequestRequestModel upcomingRequestDenyRequestModel =
      RespondToUpcomingRequestRequestModel(mechanicResponse: "Deny");
  RespondToUpcomingRequestResponseModel upcomingRequestResponseModel =
      RespondToUpcomingRequestResponseModel();
  /////////////////////////////////////////////////////////////////////////////
  // EndingWinchServiceRequestModel endingWinchServiceRequestModel =
  //     EndingWinchServiceRequestModel();
  EndingMechanicServiceResponseModel endingWinchServiceResponseModel =
      EndingMechanicServiceResponseModel();
  /////////////////////////////////////////////////////////////////////////////
  // RatingForCustomerRequestModel ratingForCustomerRequestModel =
  //     RatingForCustomerRequestModel();
  // RatingForCustomerResponseModel ratingForCustomerResponseModel =
  //     RatingForCustomerResponseModel();
  /////////////////////////////////////////////////////////////////////////////
  LiveTrackerRequestModel liveTrackerRequestModel = LiveTrackerRequestModel();
  LiveTrackerResponseModel liveTrackerResponseModel =
      LiveTrackerResponseModel();
  /////////////////////////////////////////////////////////////////////////////
  ArrivalToCustomerLocationRequestModel arrivalOfWinchDriverRequestModel =
      ArrivalToCustomerLocationRequestModel(driverResponse: "Arrived");
  ArrivalToCustomerLocationResponseModel arrivalOfWinchDriverResponseModel =
      ArrivalToCustomerLocationResponseModel();
  /////////////////////////////////////////////////////////////////////////////
  StartingMechanicServiceRequestModel startingOfWinchTripRequestModel =
      StartingMechanicServiceRequestModel(driverResponse: "Service Start");
  StartingMechanicServiceResponseModel startingOfWinchTripResponseModel =
      StartingMechanicServiceResponseModel();
  /////////////////////////////////////////////////////////////////////////////
  CancelingMechanicServiceResponseModel cancelingMechanicServiceResponseModel =
      CancelingMechanicServiceResponseModel();
  /////////////////////////////////////////////////////////////////////////////

  getMechanicCurrentState(state, {BuildContext context}) async {
    mechanicCurrentState = state;
    //notifyListeners();
    print("current State $state");
    state == true
        ? SEARCHING_FOR_CUSTOMER = true
        : SEARCHING_FOR_CUSTOMER = false;
    if (mechanicCurrentState == true) {
      searchingForCustomerTimer =
          Timer.periodic(Duration(seconds: 10), (z) async {
        await getNearestClientToMe(context);
        if (CUSTOMER_FOUNDED == true) {
          z.cancel();
          print("customer found");
          print(
              "CustomerPickUpLocation: Lat : ${getNearestClientResponseModel.nearestRidePickupLocation.lat} ,long : ${getNearestClientResponseModel.nearestRidePickupLocation.lng}");
          print(
              "CustomerDropOffLocation: Lat : ${getNearestClientResponseModel.dropoffLocation.lat} ,long : ${getNearestClientResponseModel.dropoffLocation.lng}");
          Address finalPos = Address(descriptor: "PickUp");
          finalPos.latitude = double.parse(
              getNearestClientResponseModel.nearestRidePickupLocation.lat);
          finalPos.longitude = double.parse(
              getNearestClientResponseModel.nearestRidePickupLocation.lng);
          // print(finalPos.latitude);
          // print(finalPos.latitude.runtimeType);
          Address initial =
              Provider.of<MapsProvider>(context, listen: false).currentLocation;
          await Provider.of<PolyLineProvider>(context, listen: false)
              .getPlaceDirection(
                  context,
                  initial,
                  finalPos,
                  Provider.of<MapsProvider>(context, listen: false)
                      .googleMapController);
          isPopRequestDataReady = true;
          if (isHomeMapOpened == false && isPopRequestDataReady == true) {
            Navigator.of(context)
                .push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) =>
                        UpcomingRequest()))
                .then((value) {
              print("page poped");
              return isHomeMapOpened = false;
            });
          }
        } else if (ALREADY_HAVE_RIDE == true) {
          z.cancel();
          print(getNearestClientResponseModel.error);
          print(getNearestClientResponseModel.requestId);
        } else if (SEARCHING_FOR_CUSTOMER == true) {
          print("still searching");
          print(getNearestClientResponseModel.error);
        }
      });
    } else {
      //searchingForCustomerTimer.cancel();
      await cancelingMechanicService();
      if (CANCELLING_SERVICE == true && SEARCHING_FOR_CUSTOMER == false) {
        searchingForCustomerTimer.cancel();
      }
      // if (upcomingRequestResponseModel.msg == "Check For Another Request")
      //   searchingForCustomerTimer.cancel();
      //resetAllFlags();
    }
    notifyListeners();
  }

  getNearestClientToMe(context) async {
    await getMechanicCurrentLocation(context);
    getNearestClientRequestModel.locationLat =
        Provider.of<MapsProvider>(context, listen: false)
            .currentLocation
            .latitude
            .toString();
    getNearestClientRequestModel.locationLong =
        Provider.of<MapsProvider>(context, listen: false)
            .currentLocation
            .longitude
            .toString();
    isLoading = true;
    getNearestClientResponseModel = await requestService.getNearestClient(
        getNearestClientRequestModel, loadJwtTokenFromDB());
    isLoading = false;
    if (getNearestClientResponseModel.requestId == null &&
        getNearestClientResponseModel.error == "No client requests now") {
      // Provider.of<MapsProvider>(context, listen: false).locatePosition(context);
      // Provider.of<PolyLineProvider>(context, listen: false).resetPolyLine();
      SEARCHING_FOR_CUSTOMER = true;
      CUSTOMER_FOUNDED = false;
      ALREADY_HAVE_RIDE = false;
      notifyListeners();
    }
    if (getNearestClientResponseModel.nearestRidePickupLocation != null) {
      // PolyLineProvider.getPlaceDirection(context, MapsProvider.currentLocation, MapsProvider.customerPickUpLocation, _googleMapController):
      CUSTOMER_FOUNDED = true;
      SEARCHING_FOR_CUSTOMER = false;
      notifyListeners();
    }
    if (getNearestClientResponseModel.requestId != null &&
        getNearestClientResponseModel.error != null) {
      ALREADY_HAVE_RIDE = true;
      SEARCHING_FOR_CUSTOMER = false;
      notifyListeners();
    }
    notifyListeners();
  }

  acceptUpcomingRequest(context) async {
    isLoading = true;
    upcomingRequestResponseModel =
        await requestService.respondToCustomerRequest(
            upcomingRequestAcceptRequestModel, loadJwtTokenFromDB());
    isLoading = false;
    if (upcomingRequestResponseModel != null) {
      RIDE_ACCEPTED = true;
      SEARCHING_FOR_CUSTOMER = false;
      Provider.of<MapsProvider>(context, listen: false).getPickUpAddress(
          getNearestClientResponseModel.nearestRidePickupLocation.lat,
          getNearestClientResponseModel.nearestRidePickupLocation.lng,
          context);
      Provider.of<MapsProvider>(context, listen: false).getDropOffAddress(
          getNearestClientResponseModel.dropoffLocation.lat,
          getNearestClientResponseModel.dropoffLocation.lng,
          context);
      // liveTrackerTimer = Timer.periodic(Duration(seconds: 30), (z) async {
      //   //trackWinchDriver(context);
      // });
    }
    notifyListeners();
  }

  rejectUpcomingRequest(context) async {
    isLoading = true;
    upcomingRequestResponseModel =
        await requestService.respondToCustomerRequest(
            upcomingRequestDenyRequestModel, loadJwtTokenFromDB());
    isLoading = false;
    if (upcomingRequestResponseModel.msg == "Check For Another Request") {
      Provider.of<MapsProvider>(context, listen: false).locatePosition(context);
      SEARCHING_FOR_CUSTOMER = true;
      CUSTOMER_FOUNDED = false;
      Provider.of<PolyLineProvider>(context, listen: false).resetPolyLine();
      searchingForCustomerTimer =
          Timer.periodic(Duration(seconds: 10), (z) async {
        print("start");
        await getNearestClientToMe(context);
        if (CUSTOMER_FOUNDED == true) {
          z.cancel();
          print("customer found");
          print(
              "CustomerPickUpLocation: Lat : ${getNearestClientResponseModel.nearestRidePickupLocation.lat} ,long : ${getNearestClientResponseModel.nearestRidePickupLocation.lng}");
          print(
              "CustomerDropOffLocation: Lat : ${getNearestClientResponseModel.nearestRidePickupLocation.lat} ,long : ${getNearestClientResponseModel.nearestRidePickupLocation.lng}");
          Address finalPos = Address(descriptor: "PickUp ");
          finalPos.latitude = double.parse(
              getNearestClientResponseModel.nearestRidePickupLocation.lat);
          finalPos.longitude = double.parse(
              getNearestClientResponseModel.nearestRidePickupLocation.lng);
          Address initial =
              Provider.of<MapsProvider>(context, listen: false).currentLocation;
          Provider.of<PolyLineProvider>(context, listen: false)
              .getPlaceDirection(
                  context,
                  initial,
                  finalPos,
                  Provider.of<MapsProvider>(context, listen: false)
                      .googleMapController);
          notifyListeners();
        } else if (ALREADY_HAVE_RIDE == true) {
          z.cancel();
          print(getNearestClientResponseModel.error);
          print(getNearestClientResponseModel.requestId);
          notifyListeners();
        } else if (SEARCHING_FOR_CUSTOMER == true) {
          print("still searching");
          print(getNearestClientResponseModel.error);
        }
      });
    } else
      print(upcomingRequestResponseModel.msg);
    notifyListeners();
  }

  // endCurrentWinchService() async {
  //   endingWinchServiceRequestModel.finalLocationLat =
  //       winchDriverCurrentPosition.latitude.toString();
  //   endingWinchServiceRequestModel.finalLocationLong =
  //       winchDriverCurrentPosition.longitude.toString();
  //   isLoading = true;
  //   endingWinchServiceResponseModel = await requestService.endCustomerTrip(
  //       endingWinchServiceRequestModel, loadJwtTokenFromDB());
  //   isLoading = false;
  //   print("live tracker stopped");
  //   liveTrackerTimer.cancel();
  //   SERVICE_FINISHED = true;
  //   //SEARCHING_FOR_CUSTOMER = true;
  //   notifyListeners();
  //   if (endingWinchServiceResponseModel.status == "COMPLETED") {
  //     print("live tracker stopped");
  //     liveTrackerTimer.cancel();
  //     SERVICE_FINISHED = true;
  //     //SEARCHING_FOR_CUSTOMER = true;
  //     notifyListeners();
  //   }
  //   notifyListeners();
  // }

  // rateCustomer(context) async {
  //   isLoading = true;
  //   ratingForCustomerResponseModel = await requestService.ratingForCustomer(
  //       ratingForCustomerRequestModel, loadJwtTokenFromDB());
  //   if (ratingForCustomerResponseModel.msg == null) // to be changed
  //   {
  //     await returnToDashBoard(context);
  //     isLoading = false;
  //   }
  //   notifyListeners();
  // }

  returnToDashBoard(context) {
    Provider.of<MapsProvider>(context, listen: false).locatePosition(context);
    SEARCHING_FOR_CUSTOMER = true;
    CUSTOMER_FOUNDED = false;
    Provider.of<PolyLineProvider>(context, listen: false).resetPolyLine();
    Navigator.pushNamedAndRemoveUntil(
        context, DashBoard.routeName, (route) => false);
  }

  trackWinchDriver(context) async {
    print("live tracker started");
    print("live tracker request body: ${liveTrackerRequestModel.toJson()}");
    liveTrackerResponseModel = await requestService.liveTracker(
        liveTrackerRequestModel, loadJwtTokenFromDB());
    await getMechanicCurrentLocation(context);
    liveTrackerTimer = Timer.periodic(Duration(seconds: 30), (z) async {
      await getMechanicCurrentLocation(context);
      print("live tracker request body: ${liveTrackerRequestModel.toJson()}");
      isLoading = true;
      liveTrackerResponseModel = await requestService.liveTracker(
          liveTrackerRequestModel, loadJwtTokenFromDB());
      isLoading = false;
      if (liveTrackerResponseModel.done != null) {
        print("updated ${liveTrackerResponseModel.done}");
      } else {
        print(liveTrackerResponseModel.error);
        liveTrackerTimer.cancel();
        print("trip cancelled from customer & live location cancelled aslo");
        print("notifcation must be added to notify driver");
        // Provider.of<MapsProvider>(context, listen: false)
        //     .locatePosition(context);
        // SEARCHING_FOR_CUSTOMER = true;
        // CUSTOMER_FOUNDED = false;
        // Provider.of<PolyLineProvider>(context, listen: false).resetPolyLine();
        // Navigator.pushNamedAndRemoveUntil(
        //     context, DashBoard.routeName, (route) => false);
        returnToDashBoard(context);
      }
      notifyListeners();
    });
    notifyListeners();
  }

  //final x= Provider.of<MapsProvider>(ctx, listen: false);
  getMechanicCurrentLocation(context) async {
    isLoading = true;
    mechanicCurrentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    isLoading = false;
    print("Current Postionss: $mechanicCurrentPosition");
    Provider.of<MapsProvider>(context, listen: false).getCurrentLocationAddress(
        mechanicCurrentPosition.latitude.toString(),
        mechanicCurrentPosition.longitude.toString(),
        context);

    liveTrackerRequestModel.locationLat =
        mechanicCurrentPosition.latitude.toString();
    liveTrackerRequestModel.locationLong =
        mechanicCurrentPosition.longitude.toString();

    notifyListeners();
  }

  arrivedToCustomerLocation(context) async {
    isLoading = true;
    arrivalOfWinchDriverResponseModel =
        await requestService.arrivalToCustomerLocation(
            arrivalOfWinchDriverRequestModel, loadJwtTokenFromDB());
    isLoading = false;
    if (arrivalOfWinchDriverResponseModel.msg ==
        "You haven't arrived yet!" /*arrivalOfWinchDriverResponseModel.msg == "Alright!"*/) {
      DriverARRIVED = true;
      Provider.of<PolyLineProvider>(context, listen: false).resetPolyLine();
    }

    notifyListeners();
  }

  startingWinchService(context) async {
    isLoading = true;
    startingOfWinchTripResponseModel = await requestService.startingWinchTrip(
        startingOfWinchTripRequestModel, loadJwtTokenFromDB());
    isLoading = false;
    if (startingOfWinchTripResponseModel.error != null) {
      SERVICE_STARTTED = true;
      Provider.of<PolyLineProvider>(context, listen: false).getPlaceDirection(
          context,
          Provider.of<MapsProvider>(context, listen: false)
              .customerPickUpLocation,
          Provider.of<MapsProvider>(context, listen: false)
              .customerDropOffLocation,
          Provider.of<MapsProvider>(context, listen: false)
              .googleMapController);
    }
    notifyListeners();
  }

  cancelingMechanicService() async {
    isLoading = true;
    cancelingMechanicServiceResponseModel =
        await requestService.cancelMechanicService(loadJwtTokenFromDB());
    isLoading = false;
    if (cancelingMechanicServiceResponseModel.status == "CANCELLED" &&
        cancelingMechanicServiceResponseModel.details == null) {
      CANCELLING_SERVICE = true;
      SEARCHING_FOR_CUSTOMER = false;
    }
    if (cancelingMechanicServiceResponseModel.status == "CANCELLED" &&
        cancelingMechanicServiceResponseModel.details ==
            "Request was accepted") {
      CANCELLING_SERVICE = true;
      SEARCHING_FOR_CUSTOMER = true;
    }
  }

  resetAllFlags() {
    SEARCHING_FOR_CUSTOMER = false;
    CUSTOMER_FOUNDED = false;
    ALREADY_HAVE_RIDE = false;
    RIDE_ACCEPTED = false;
    notifyListeners();
  }
}
