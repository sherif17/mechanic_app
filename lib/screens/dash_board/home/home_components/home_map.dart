import 'dart:async';
import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:fswitch/fswitch.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanic_app/provider/appControlProvider.dart';
import 'package:mechanic_app/provider/upcoming_mechanic_service/mechanic_request_provider.dart';
import 'package:mechanic_app/screens/dash_board/home/upcoming_request/upcoming_request_sheet.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:mechanic_app/models/maps/address.dart';
import 'package:mechanic_app/models/maps/direction_details.dart';
import 'package:mechanic_app/provider/maps_prepration/maps_provider.dart';
import 'package:mechanic_app/provider/maps_prepration/polyLineProvider.dart';
import 'package:mechanic_app/screens/dash_board/home/upcoming_request/upComingRequestCard.dart';
import 'package:mechanic_app/screens/dash_board/profile/profile_body.dart';
import 'package:mechanic_app/services/Maps_Assistants/maps_services.dart';
import 'package:mechanic_app/widgets/progress_Dialog.dart';
import 'package:flutter/scheduler.dart';

import 'home_header.dart';

class HomeMap extends StatefulWidget {
  static String routeName = '/HomeMap';
  @override
  _HomeMapState createState() => _HomeMapState();
  final double size;
  final Color color;
  final Widget child;
  // final VoidCallback onPressed;

  const HomeMap({
    Key key,
    this.size = 80.0,
    this.color = Colors.red,
    // this.onPressed,
    @required this.child,
  }) : super(key: key);
}

class _HomeMapState extends State<HomeMap> with TickerProviderStateMixin {
  Completer<GoogleMapController> _completerGoogleMap = Completer(); //////
  AnimationController _controller;

  DirectionDetails tripDirectionDetails;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    Provider.of<MechanicRequestProvider>(ctx, listen: false).isHomeMapOpened =
        true;
    Size size = MediaQuery.of(ctx).size;
    var initialPos =
        Provider.of<MapsProvider>(ctx, listen: false).currentLocation;
    final CameraPosition _initialPosition = CameraPosition(
      target: LatLng(initialPos.latitude, initialPos.longitude),
      zoom: 15.4746,
    );
    double WIDTH = double.maxFinite;
    return Consumer3<MapsProvider, PolyLineProvider, MechanicRequestProvider>(
      builder: (context, MapsProvider, PolyLineProvider,
              MechanicRequestProvider, child) =>
          Scaffold(
        backgroundColor: Colors.white.withOpacity(0.3),
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              GoogleMap(
                initialCameraPosition: _initialPosition,
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                mapToolbarEnabled: true,
                cameraTargetBounds:
                    CameraTargetBounds(PolyLineProvider.latLngBounds),
                polylines: PolyLineProvider.polylineSet,
                markers: PolyLineProvider.markersSet,
                circles: PolyLineProvider.circlesSet,
                onMapCreated: (GoogleMapController controller) async {
                  _completerGoogleMap.complete(controller);
                  MapsProvider.googleMapController = controller;
                  // MapsProvider.locatePosition(context);
                  // WinchRequestProvider.getNearestClientRequestModel =
                  //     GetNearestClientRequestModel(
                  //         locationLat:
                  //             MapsProvider.currentLocation.latitude.toString(),
                  //         locationLong: MapsProvider.currentLocation.longitude
                  //             .toString());
                  //getPlaceDirection(context);
                },
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: <Color>[
                        Colors.white,
                        Colors.white.withOpacity(0)
                      ],
                    ),
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(10)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: size.height * 0.9,
                  width: MediaQuery.of(context).size.width * 0.09,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      end: Alignment.centerRight,
                      begin: Alignment.centerLeft,
                      colors: <Color>[
                        Colors.white,
                        Colors.white.withOpacity(0.0)
                      ],
                    ),
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(10)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: size.height * 0.9,
                  width: MediaQuery.of(context).size.width * 0.08,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      end: Alignment.centerLeft,
                      begin: Alignment.centerRight,
                      colors: <Color>[
                        Colors.white,
                        Colors.white.withOpacity(0.0)
                      ],
                    ),
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(10)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.white,
                        Colors.white.withOpacity(0.0)
                      ],
                    ),
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(10)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await MechanicRequestProvider.rejectUpcomingRequest(
                            context);
                        MechanicRequestProvider.isHomeMapOpened = false;
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.close_rounded,
                          size: 40,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FSwitch(
                        open: MechanicRequestProvider.mechanicCurrentState,
                        openColor: Colors.green,
                        width: size.width * 0.18,
                        height: size.height * 0.04,
                        onChanged: (v) {
                          MechanicRequestProvider.getMechanicCurrentState(v,
                              cttx: context);
                        },
                        closeChild: Text(
                          "Offline",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                        openChild: Text(
                          "Online",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: LinearProgressIndicator(
                  color: Colors.white,
                  backgroundColor:
                      MechanicRequestProvider.SEARCHING_FOR_CUSTOMER == true
                          ? Colors.greenAccent
                          : Colors.white,
                ),
              ),
              MechanicRequestProvider.CUSTOMER_FOUNDED == true
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "New Mechanic request",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MechanicRequestProvider.mechanicCurrentState == true
                      ? DefaultTextStyle(
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize:
                                  20), //Theme.of(context).textTheme.headline5,
                          child: AnimatedTextKit(
                            animatedTexts: [
                              ScaleAnimatedText(
                                'You are currently online',
                                duration: const Duration(seconds: 3),
                              ),
                              ScaleAnimatedText(
                                'Searching for a request',
                                duration: const Duration(seconds: 3),
                              ),
                            ],
                            repeatForever: true,
                            pause: const Duration(milliseconds: 2),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("You Are Currently Offline",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 20)),
                        ),
                ),
              ),

              Align(
                  alignment: Alignment.bottomCenter,
                  child:
                      MechanicRequestProvider.isPopRequestDataReady == true &&
                              MechanicRequestProvider.isHomeMapOpened == true
                          ? UpcomingRequestSheet()
                          : Container()),
              //HomeHeader(),
              // WinchRequestProvider.CUSTOMER_FOUNDED == true &&
              //     WinchRequestProvider.isPopRequestDataReady == true
              //     ? buildUpCommingRequest(size: size, context: context)
              //     : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
