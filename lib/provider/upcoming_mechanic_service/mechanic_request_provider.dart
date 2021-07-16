import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/models/maps/address.dart';
import 'package:mechanic_app/models/upcoming_requests/arrival_to_customer_location_model.dart';
import 'package:mechanic_app/models/upcoming_requests/canceling_mechanic_service.dart';
import 'package:mechanic_app/models/upcoming_requests/check_status_model.dart';
import 'package:mechanic_app/models/upcoming_requests/ending_mechanic_service.dart';
import 'package:mechanic_app/models/upcoming_requests/get_nearest_client_model.dart';
import 'package:mechanic_app/models/upcoming_requests/live_tracker_model.dart';
import 'package:mechanic_app/models/upcoming_requests/repaires_to_be_made_model.dart';
import 'package:mechanic_app/models/upcoming_requests/respond_to_upcoming_request_model.dart';
import 'package:mechanic_app/models/upcoming_requests/starting_mechanic_service_model.dart';
import 'package:mechanic_app/provider/maps_prepration/maps_provider.dart';
import 'package:mechanic_app/provider/maps_prepration/polyLineProvider.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_cart_provider.dart';
import 'package:mechanic_app/screens/dash_board/dash_board.dart';
import 'package:mechanic_app/screens/dash_board/home/upcoming_request/upcoming_request.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/acceptted_service/accepted_service_map.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/waiting_for_customer_response/waiting_for_customer_reponse.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/starting_service/starting_mechanic_service.dart';
import 'package:mechanic_app/services/requesting_mechanic/mechanic_request_service.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

class MechanicRequestProvider extends ChangeNotifier {
  bool mechanicCurrentState = false;
  bool isLoading = false;
  Timer liveTrackerTimer;
  Timer searchingForCustomerTimer;
  Position mechanicCurrentPosition;
  List<InitialDiagnosis> initialDiagnosisProblemList = [];
  List<InitialDiagnosis> initialDiagnosisServiceList = [];

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
  bool WAITING_FOR_APPROVAL = true;
  bool CUSTOMER_RESPONSE = false;
  BuildContext cttx;
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
  ArrivalToCustomerLocationRequestModel arrivalMechanicRequestModel =
      ArrivalToCustomerLocationRequestModel(mechanicResponse: "Arrived");
  ArrivalToCustomerLocationResponseModel arrivalMechanicResponseModel =
      ArrivalToCustomerLocationResponseModel();
  /////////////////////////////////////////////////////////////////////////////
  StartingMechanicServiceRequestModel startingOfWinchTripRequestModel =
      StartingMechanicServiceRequestModel(mechanicResponse: "Service Start");

  StartingMechanicServiceResponseModel startingOfWinchTripResponseModel =
      StartingMechanicServiceResponseModel();
  /////////////////////////////////////////////////////////////////////////////
  CancelingMechanicServiceResponseModel cancelingMechanicServiceResponseModel =
      CancelingMechanicServiceResponseModel();
  /////////////////////////////////////////////////////////////////////////////
  // List<Repairsneeded> repairsToBeMadeList = [];
  RepairsToBeMadeRequestModel repairsToBeMadeRequestModel =
      RepairsToBeMadeRequestModel();
  RepairsToBeMadeResponseModel repairsToBeMadeResponseModel =
      RepairsToBeMadeResponseModel();
  ////////////////////////////////////////////////////////////////////////////////////
  CheckStatusResponseModel checkMechanicRequestStatusResponseModel =
      CheckStatusResponseModel();

  getMechanicCurrentState(state, {BuildContext cttx}) async {
    mechanicCurrentState = state;
    //notifyListeners();
    print("current State $state");
    state == true
        ? SEARCHING_FOR_CUSTOMER = true
        : SEARCHING_FOR_CUSTOMER = false;
    if (mechanicCurrentState == true) {
      searchingForCustomerTimer =
          Timer.periodic(Duration(seconds: 10), (z) async {
        await getNearestClientToMe(cttx);
        if (CUSTOMER_FOUNDED == true) {
          z.cancel();
          print("customer found");
          print(
              "CustomerPickUpLocation: Lat : ${getNearestClientResponseModel.nearestRidePickupLocation.lat} ,long : ${getNearestClientResponseModel.nearestRidePickupLocation.lng}");
          //print("CustomerDropOffLocation: Lat : ${getNearestClientResponseModel.dropoffLocation.lat} ,long : ${getNearestClientResponseModel.dropoffLocation.lng}");
          Address finalPos = Address(descriptor: "PickUp");
          finalPos.latitude = double.parse(
              getNearestClientResponseModel.nearestRidePickupLocation.lat);
          finalPos.longitude = double.parse(
              getNearestClientResponseModel.nearestRidePickupLocation.lng);
          Provider.of<MapsProvider>(cttx, listen: false).getPickUpAddress(
              getNearestClientResponseModel.nearestRidePickupLocation.lat,
              getNearestClientResponseModel.nearestRidePickupLocation.lng,
              cttx);
          // print(finalPos.latitude);
          // print(finalPos.latitude.runtimeType);
          Address initial =
              Provider.of<MapsProvider>(cttx, listen: false).currentLocation;
          await Provider.of<PolyLineProvider>(cttx, listen: false)
              .getPlaceDirection(
                  cttx,
                  initial,
                  finalPos,
                  Provider.of<MapsProvider>(cttx, listen: false)
                      .googleMapController);
          isPopRequestDataReady = true;
          if (isHomeMapOpened == false && isPopRequestDataReady == true) {
            Navigator.of(cttx)
                .push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (context, _, __) => UpcomingRequest()))
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
    print(getNearestClientResponseModel.error);
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
      getInitialDiagnosisList();
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

  bool acceptUpcomingRequestIsLoading = false;
  acceptUpcomingRequest(context) async {
    acceptUpcomingRequestIsLoading = true;
    notifyListeners();
    upcomingRequestResponseModel =
        await requestService.respondToCustomerRequest(
            upcomingRequestAcceptRequestModel, loadJwtTokenFromDB());
    acceptUpcomingRequestIsLoading = false;
    if (upcomingRequestResponseModel != null) {
      RIDE_ACCEPTED = true;
      SEARCHING_FOR_CUSTOMER = false;
      Provider.of<MapsProvider>(context, listen: false).getPickUpAddress(
          getNearestClientResponseModel.nearestRidePickupLocation.lat,
          getNearestClientResponseModel.nearestRidePickupLocation.lng,
          context);
      Navigator.pushNamedAndRemoveUntil(
          context, AcceptedServiceScreen.routeName, (route) => false);
      // Provider.of<MapsProvider>(context, listen: false).getDropOffAddress(
      //     getNearestClientResponseModel.dropoffLocation.lat,
      //     getNearestClientResponseModel.dropoffLocation.lng,
      //     context);
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
      CANCELLING_SERVICE = true;
      isPopRequestDataReady = false;
      final snackBar = SnackBar(
          content: Text('The request was cancelled !! Check for another one'));
      ScaffoldMessenger.of(cttx).showSnackBar(snackBar);
      researchForanthorCustomer();
    } else
      print(upcomingRequestResponseModel.msg);
    notifyListeners();
  }

  researchForanthorCustomer() {
    Provider.of<MapsProvider>(cttx, listen: false).locatePosition(cttx);
    SEARCHING_FOR_CUSTOMER = true;
    CUSTOMER_FOUNDED = false;
    Provider.of<PolyLineProvider>(cttx, listen: false).resetPolyLine();
    searchingForCustomerTimer =
        Timer.periodic(Duration(seconds: 10), (z) async {
      print("start");
      await getNearestClientToMe(cttx);
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
        Provider.of<MapsProvider>(cttx, listen: false).getPickUpAddress(
            getNearestClientResponseModel.nearestRidePickupLocation.lat,
            getNearestClientResponseModel.nearestRidePickupLocation.lng,
            cttx);
        Address initial =
            Provider.of<MapsProvider>(cttx, listen: false).currentLocation;
        await Provider.of<PolyLineProvider>(cttx, listen: false)
            .getPlaceDirection(
                cttx,
                initial,
                finalPos,
                Provider.of<MapsProvider>(cttx, listen: false)
                    .googleMapController);
        isPopRequestDataReady = true;
        if (isHomeMapOpened == false && isPopRequestDataReady == true) {
          Navigator.of(cttx)
              .push(PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) =>
                      UpcomingRequest()))
              .then((value) {
            print("page poped");
            return isHomeMapOpened = false;
          });
        }
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
    notifyListeners();
  }

  bool endCurrentMechanicServiceIsLoading = false;
  endCurrentMechanicService(context) async {
    endCurrentMechanicServiceIsLoading = true;
    notifyListeners();
    endingWinchServiceResponseModel =
        await requestService.endCustomerTrip(loadJwtTokenFromDB());
    endCurrentMechanicServiceIsLoading = false;
    //SEARCHING_FOR_CUSTOMER = true;
    notifyListeners();
    if (endingWinchServiceResponseModel.status == "COMPLETED") {
      SERVICE_FINISHED = true;
      final _dialog = RatingDialog(
        // your app's name?
        title: '${endingWinchServiceResponseModel.fare.ceil()} EGP',
        // encourage your user to leave a high rating?
        message:
            'Tap a star to set your rating. Add more description here if you want.',
        // your app's logo?
        image: true
            ? SvgPicture.asset(
                "assets/icons/cash.svg",
                height: MediaQuery.of(context).size.height * 0.15,
              )
            : CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green)),
        submitButton: 'Submit Rating For Mechanic',
        // onCancelled: () => print('cancelled'),
        onSubmitted: (response) async {
          // WinchRequestProvider.ratingForCustomerRequestModel.stars =
          //     response.rating.toString();
          // await WinchRequestProvider.rateCustomer(ctx);
          // Navigator.pushNamedAndRemoveUntil(
          //     context, DashBoard.routeName, (route) => false);
          returnToDashBoard(context);
          // final snackBar =
          //     SnackBar(content: Text('Check For another request!!'));
          // ScaffoldMessenger.of(cttx).showSnackBar(snackBar);
        },
      );
      showDialog(
        context: context,
        builder: (context) => _dialog,
      );
      notifyListeners();
    }
    notifyListeners();
  }

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

  returnToDashBoard(context) async {
    await Navigator.pushNamedAndRemoveUntil(
        context, DashBoard.routeName, (route) => false);
    Provider.of<MapsProvider>(cttx, listen: false).locatePosition(cttx);
    SEARCHING_FOR_CUSTOMER = true;
    CUSTOMER_FOUNDED = false;
    researchForanthorCustomer();
    final snackBar = SnackBar(content: Text('check for another request'));
    //ScaffoldMessenger.of(cttx).showSnackBar(snackBar);
    Provider.of<PolyLineProvider>(cttx, listen: false).resetPolyLine();
  }

  trackMechanic(context) async {
    print("live tracker started");
    print("live tracker request body: ${liveTrackerRequestModel.toJson()}");
    liveTrackerResponseModel = await requestService.liveTracker(
        liveTrackerRequestModel, loadJwtTokenFromDB());
    await getMechanicCurrentLocation(context);
    liveTrackerTimer = Timer.periodic(Duration(seconds: 20), (z) async {
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

  bool arrivedToCustomerLocationIsLoading = false;
  arrivedToCustomerLocation(context) async {
    arrivedToCustomerLocationIsLoading = true;
    notifyListeners();
    print("request body : ${arrivalMechanicRequestModel.toJson()}");
    arrivalMechanicResponseModel =
        await requestService.arrivalToCustomerLocation(
            arrivalMechanicRequestModel, loadJwtTokenFromDB());
    arrivedToCustomerLocationIsLoading = false;
    print(arrivalMechanicResponseModel.msg);
    if (/*arrivalMechanicResponseModel.msg ==
        "You haven't arrived yet!"*/
        arrivalMechanicResponseModel.msg == "Alright!") {
      DriverARRIVED = true;
      liveTrackerTimer.cancel();
      //Provider.of<PolyLineProvider>(context, listen: false).resetPolyLine();
    }

    notifyListeners();
  }

  bool sendDiagnosisToCustomerIsLoading = false;
  sendDiagnosisToCustomer(context) async {
    sendDiagnosisToCustomerIsLoading = true;
    notifyListeners();
    repairsToBeMadeRequestModel.repairsneeded =
        await Provider.of<MechanicServicesCartProvider>(context, listen: false)
            .combineTwoCartsWithEachOther();
    repairsToBeMadeResponseModel =
        await requestService.sendingMechanicDiagnosis(
            repairsToBeMadeRequestModel, loadJwtTokenFromDB());
    sendDiagnosisToCustomerIsLoading = false;
    if (repairsToBeMadeResponseModel.msg == "Done!") {
      Navigator.pushNamedAndRemoveUntil(
          context, WaitingForCustomerResponse.routeName, (route) => false);
    }
    notifyListeners();
  }

  bool startingWinchServiceIsLoading = false;
  startingWinchService(context) async {
    startingWinchServiceIsLoading = true;
    notifyListeners();
    startingOfWinchTripResponseModel = await requestService.startingWinchTrip(
        startingOfWinchTripRequestModel, loadJwtTokenFromDB());
    startingWinchServiceIsLoading = false;
    if (startingOfWinchTripResponseModel.msg == "Alright!") {
      SERVICE_STARTTED = true;
      Navigator.pushNamedAndRemoveUntil(
          context, StartingMechanicService.routeName, (route) => false);
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

  getInitialDiagnosisList() {
    for (var j in getNearestClientResponseModel.initialDiagnosis) {
      if (j.requestCategory == "problem") {
        initialDiagnosisProblemList.add(InitialDiagnosis(
            problem: j.problem,
            problemCategory: j.problemCategory,
            subProblem: j.subProblem));
      }
      if (j.requestCategory == "service") {
        initialDiagnosisServiceList.add(InitialDiagnosis(
            serviceCategory: j.serviceCategory,
            serviceDesc: j.serviceDesc,
            serviceFare: j.serviceFare));
      }
    }
  }

  checkStatusForConfirmedMechanicService(context) async {
    isLoading = true;
    checkMechanicRequestStatusResponseModel =
        await requestService.checkMechanicServiceStatus(loadJwtTokenFromDB());
    isLoading = false;
    print(checkMechanicRequestStatusResponseModel.status);
    if (checkMechanicRequestStatusResponseModel.status ==
        "WAITING_FOR_APPROVAL") {
      WAITING_FOR_APPROVAL = true;
      notifyListeners();
    } else
      WAITING_FOR_APPROVAL = false;

    if (checkMechanicRequestStatusResponseModel.status == "CUSTOMER_RESPONSE") {
      WAITING_FOR_APPROVAL = false;
      CUSTOMER_RESPONSE =
          checkMechanicRequestStatusResponseModel.customerResponse;
      notifyListeners();
    }

    notifyListeners();
  }

  listeningForCustomerResponse(context) {
    checkStatusForConfirmedMechanicService(context);
    Timer.periodic(Duration(seconds: 2), (timer) async {
      checkStatusForConfirmedMechanicService(context);
      if (WAITING_FOR_APPROVAL == false) timer.cancel();
    });
  }

  resetAllFlags() {
    SEARCHING_FOR_CUSTOMER = false;
    CUSTOMER_FOUNDED = false;
    ALREADY_HAVE_RIDE = false;
    RIDE_ACCEPTED = false;
    notifyListeners();
  }
}
