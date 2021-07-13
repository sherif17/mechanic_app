import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanic_app/provider/upcoming_mechanic_service/mechanic_request_provider.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/checking_customer_car/checking_customer_car_sheet/car_details.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/checking_customer_car/checking_customer_car_sheet/customer_needs.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/choosing_services_items/choosing_services_itemes.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/sarting_mechanic_service.dart';
import 'package:provider/provider.dart';
import 'package:slider_button/slider_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mechanic_app/provider/maps_prepration/maps_provider.dart';

import '../../../actions_tab.dart';
import '../../../details_tab.dart';
//import 'package:mechanic_app/provider/upcomming_winch_service/winch_request_provider.dart';

class CheckingCustomerCarSheet extends StatefulWidget {
  static String routeName = '/AcceptedServiceSheet';
  BuildContext ctx;

  CheckingCustomerCarSheet(this.ctx);

  @override
  _CheckingCustomerCarSheetState createState() =>
      _CheckingCustomerCarSheetState();
}

class _CheckingCustomerCarSheetState extends State<CheckingCustomerCarSheet>
    with SingleTickerProviderStateMixin {
  void _launchDial(String number) async => await canLaunch("tel:$number")
      ? await launch("tel:$number")
      : throw 'Could not launch tel:$number';
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mechanicRequestProvider =
        Provider.of<MechanicRequestProvider>(context);
    //String customerFirstName = "Jomana";
    String customerFirstName =
        mechanicRequestProvider.upcomingRequestResponseModel.firstName;
    //String customerLastName = "Hossam";
    String customerLastName =
        mechanicRequestProvider.upcomingRequestResponseModel.lastName;
    // String customerCarPlates = "س ن ت 7932";
    String customerCarPlates =
        mechanicRequestProvider.getNearestClientResponseModel.CarPlates;
    //String customerCarBrand = "Seat";
    String customerCarBrand =
        mechanicRequestProvider.getNearestClientResponseModel.CarBrand;
    //String customerCarModel = "Ibiza";
    String customerCarModel =
        mechanicRequestProvider.getNearestClientResponseModel.CarModel;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Consumer<MapsProvider>(
        builder: (context, MapsProvider, child) => DraggableScrollableSheet(
          initialChildSize: 0.1,
          minChildSize: 0.1,
          maxChildSize: 0.99,
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
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
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
                                  vertical: MediaQuery.of(context).size.height *
                                      0.005),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    child: Expanded(
                                      flex: 5,
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          ColorizeAnimatedText(
                                            // "${customerCarBrand ?? "Car Brand"}-${customerCarModel ?? "Model"}",
                                            "Please Start Checking ${customerCarBrand ?? "Car Brand"}-${customerCarModel ?? "Model"} ",
                                            textStyle: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Horizon',
                                              decoration: TextDecoration.none,
                                            ), //colorizeTextStyle,
                                            colors: colorizeColors,
                                          ),
                                          ColorizeAnimatedText(
                                            "To Determine Required Repaires",
                                            //'Meet ${customerFirstName ?? "FName"} at 2:30',
                                            textStyle: TextStyle(
                                              fontSize: 20,
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
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
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
                                  SizedBox(height: 30.0),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                      ),
                                      child: TabBar(
                                        controller: _tabController,
                                        indicator: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        labelColor:
                                            Theme.of(context).accentColor,
                                        unselectedLabelColor: Colors.black,
                                        tabs: [
                                          // actions tab
                                          Tab(
                                            text: 'Customer Needs',
                                          ),

                                          // details tab
                                          Tab(
                                            text: 'Car Details',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // tab bar view here
                                  Expanded(
                                    child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        // Actions tab bar view widget
                                        Center(
                                          child: Container(
                                            child: CustomerNeeds(),
                                          ),
                                        ),

                                        // Details tab bar view widget
                                        Center(
                                          child: Container(
                                            child: CarDetails(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 15.0,
                                offset: Offset(0.0, 0.75))
                          ],
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                child: Text("Select Services & items to be made".toUpperCase(),
                                    style: TextStyle(fontSize: 18)),
                                style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(15)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blueGrey),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: BorderSide(color: Colors.green)))),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context, ChoosingServicesItems.routeName, (route) => false);
                                  // mechanicRequestProvider.approveUpComingDiagnosis();
                                },
                              ),
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
