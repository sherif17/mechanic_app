import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mechanic_app/localization/localization_constants.dart';
import 'package:mechanic_app/screens/dash_board/dash_board.dart';
import 'package:mechanic_app/shared_prefrences/winch_user_model.dart';
import 'package:mechanic_app/utils/routes.dart';
import 'localization/demo_localization.dart';
import 'themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences.setMockInitialValues({});
  //Firebase.initializeApp();
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
  String TOKEN;
  String BACKEND_ID;

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
    getPrefJwtToken().then((value) {
      setState(() {
        TOKEN = value;
      });
    });
    getPrefBackendID().then((value) {
      setState(() {
        BACKEND_ID = value;
      });
    });
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
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        initialRoute: DashBoard.routeName,
        // TOKEN == null || BACKEND_ID == null
        //     ? Intro.routeName
        //     : DashBoard.routeName,
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
      );
    }
  }
}
