import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mechanic_app/provider/maps_prepration/maps_provider.dart';
import 'package:mechanic_app/provider/maps_prepration/polyLineProvider.dart';
import 'package:mechanic_app/provider/upcoming_mechanic_service/mechanic_request_provider.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/checking_customer_car/checking_customer_car_sheet/customer_needs.dart';
import 'package:mechanic_app/widgets/divider.dart';
import 'package:provider/provider.dart';
import 'package:slider_button/slider_button.dart';

class UpcomingRequestSheet extends StatelessWidget {
  const UpcomingRequestSheet({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String customerFirstName = "FName";
    String customerLastName = "LName";
    return Consumer3<MapsProvider, PolyLineProvider, MechanicRequestProvider>(
      builder: (context, mapsProvider, polyLineProvider,
              mechanicRequestProvider, child) =>
          Stack(
        children: [
          DraggableScrollableSheet(
            initialChildSize: 0.25,
            minChildSize: 0.25,
            maxChildSize: 0.9,
            builder: (BuildContext myContext, controller) {
              const colorizeColors = [
                Color(0xFF4F5266),
                //Colors.white,
                Colors.grey
              ];

              const colorizeTextStyle = TextStyle(
                fontSize: 30,
                fontFamily: 'Horizon',
                decoration: TextDecoration.none,
              );
              return SingleChildScrollView(
                controller: controller,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height * 0.015),
                            child: Container(
                              height: 6,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedTextKit(
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                    "${mechanicRequestProvider.getNearestClientResponseModel.carBrand + " " + mechanicRequestProvider.getNearestClientResponseModel.carModel}",
                                    /*"${WinchRequestProvider.upcomingRequestResponseModel.carBrand ?? "Car Brand"}-${WinchRequestProvider.upcomingRequestResponseModel.carModel ?? "Model"}",*/
                                    textStyle: colorizeTextStyle,
                                    colors: colorizeColors,
                                  ),
                                  // ColorizeAnimatedText(
                                  //   'Meet ${WinchRequestProvider.upcomingRequestResponseModel.firstName ?? "FName"} at 2:30',
                                  //   textStyle: TextStyle(
                                  //     fontSize: 20,
                                  //     fontFamily: 'Horizon',
                                  //     decoration: TextDecoration.none,
                                  //   ), //colorizeTextStyle,
                                  //   colors: colorizeColors,
                                  // ),
                                ],
                                repeatForever: true,
                                isRepeatingAnimation: true,
                              ),
                              //     Align(
                              //         alignment: Alignment(-0.99, -0.65),
                              //         child: TextButton.icon(
                              //             icon: Icon(
                              //               Icons.directions_car_outlined,
                              //               color: Colors.red,
                              //               size: 25,
                              //             ),
                              //             label: Text(
                              //               " car info",
                              //               //customerCarProvider.selectedCarInfo,
                              //               style: TextStyle(color: Colors.blueGrey),
                              //             ))),
                              //     CircularCountDownTimer(
                              //       width: 40,
                              //       height: 40,
                              //       duration: 59,
                              //       fillColor: Colors.grey,
                              //       ringColor: Theme.of(context).primaryColorLight,
                              //       //  isReverseAnimation: true,
                              //       isReverse: true,
                              //       backgroundColor: Theme.of(context).accentColor,
                              //       onComplete: () {
                              //         // Navigator.pop(context);
                              //       },
                              //       isTimerTextShown: true,
                              //     )
                              //   ],
                              // ),
                              // Align(
                              //     alignment: Alignment(0.99, -0.65),
                              //     child: TextButton.icon(
                              //         icon: Icon(
                              //           Icons.money,
                              //           color: Colors.redAccent,
                              //           size: 25,
                              //         ),
                              //         label: Text(
                              //           "Cash",
                              //           style: TextStyle(color: Colors.blueGrey),
                              //         ))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DividerWidget(),
                        ),
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
                                      color:
                                          Colors.blueAccent.withOpacity(0.90),
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
                                      customerFirstName +
                                          " " +
                                          customerLastName,
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
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "${mechanicRequestProvider.getNearestClientResponseModel.carPlates}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "${mechanicRequestProvider.getNearestClientResponseModel.carYear}",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      "${polyLineProvider.tripDirectionDetails.distanceText}"),
                                  Text("|"),
                                  Text(
                                      "${polyLineProvider.tripDirectionDetails.durationText}"),
                                ],
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
                                  Text(
                                      '${mapsProvider.customerPickUpLocation.placeName}'),
                                ],
                              ),
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
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                  ),
                                ),
                                CustomerNeeds(),
                              ],
                            )
                          ],
                        ),
                      ]),
                ),
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.82,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(
                      0xFF4F5266), //Colors.blueGrey, //Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: // Center(child: Container(child: SliderButton(action: () {}))
                  //Text("no")
                  Center(
                child: SliderButton(
                  //dismissible: false,
                  action: () async {
                    await mechanicRequestProvider
                        .acceptUpcomingRequest(context);
                    // await WinchRequestProvider
                    //     .arrivedToCustomerLocation(ctx);
                    // if (WinchRequestProvider
                    //     .DriverARRIVED ==
                    //     true) {
                    //   await WinchRequestProvider
                    //       .startingWinchService(ctx);
                    //}

                    ///Do something here
                    print("slided");
                    //Navigator.of(context).pop();
                  },
                  label: Text(
                    "Slide To Accept The Request",
                    style: TextStyle(
                        color: Color(0xff4a4a4a),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                        fontSize: 17),
                  ),
                  // child: Container(
                  //   // color: Colors.green,
                  //   height: 60,
                  //   decoration: BoxDecoration(
                  //       // border: Border.all(
                  //       //   color: Colors.red,
                  //       // ),
                  //       boxShadow: <BoxShadow>[
                  //         BoxShadow(
                  //             color: Colors.deepPurple.withOpacity(0.2),
                  //             blurRadius: 15.0,
                  //             offset: Offset(0.0, 0.5))
                  //       ],
                  //       color: Colors
                  //           .green, //Color(0xFF4F5266), //Colors.blueGrey, //Theme.of(context).primaryColorLight,
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(10),
                  //       )),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: CircularCountDownTimer(
                  //       width: 40,
                  //       height: 40,
                  //       duration: 59,
                  //       fillColor: Colors.grey,
                  //       ringColor: Theme.of(context).primaryColorLight,
                  //       //  isReverseAnimation: true,
                  //       isReverse: true,
                  //       backgroundColor: Theme.of(context).accentColor,
                  //       onComplete: () {
                  //         // Navigator.pop(context);
                  //       },
                  //       isTimerTextShown: true,
                  //     ),
                  //   ),
                  // ),
                  icon: Icon(
                    Icons.arrow_right_alt_rounded,
                    color: Colors.white,
                    size: 60,
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  radius: 20,
                  buttonColor:
                      Colors.green.withOpacity(0.9), //Color(0xffd60000),
                  backgroundColor: Colors.white, //Color(0xff534bae),
                  highlightedColor: Colors.greenAccent,
                  baseColor: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
