import 'dart:convert';

import 'package:mechanic_app/models/upcoming_requests/arrival_to_customer_location_model.dart';
import 'package:mechanic_app/models/upcoming_requests/canceling_mechanic_service.dart';
import 'package:mechanic_app/models/upcoming_requests/ending_mechanic_service.dart';
import 'package:mechanic_app/models/upcoming_requests/get_nearest_client_model.dart';
import 'package:http/http.dart' as http;
import 'package:mechanic_app/models/upcoming_requests/live_tracker_model.dart';
import 'package:mechanic_app/models/upcoming_requests/respond_to_upcoming_request_model.dart';
import 'package:mechanic_app/models/upcoming_requests/starting_mechanic_service_model.dart';

class MechanicRequestService {
  Future<GetNearestClientResponseModel> getNearestClient(
      GetNearestClientRequestModel getNearestClientRequestModel, token) async {
    print("Request body : ${getNearestClientRequestModel.toJson()}");
    var url = Uri.parse('http://161.97.155.244/api/Mechanic/getNearestClient');
    final response = await http.post(url,
        headers: {"x-auth-token": "$token"},
        body: getNearestClientRequestModel.toJson());
    print("response.body:${response.body}");
    if (response.statusCode == 200) {
      print("response.body:${response.statusCode}");
      print("response.body:${response.reasonPhrase}");
      return GetNearestClientResponseModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      return GetNearestClientResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("failed to load Data");
    }
  }

  Future<RespondToUpcomingRequestResponseModel> respondToCustomerRequest(
      RespondToUpcomingRequestRequestModel respondToUpcomingRequestRequestModel,
      token) async {
    var url = Uri.parse('http://161.97.155.244/api/Mechanic/MechanicResponse');
    final response = await http.post(url,
        headers: {"x-auth-token": "$token"},
        body: respondToUpcomingRequestRequestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print("response.body:${response.body}");
      return RespondToUpcomingRequestResponseModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception("failed to load Data");
    }
  }

  Future<EndingMechanicServiceResponseModel> endCustomerTrip(
      /* EndingWinchServiceRequestModel endingWinchServiceRequestModel,*/
      token) async {
    var url = Uri.parse('http://161.97.155.244/api/driverMatching/EndRide');
    final response = await http.post(
      url,
      headers: {"x-auth-token": "$token"},
      /* body: endingWinchServiceRequestModel.toJson()*/
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      print("response.body:${response.body}");
      return EndingMechanicServiceResponseModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception("failed to load Data");
    }
  }

  // Future<RatingForCustomerResponseModel> ratingForCustomer(
  //     RatingForCustomerRequestModel ratingForCustomerRequestModel,
  //     token) async {
  //   var url = Uri.parse('http://161.97.155.244/api/driverMatching/Rate');
  //   final response = await http.post(url,
  //       headers: {"x-auth-token": "$token"},
  //       body: ratingForCustomerRequestModel.toJson());
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     print("response.body:${response.body}");
  //     return RatingForCustomerResponseModel.fromJson(
  //         json.decode(response.body));
  //   } else {
  //     throw Exception("failed to load Data");
  //   }
  // }

  Future<LiveTrackerResponseModel> liveTracker(
      LiveTrackerRequestModel liveTrackerRequestModel, token) async {
    var url = Uri.parse('http://161.97.155.244/api/Mechanic/liveTracker');
    final response = await http.post(url,
        headers: {"x-auth-token": "$token"},
        body: liveTrackerRequestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print("response.body:${response.body}");
      return LiveTrackerResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("failed to load Data");
    }
  }

  Future<ArrivalToCustomerLocationResponseModel> arrivalToCustomerLocation(
      ArrivalToCustomerLocationRequestModel
          arrivalToCustomerLocationRequestModel,
      token) async {
    var url = Uri.parse('http://161.97.155.244/api/Mechanic/MechanicArrival');
    final response = await http.post(url,
        headers: {"x-auth-token": "$token"},
        body: arrivalToCustomerLocationRequestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print("response.body:${response.body}");
      return ArrivalToCustomerLocationResponseModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception("failed to load Data");
    }
  }

  Future<StartingMechanicServiceResponseModel> startingWinchTrip(
      StartingMechanicServiceRequestModel startingMechanicServiceRequestModel,
      token) async {
    var url = Uri.parse('http://161.97.155.244/api/Mechanic/ServiceStart');
    final response = await http.post(url,
        headers: {"x-auth-token": "$token"},
        body: startingMechanicServiceRequestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print("response.body:${response.body}");
      return StartingMechanicServiceResponseModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception("failed to load Data");
    }
  }

  Future<CancelingMechanicServiceResponseModel> cancelMechanicService(
      token) async {
    var url = Uri.parse('http://161.97.155.244/api/Mechanic/MechanicCancel');
    final response = await http.get(
      url,
      headers: {"x-auth-token": "$token"},
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      print("response.body:${response.body}");
      return CancelingMechanicServiceResponseModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception("failed to load Data");
    }
  }
}
