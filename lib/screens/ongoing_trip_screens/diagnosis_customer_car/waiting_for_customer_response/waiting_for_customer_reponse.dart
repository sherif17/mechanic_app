import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_provider.dart';
import 'package:mechanic_app/provider/upcoming_mechanic_service/mechanic_request_provider.dart';
import 'package:mechanic_app/services/requesting_mechanic/mechanic_request_service.dart';
import 'package:provider/provider.dart';
import 'package:slider_button/slider_button.dart';

class WaitingForCustomerResponse extends StatefulWidget {
  static String routeName = '/WaitingForCustomerResponse';
  const WaitingForCustomerResponse({key}) : super(key: key);

  @override
  _WaitingForCustomerResponseState createState() =>
      _WaitingForCustomerResponseState();
}

class _WaitingForCustomerResponseState
    extends State<WaitingForCustomerResponse> {
  @override
  void initState() {
    super.initState();
    //Provider.of<WinchRequestProvider>(context, listen: false).setCustomMarker();
    listening(context);
  }

  listening(context) async {
    await Provider.of<MechanicRequestProvider>(context, listen: false)
        .listeningForCustomerResponse(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<MechanicRequestProvider>(
      builder: (context, mechanicRequestProvider, child) => Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                mechanicRequestProvider.WAITING_FOR_APPROVAL == true
                    ? "Waiting For Customer Response"
                    : mechanicRequestProvider.CUSTOMER_RESPONSE == true
                        ? "Customer Accept Diagnosis"
                        : "Customer Reject Diagnosis",
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        body: Container(
            child: mechanicRequestProvider.WAITING_FOR_APPROVAL == true
                ? buildWatingForResponseView(size)
                : mechanicRequestProvider.CUSTOMER_RESPONSE == true
                    ? buildCustomerApprovedDiagnosisView(size)
                    : buildCustomerRejectDiagnosis(size,mechanicRequestProvider)),
      ),
    );
  }

  Stack buildCustomerRejectDiagnosis(Size size ,MechanicRequestProvider mechanicRequestProvider) {
    return Stack(
      children: [
        Center(
          child: SvgPicture.asset(
            "assets/illustrations/undraw_cancel_u1it.svg",
            height: size.height * 0.4,
            width: size.width * 0.1,
          ),
        ),
        Consumer<MechanicServiceProvider>(
          builder: (context, mechanicServiceProvider, child) =>
              DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 0.32,
            builder: (BuildContext myContext, controller) {
              const colorizeColors = [Colors.white, Colors.white, Colors.grey];

              const colorizeTextStyle = TextStyle(
                fontSize: 30,
                fontFamily: 'Horizon',
                decoration: TextDecoration.none,
              );

              return SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    Stack(
                      // alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.32,
                          decoration: BoxDecoration(
                              color: Color(
                                  0xFF4F5266), //Theme.of(context).primaryColorDark,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.015),
                                child: Container(
                                  height: 6,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.005),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //  Text("no"),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.008),
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          ColorizeAnimatedText(
                                            "Unfortunately",
                                            textStyle: colorizeTextStyle,
                                            colors: colorizeColors,
                                          ),
                                          ColorizeAnimatedText(
                                            'Customer Reject Your Diagnosis',
                                            textStyle: TextStyle(
                                              fontSize: 22,
                                              fontFamily: 'Horizon',
                                              decoration: TextDecoration.none,
                                            ), //colorizeTextStyle,
                                            colors: colorizeColors,
                                          ),
                                        ],
                                        repeatForever: true,
                                        isRepeatingAnimation: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.1,
                          //right: 5,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                )),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                // MechanicRequestProvider.DriverARRIVED == false ?

                                SliderButton(
                                  dismissible: true,
                                  child:mechanicRequestProvider.endCurrentMechanicServiceIsLoading==true?CircularProgressIndicator():Container(),
                                  action: () async {
                                    await mechanicRequestProvider.endCurrentMechanicService();
                                    // await mechanicRequestProvider
                                    //     .arrivedToCustomerLocation(context);
                                    // await mechanicRequestProvider
                                    //     .arrivedToCustomerLocation(
                                    //         ctx);
                                    // if (mechanicRequestProvider
                                    //         .DriverARRIVED ==
                                    //     true) {
                                    //   Navigator
                                    //       .pushNamedAndRemoveUntil(
                                    //           context,
                                    //           StartingMechanicService
                                    //               .routeName,
                                    //           (route) => false);
                                    // await mechanicRequestProvider
                                    //     .startingWinchService(ctx);
                                    // if (mechanicRequestProvider
                                    //     .SERVICE_STARTTED = true)
                                    ///Do something here
                                    print("slided");
                                    //Navigator.of(context).pop();
                                  },
                                  label: Text(
                                    "Slide To End Services",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none,
                                        fontSize: 17),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_right_alt_rounded,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  radius: 20,
                                  buttonColor: Colors.red
                                      .withOpacity(0.9), //Color(0xffd60000),
                                  backgroundColor: Colors.grey
                                      .withOpacity(0.2), //Color(0xff534bae),
                                  highlightedColor: Colors.black,
                                  baseColor: Colors.red,
                                )
                                //     :
                                // CircularProgressIndicator(
                                //         valueColor: AlwaysStoppedAnimation<Color>(
                                //           Colors.red,
                                //         ),
                                //       )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Stack buildCustomerApprovedDiagnosisView(Size size) {
    return Stack(
      children: [
        Center(
          child: SvgPicture.asset(
            "assets/illustrations/undraw_happy_announcement_ac67.svg",
            height: size.height * 0.4,
            width: size.width * 0.1,
          ),
        ),
        Consumer<MechanicServiceProvider>(
          builder: (context, mechanicServiceProvider, child) =>
              DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 0.32,
            builder: (BuildContext myContext, controller) {
              const colorizeColors = [Colors.white, Colors.white, Colors.grey];

              const colorizeTextStyle = TextStyle(
                fontSize: 30,
                fontFamily: 'Horizon',
                decoration: TextDecoration.none,
              );

              return SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    Stack(
                      // alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.32,
                          decoration: BoxDecoration(
                              color: Color(
                                  0xFF4F5266), //Theme.of(context).primaryColorDark,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.015),
                                child: Container(
                                  height: 6,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.005),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //  Text("no"),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.008),
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          ColorizeAnimatedText(
                                            "Congratulations",
                                            textStyle: colorizeTextStyle,
                                            colors: colorizeColors,
                                          ),
                                          ColorizeAnimatedText(
                                            'Customer Approved You Diagnosis',
                                            textStyle: TextStyle(
                                              fontSize: 22,
                                              fontFamily: 'Horizon',
                                              decoration: TextDecoration.none,
                                            ), //colorizeTextStyle,
                                            colors: colorizeColors,
                                          ),
                                        ],
                                        repeatForever: true,
                                        isRepeatingAnimation: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.1,
                          //right: 5,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                )),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                // MechanicRequestProvider.DriverARRIVED == false ?
                                SliderButton(
                                  //dismissible: false,
                                  action: () async {
                                    // await mechanicRequestProvider
                                    //     .arrivedToCustomerLocation(context);
                                    // await mechanicRequestProvider
                                    //     .arrivedToCustomerLocation(
                                    //         ctx);
                                    // if (mechanicRequestProvider
                                    //         .DriverARRIVED ==
                                    //     true) {
                                    //   Navigator
                                    //       .pushNamedAndRemoveUntil(
                                    //           context,
                                    //           StartingMechanicService
                                    //               .routeName,
                                    //           (route) => false);
                                    // await mechanicRequestProvider
                                    //     .startingWinchService(ctx);
                                    // if (mechanicRequestProvider
                                    //     .SERVICE_STARTTED = true)
                                    ///Do something here
                                    print("slided");
                                    //Navigator.of(context).pop();
                                  },
                                  label: Text(
                                    "Slide To Start Your Work",
                                    style: TextStyle(
                                        color: Color(0xff4a4a4a),
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none,
                                        fontSize: 17),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_right_alt_rounded,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  radius: 20,
                                  buttonColor: Colors.green
                                      .withOpacity(0.9), //Color(0xffd60000),
                                  backgroundColor: Colors.grey
                                      .withOpacity(0.2), //Color(0xff534bae),
                                  highlightedColor: Colors.greenAccent,
                                  baseColor: Colors.green,
                                )
                                //     :
                                // CircularProgressIndicator(
                                //         valueColor: AlwaysStoppedAnimation<Color>(
                                //           Colors.red,
                                //         ),
                                //       )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Stack buildWatingForResponseView(Size size) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/illustrations/undraw_a_moment_to_relax_bbpa.svg",
              height: size.height * 0.4,
              width: size.width * 0.1,
            ),
            Container(
              height: size.height * 0.2,
              width: size.width * 0.9,
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 30,
                    fontFamily: 'Canterbury',
                    color: Color(0xFF4F5266),
                    fontWeight: FontWeight.bold),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    animatedTexts: [
                      ScaleAnimatedText('Please wait for customer response',
                          duration: Duration(seconds: 4)),
                      ScaleAnimatedText('Your customer received your diagnoses',
                          duration: Duration(seconds: 4)),
                      ScaleAnimatedText(
                          'His response will arrive to you shortly',
                          duration: Duration(seconds: 4)),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
            ),
          ],
        ),
        LinearProgressIndicator(
          color: Colors.white,
          backgroundColor: Colors.green,
        ),
      ],
    );
  }
}
