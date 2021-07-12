import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:fswitch/fswitch.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/provider/appControlProvider.dart';
import 'package:mechanic_app/provider/maps_prepration/maps_provider.dart';
import 'package:mechanic_app/provider/maps_prepration/polyLineProvider.dart';
import 'package:mechanic_app/provider/upcoming_mechanic_service/mechanic_request_provider.dart';
import 'package:mechanic_app/screens/dash_board/home/home.dart';
import 'package:mechanic_app/screens/dash_board/home/home_body.dart';
import 'package:mechanic_app/screens/dash_board/home/upcoming_request/upcoming_request.dart';
import 'package:provider/provider.dart';

import 'home_map.dart';

class HomeHeader extends StatefulWidget {
  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  Completer<GoogleMapController> _completerGoogleMap = Completer(); //////
  final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(31.2001, 29.9187),
    zoom: 13,
  );
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    String mechanicName =
        "${loadFirstNameFromDB() + " " + loadLastNameFromDB()}";
    return Consumer3<MechanicRequestProvider, MapsProvider, PolyLineProvider>(
      builder: (context, MechanicRequestProvider, MapsProvider,
              PolyLineProvider, child) =>
          Stack(alignment: Alignment(0.66, 0.10), children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Container(
              width: size.width,
              height: size.height * 0.22,
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      alignment: Alignment.topCenter,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.07), BlendMode.dstATop),
                      fit: BoxFit.fill,
                      image: AssetImage(
                          "assets/images/124122724-auto-service-and-car-repair-spare-parts-seamless-pattern-vector-line-background-of-automobile-speedo.jpg")),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment(-1.0, -4.0),
                    end: Alignment(1.0, 4.0),
                    //tileMode: TileMode.clamp,
                    stops: [
                      0.6,
                      0.2,
                      0.2,
                    ],
                    colors: [
                      Theme.of(context).primaryColorDark,
                      // Colors.,
                      // Colors.white,
                      Theme.of(context).primaryColorLight.withOpacity(0.9),
                      //Theme.of(context).hintColor.withOpacity(0.3),
                      Colors.white
                    ],
                  )),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  LinearProgressIndicator(
                    backgroundColor:
                        (MechanicRequestProvider.mechanicCurrentState == true)
                            ? Colors.white
                            : Theme.of(context).primaryColorLight,
                    color:
                        (MechanicRequestProvider.mechanicCurrentState == true)
                            ? Colors.greenAccent
                            : Theme.of(context).primaryColorLight,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AdvancedAvatar(
                          image: AssetImage("assets/icons/profile.png"),
                          size: MediaQuery.of(context).size.height * 0.06,
                          statusColor:
                              MechanicRequestProvider.mechanicCurrentState ==
                                      true
                                  ? Colors.greenAccent
                                  : Colors.grey,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: MechanicRequestProvider
                                          .mechanicCurrentState ==
                                      true
                                  ? Colors.green
                                  : Colors.grey,
                              width: 3,
                            ),
                            color: Colors.indigoAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        FSwitch(
                          open: MechanicRequestProvider.mechanicCurrentState,
                          openColor: Colors.green,
                          width: size.width * 0.18,
                          height: size.height * 0.04,
                          onChanged: (v) {
                            MechanicRequestProvider.getMechanicCurrentState(v,
                                context: context);
                            if (v == true) {}
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hey, $mechanicName',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              Text(
                                '${now.day}/${now.month}/${now.year} ',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Expanded(child: Container()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              height: size.height * 0.09,
              width: size.width * 0.2,
              //color: Colors.red,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(
                  5,
                ),
                border: Border.all(color: Colors.white, width: 5),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.2),
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.5))
                ],
              ),
              child: GoogleMap(
                initialCameraPosition: _initialPosition,
                mapType: MapType.normal,
                //liteModeEnabled: true,
                //  myLocationEnabled: true,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                polylines: PolyLineProvider.polylineSet,
                markers: PolyLineProvider.markersSet,
                circles: PolyLineProvider.circlesSet,
                onMapCreated: (GoogleMapController controller) async {
                  _completerGoogleMap.complete(controller);
                  MapsProvider.googleMapController = controller;
                  MapsProvider.locatePosition(context, x: true);
                },
              ),
            ),
            GestureDetector(
                onTap: () {
                  print("sherif");
                  Navigator.pushNamed(context, HomeMap.routeName);
                  // Navigator.of(context).push(PageRouteBuilder(
                  //     opaque: false,
                  //     pageBuilder: (BuildContext context, _, __) => HomeMap()));
                },
                child: Container(
                  color: Colors.transparent,
                  height: size.height * 0.09,
                  width: size.width * 0.2,
                )),
          ],
        ),
      ]),
    );
  }
}
