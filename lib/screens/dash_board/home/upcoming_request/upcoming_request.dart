import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanic_app/provider/appControlProvider.dart';
import 'package:mechanic_app/provider/maps_prepration/maps_provider.dart';
import 'package:mechanic_app/provider/maps_prepration/polyLineProvider.dart';
import 'package:mechanic_app/widgets/divider.dart';
import 'package:provider/provider.dart';

class UpcomingRequest extends StatelessWidget {
  const UpcomingRequest({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String customerFirstName = "FName";
    String customerLastName = "LName";

    var initialPos =
        Provider.of<MapsProvider>(context, listen: false).currentLocation;
    // Provider.of<WinchRequestProvider>(context, listen: false)
    //     .updateWinchLocationAddress(winchPosition);

    final CameraPosition _initialPosition = CameraPosition(
      target: LatLng(initialPos.latitude, initialPos.longitude),
      zoom: 15.4746,
    );
    Completer<GoogleMapController> _completerGoogleMap = Completer(); //////
    ScrollController controller = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(
          0.95), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
      appBar: AppBar(
        title: Text(
          "New Mechanic Request",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        backgroundColor: Colors.white.withOpacity(0.25),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close_rounded,
            color: Theme.of(context).primaryColorDark, //Colors.black87,
            size: 30,
          ),
        ),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CircularCountDownTimer(
          //     width: 40,
          //     height: 40,
          //     duration: 59,
          //     fillColor: Colors.grey,
          //     ringColor: Theme.of(context).primaryColorLight,
          //     isReverse: true,
          //     backgroundColor: Theme.of(context).accentColor,
          //     onComplete: () {
          //       // Navigator.pop(context);
          //     },
          //     isTimerTextShown: true,
          //   ),
          // ),
        ],
      ),
      body: Consumer3<AppControlProvider, PolyLineProvider, MapsProvider>(
        builder: (context, mechanicRequestProvider, PolyLineProvider,
                MapsProvider, child) =>
            Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0),
              child: Container(
                height: size.height * 0.9,
                child: SingleChildScrollView(
                  controller: controller,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AdvancedAvatar(
                                  name:
                                      "${customerFirstName + " " + customerLastName}",
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent.withOpacity(0.90),
                                    shape: BoxShape.circle,
                                  ),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  statusColor: Colors.greenAccent,
                                  size: 50,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    customerFirstName + " " + customerLastName,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  RatingBarIndicator(
                                    rating: 3.5,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 17.0,
                                    direction: Axis.horizontal,
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       "4.9",
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .bodyText1,
                                  //     ),
                                  //     Icon(Icons.star_half,
                                  //         color: Colors.yellow, size: 20),
                                  //   ],
                                  // ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  "Seat Ibeza",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "1234 سصم",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DividerWidget(),
                      ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "About customer location",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("22 KM"),
                                Text("|"),
                                Text(" 30 min away"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: size.height * 0.3,
                              width: size.width * 0.9,
                              //color: Colors.red,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 5),
                                // boxShadow: <BoxShadow>[
                                //   BoxShadow(
                                //       color: Colors.deepPurple.withOpacity(0.2),
                                //       blurRadius: 15.0,
                                //       offset: Offset(0.0, 0.5))
                                // ],
                              ),
                              child: GoogleMap(
                                initialCameraPosition: _initialPosition,
                                mapType: MapType.normal,
                                myLocationButtonEnabled: true,
                                myLocationEnabled: true,
                                zoomGesturesEnabled: true,
                                zoomControlsEnabled: false,
                                mapToolbarEnabled: true,
                                polylines: PolyLineProvider.polylineSet,
                                markers: PolyLineProvider.markersSet,
                                circles: PolyLineProvider.circlesSet,
                                onMapCreated:
                                    (GoogleMapController controller) async {
                                  _completerGoogleMap.complete(controller);
                                  MapsProvider.googleMapController = controller;
                                  MapsProvider.locatePosition(context);
                                  // WinchRequestProvider.getNearestClientRequestModel =
                                  //     GetNearestClientRequestModel(
                                  //         locationLat:
                                  //             MapsProvider.currentLocation.latitude.toString(),
                                  //         locationLong: MapsProvider.currentLocation.longitude
                                  //             .toString());
                                  //getPlaceDirection(context);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Icon(Icons.add_location_alt_rounded),
                                ),
                                Text('1 Ash Park,Pembroke Dock,5A27'),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DividerWidget(),
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Car Initial Diagnosis",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75))
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          child: Text("Reject".toUpperCase(),
                              style: TextStyle(fontSize: 18)),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(15)),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          width: 0.7, color: Colors.red)))),
                          onPressed: () {
                            // mechanicRequestProvider.rejectUpComingDiagnosis();
                          }),
                      //  SizedBox(width: size.width * 0.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularCountDownTimer(
                          width: 40,
                          height: 40,
                          duration: 59,
                          fillColor: Colors.grey,
                          ringColor: Theme.of(context).primaryColorLight,
                          //  isReverseAnimation: true,
                          isReverse: true,
                          backgroundColor: Theme.of(context).accentColor,
                          onComplete: () {
                            // Navigator.pop(context);
                          },
                          isTimerTextShown: true,
                        ),
                      ),
                      TextButton(
                        child: Text("Accept".toUpperCase(),
                            style: TextStyle(fontSize: 18)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.green)))),
                        onPressed: () {
                          //  mechanicRequestProvider.approveUpComingDiagnosis();
                        },
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
