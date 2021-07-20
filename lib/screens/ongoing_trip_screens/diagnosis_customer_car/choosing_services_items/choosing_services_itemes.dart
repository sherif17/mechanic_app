import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_cart_provider.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_provider.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/choosing_services_items/components/circle_painter.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/choosing_services_items/mechanic_items.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/choosing_services_items/mechanic_services.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/viewing_cart_detailes/viewing_diagnosis_cart_details.dart';
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
    // Provider.of<MechanicServiceProvider>(context, listen: false)
    //     .getMechanicServicesFromBackend();
    // Provider.of<MechanicServiceProvider>(context, listen: false)
    //     .getMechanicItemsFromBackend();
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
    return Consumer<MechanicServicesCartProvider>(
      builder: (context, mechanicServicesCartProvider, child) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                child: Stack(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          //height: size.height * 0.8,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              // Actions tab bar view widget
                              Container(
                                child: MechanicService(),
                              ),

                              // Details tab bar view widget
                              Container(
                                child: MechanicItems(),
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
                      SizedBox(
                        width: size.height * 0.05,
                        height: size.height * 0.05,
                        child: CustomPaint(
                            painter:
                                CirclePainter(), //fromRadius(size.height * 0.1),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                  mechanicServicesCartProvider.cartCounter
                                      .toString(),
                                  style: TextStyle(color: Colors.white)),
                            )),
                      ),
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
                  Text(
                      //" Visit Fare EGP",
                      "Subtotal : ${mechanicServicesCartProvider.subTotal} EGP",
                      style: TextStyle(fontSize: 16, color: Colors.white))
                ],
              ),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.redAccent),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColorLight),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(width: 1.5, color: Colors.white)))),
              onPressed: () {
                if (mechanicServicesCartProvider.cartCounter > 0) {
                  Navigator.of(context)
                      .pushNamed(ViewingDiagnosesCartDetails.routeName);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text('You should select one service or item !')));
                }
              }),
        ),
      ),
    );
  }
}
