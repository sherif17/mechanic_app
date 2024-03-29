import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/jomana_files/actions_tab.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/jomana_files/details_tab.dart';

class StartingMechanicService extends StatefulWidget {
  //static String routeName = '/StartingMechanicService';
  @override
  _StartingMechanicServiceState createState() => _StartingMechanicServiceState();
  }

  class _StartingMechanicServiceState extends State<StartingMechanicService> with SingleTickerProviderStateMixin {

  TabController _tabController;


  DateTime now = DateTime.now();
  String mechanicName = "Sherif Ahmed";

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
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Tab bar',
      //   ),
      // ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 40.0),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                labelColor: Theme.of(context).accentColor,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // actions tab
                  Tab(
                    text: 'Actions',
                  ),

                  // details tab
                  Tab(
                    text: 'Details',
                  ),
                ],
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
                      child: ActionsTab(),
                    ),
                  ),

                  // Details tab bar view widget
                  Center(
                    child:  Container(
                      child: DetailsTab(),
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

