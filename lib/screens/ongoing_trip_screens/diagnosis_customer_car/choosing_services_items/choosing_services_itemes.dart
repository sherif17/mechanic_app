import 'package:flutter/material.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_provider.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/choosing_services_items/mechanic_items.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/choosing_services_items/mechanic_services.dart';
import 'package:provider/provider.dart';

class ChoosingServicesItems extends StatefulWidget {
  static String routeName = '/ChoosingServicesItems';
  const ChoosingServicesItems({key}) : super(key: key);

  @override
  _ChoosingServicesItemsState createState() => _ChoosingServicesItemsState();
}

class _ChoosingServicesItemsState extends State<ChoosingServicesItems>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    Provider.of<MechanicServiceProvider>(context, listen: false)
        .getMechanicServicesFromBackend();
    Provider.of<MechanicServiceProvider>(context, listen: false)
        .getMechanicItemsFromBackend();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.03,
                        horizontal: size.width * 0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Select Services & Items To Be Done",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: new BoxDecoration(
                color: Theme.of(context).primaryColorDark, //Colors.redAccent,
                image: new DecorationImage(
                    alignment: Alignment.topCenter,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.dstATop),
                    image: AssetImage(
                        "assets/images/Car Inspection, Online Used Car Inspection Services in India.png")),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                            labelColor: Theme.of(context).accentColor,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              // actions tab
                              Tab(
                                text: 'Services',
                              ),

                              // details tab
                              Tab(
                                text: 'Items',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // Actions tab bar view widget
                            Center(
                              child: Container(
                                child: MechanicService(),
                              ),
                            ),

                            // Details tab bar view widget
                            Center(
                              child: Container(
                                child: MechanicItems(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // SizedBox(
                    //   width: size.height * 0.05,
                    //   height: size.height * 0.05,
                    //   child: CustomPaint(
                    //       painter:
                    //       CirclePainter(), //fromRadius(size.height * 0.1),
                    //       child: Align(
                    //         alignment: Alignment.center,
                    //         child: Text(
                    //             mechanicServicesCartProvider.cartCounter
                    //                 .toString(),
                    //             style: TextStyle(color: Colors.white)),
                    //       )),
                    // ),
                    SizedBox(width: size.width * 0.02),
                    Text("View Selected",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors
                                .white) //Theme.of(context).textTheme.headline2,
                        ),
                  ],
                ),
                //SizedBox(width: size.width*0.02),
                Text(" Visit Fare EGP",
                    //"Visit Fare : ${mechanicServicesCartProvider.visitFare} EGP",
                    style: TextStyle(fontSize: 16, color: Colors.white))
              ],
            ),
            style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.redAccent),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.redAccent.withOpacity(0.9)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(width: 1.5, color: Colors.white)))),
            onPressed: () {
              // if (CustomerCarProvider.selectedCar != null &&
              //     mechanicServicesCartProvider.cartCounter > 0) {
              //   Navigator.of(context)
              //       .pushNamed(ViewSelectedMechanicServices.routeName);
              // } else {
              //   if (CustomerCarProvider.selectedCar == null)
              //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //         content: Text('Please choose one of your cars !')));
              //   if (mechanicServicesCartProvider.cartCounter == 0)
              //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //         content: Text('You should select one problem !')));
              // }
            }),
      ),
    );
  }
}
