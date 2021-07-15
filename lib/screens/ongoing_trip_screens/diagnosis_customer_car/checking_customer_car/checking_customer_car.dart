import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_provider.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/checking_customer_car/checking_components/ripple_animation.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/checking_customer_car/checking_customer_car_sheet/checking_customer_car_sheet.dart';
import 'package:provider/provider.dart';

class CheckingCustomerCar extends StatefulWidget {
  static String routeName = '/CheckingCustomerCar';
  const CheckingCustomerCar({key}) : super(key: key);

  @override
  _CheckingCustomerCarState createState() => _CheckingCustomerCarState();
}

class _CheckingCustomerCarState extends State<CheckingCustomerCar> {
  @override
  void initState() {
    //_tabController = TabController(length: 2, vsync: this);
    print(loadJwtTokenFromDB());
    Provider.of<MechanicServiceProvider>(context, listen: false)
        .getMechanicServicesFromBackend();
    Provider.of<MechanicServiceProvider>(context, listen: false)
        .getMechanicItemsFromBackend();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Checking Customer Car",
                style: Theme.of(context).textTheme.headline2,
              ),
              //LinearProgressIndicator()
            ],
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RipplesAnimation(),
                // DefaultTextStyle(
                //   style: TextStyle(
                //       color: Colors.blueGrey,
                //       fontWeight: FontWeight.w900,
                //       fontSize: 22),
                //   child: Container(
                //     height: 50,
                //     child: Center(
                //       child: AnimatedTextKit(
                //         animatedTexts: [
                //           ScaleAnimatedText('Please Wait....',
                //               duration: Duration(seconds: 3)),
                //           ScaleAnimatedText('Mechanic checking Your Car Now',
                //               duration: Duration(seconds: 3)),
                //           ScaleAnimatedText(
                //               'You will receive list of diagnoses',
                //               duration: Duration(seconds: 3)),
                //           ScaleAnimatedText('To be confirmed',
                //               duration: Duration(seconds: 3))
                //         ],
                //         repeatForever: true,
                //       ),
                //     ),
                //   ),
                // ),
                // TextButton(
                //     onPressed: () {
                //       Navigator.of(context).push(PageRouteBuilder(
                //           opaque: false,
                //           pageBuilder: (BuildContext context, _, __) =>
                //               ViewingComingDiagnoses()));
                //     },
                //     child: Text("press"))
              ],
            ),
          ),
          CheckingCustomerCarSheet(context),
        ],
      ),
    );
  }
}
