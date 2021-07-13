import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_app/models/service_request.dart';
import 'package:mechanic_app/provider/appControlProvider.dart';
import 'package:mechanic_app/provider/upcoming_mechanic_service/mechanic_request_provider.dart';
import 'package:mechanic_app/services/requesting_mechanic/mechanic_request_service.dart';
import 'package:provider/provider.dart';
import 'tabs/centers_tabs/centers_tab.dart';
import 'home_components/home_header.dart';
import 'tabs/individual_tabs/individual_no_request_tab.dart';
import 'tabs/individual_tabs/individual_tab.dart';
import 'package:location_permissions/location_permissions.dart';

class HomeBody extends StatefulWidget {
  static String routeName = '/HomeBody';
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final titles = ["List 1", "List 2", "List 3"];
  //bool newRequestAvailable = false;

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

  requestPermission() async {
    PermissionStatus permission =
        await LocationPermissions().requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MechanicRequestProvider>(context,listen: false).cttx=context;
    Size size = MediaQuery.of(context).size;
    DateTime time1 = DateTime.now();
    ServiceRequest serviceRequest1 = ServiceRequest(
        'ash park,pembroke Dock,5a27',
        'BMW-200',
        'س م ع-1234',
        ["Oil Exchange", "Ac Repair"],
        time1);
    ServiceRequest serviceRequest2 = ServiceRequest(
        '27 abdulqader ragab,kafr abdo',
        'seat ibiza',
        'س م ع-9834',
        ["Tire Change", "Motor", "Oil Exchange"],
        time1);
    ServiceRequest serviceRequest3 = ServiceRequest(
        '580 North Dupont Highway Dover, DE 19901',
        'Mercides',
        'س ر خ-9834',
        ["Tire Change", "Motor", "Oil Exchange", "ygyhgfyhfht", "jhjuhjkh"],
        time1);

    List<ServiceRequest> serviceRequestsList = [
      serviceRequest1,
      serviceRequest2,
      serviceRequest3
    ];

    return Consumer<AppControlProvider>(
      builder: (context, val, child) => Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                HomeHeader(),
                Container(
                  height: 45,
                  width: size.width * 0.97,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    border: Border.all(color: Colors.white, width: 5),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.2),
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.5))
                    ],
                  ),
                  child: TabBar(
                    controller: _tabController,
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    labelColor: Theme.of(context).accentColor,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      // Individual tab
                      Tab(
                        text: 'Individual',
                      ),

                      // Centers tab
                      Tab(
                        text: 'Centers',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Center(
                    child: Container(
                      child: false
                          // (val.newRequestAvailable ||
                          //         serviceRequestsList.length > 0)
                          ? IndividualTab(
                              serviceRequestsList: serviceRequestsList)
                          : IndividualNoRequestTab(),
                    ),
                  ),

                  // centers tab bar view widget
                  Center(
                    child: Container(
                      child: CentersTab(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
