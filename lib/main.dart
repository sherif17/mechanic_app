import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/localization/localization_constants.dart';
import 'package:mechanic_app/provider/appControlProvider.dart';
import 'package:mechanic_app/provider/maps_prepration/maps_provider.dart';
import 'package:mechanic_app/provider/maps_prepration/polyLineProvider.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_cart_provider.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_provider.dart';
import 'package:mechanic_app/provider/upcoming_mechanic_service/mechanic_request_provider.dart';
import 'package:mechanic_app/screens/dash_board/dash_board.dart';
import 'package:mechanic_app/screens/onboarding_screens/intro_screens/intro.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/checking_customer_car/checking_customer_car.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/waiting_for_customer_response/waiting_for_customer_reponse.dart';
import 'package:mechanic_app/shared_prefrences/winch_user_model.dart';
import 'package:mechanic_app/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'localization/demo_localization.dart';
import 'themes/light_theme.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:mechanic_app/screens/ongoing_trip_screens/starting_service/starting_mechanic_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences.setMockInitialValues({});
  Firebase.initializeApp();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox<String>("MechanicInfoDBBox"); // for customer info
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text("SomethingWentWrong");
          //SomethingWentWrong();
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator(); //ProgressHUD(child: null, inAsyncCall: null,); //Loading();
      },
    );
  }
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  String TOKEN = loadJwtTokenFromDB();
  String BACKEND_ID = loadBackendIDFromDB();
  String MECHANIC_VERIFCATION_STATE = loadVerificationStateFromDB();

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((local) => {
          setState(() {
            _locale = local;
          })
        });
    // getPrefJwtToken().then((value) {
    //   setState(() {
    //     TOKEN = value;
    //   });
    // });
    // getPrefBackendID().then((value) {
    //   setState(() {
    //     BACKEND_ID = value;
    //   });
    // });
    super.didChangeDependencies();
  }

  @override
  Widget build(context) {
    if (_locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800])),
        ),
      );
    } else {
      // TODO: implement build
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppControlProvider>(
              create: (_) => AppControlProvider()),
          ChangeNotifierProvider<MapsProvider>(create: (_) => MapsProvider()),
          ChangeNotifierProvider<PolyLineProvider>(
              create: (_) => PolyLineProvider()),
          ChangeNotifierProvider<MechanicRequestProvider>(
              create: (_) => MechanicRequestProvider()),
          ChangeNotifierProvider<MechanicServiceProvider>(
              create: (_) => MechanicServiceProvider()),
          ChangeNotifierProvider<MechanicServicesCartProvider>(
              create: (_) => MechanicServicesCartProvider())
        ],
        child: new MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme(),
          initialRoute:
              StartingMechanicService.routeName, //DashBoard.routeName,
          // MECHANIC_VERIFCATION_STATE == true
          //     ? DashBoard.routeName
          // //     : Intro.routeName,
          //TOKEN == "" || BACKEND_ID == ""
          // MECHANIC_VERIFCATION_STATE == "true" &&
          //         MECHANIC_VERIFCATION_STATE != null
          //     ? DashBoard.routeName
          //     : Intro.routeName,
          routes: routes,
          locale: _locale,
          supportedLocales: [
            Locale("en", "US"),
            Locale("ar", "EG"),
          ],
          localizationsDelegates: [
            DemoLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (deviceLocal, supportedLocales) {
            for (var local in supportedLocales) {
              if (local.languageCode == deviceLocal.languageCode &&
                  local.countryCode == deviceLocal.countryCode) {
                return deviceLocal;
              }
            }
            return supportedLocales.first;
          },
        ),
      );
    }
  }
}
