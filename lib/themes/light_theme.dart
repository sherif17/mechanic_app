import 'package:flutter/material.dart';

ThemeData lightTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1.copyWith(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato',
        color: Color(0xFF564FCC),
      ),
      headline2: base.headline2.copyWith(
          fontSize: 23.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
          color: Color(0xFF636780)
          //color: Colors.black54
          ),
      headline3: base.headline3.copyWith(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato',
        color: Colors.black,
      ),
      headline4: base.headline4.copyWith(
        fontSize: 18.0,
        fontFamily: 'Lato',
        color: Color(0xFFFF718D),
      ),
      headline5: base.headline4.copyWith(
        fontSize: 25.0,
        fontFamily: 'Lato',
        color: Color(0xFF413B99),
        //buttons
      ),
      headline6: base.headline6.copyWith(
        fontSize: 23.0,
        fontFamily: 'Lato',
      ),
      bodyText1: base.bodyText1.copyWith(
        color: Color(0xFF4F5266),
        //color: Colors.grey[800],
        fontSize: 15,
      ),
      bodyText2: base.bodyText2.copyWith(
          fontSize: 16.0,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w800,
          color: Color(0xFF4F5266)
          //color: Colors.grey[900],
          ),
      button: base.button.copyWith(
          fontSize: 20.0,
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold),
      caption: base.headline5.copyWith(
        fontSize: 14.0,
        fontFamily: 'Lato',
      ),
      subtitle1: base.subtitle1.copyWith(
        fontSize: 15.0,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w900,
        color: Color(0xFF564FCC),
      ),
      subtitle2: base.subtitle1.copyWith(),
      overline: base.subtitle1.copyWith(),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Color(0xFF564FCC),
    primaryColorLight: Color(0xFF6C63FF),
    primaryColorDark: Color(0xFF413B99),
    accentColor: Colors.white,
    hintColor: Color(0xFFFF718D),
    scaffoldBackgroundColor: Colors.white,
    errorColor: Colors.redAccent[700],
    //canvasColor: Colors.transparent,
    backgroundColor: Colors.white,
    primaryTextTheme: TextTheme(
      headline2: TextStyle(
        color: Colors.white,
        fontFamily: "Lato",
        fontSize: 16.0,
      ),
    ),
    accentTextTheme: TextTheme(
      headline3: TextStyle(
        color: Colors.black54,
        fontFamily: "Lato",
        fontSize: 16.0,
      ),
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF564FCC),
      size: 20.0,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF564FCC),
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.primary,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Color(0xFF564FCC),
      overlayColor: Color(0xFF564FCC).withAlpha(32),
      thumbColor: Color(0xFF564FCC),
    ),
    inputDecorationTheme: inputDecorationTheme(base),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      textTheme: base.textTheme..headline3,
    ),
  );
}

// for register input field
InputDecorationTheme inputDecorationTheme(ThemeData base) {
  OutlineInputBorder EnabledInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey[900], width: 1),
    gapPadding: 15,
  );
  OutlineInputBorder FocusedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey[900], width: 1.5),
    gapPadding: 10,
  );

  OutlineInputBorder disableInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey[900], width: 0.5),
  );

  OutlineInputBorder ErrorInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Color(0xFF564FCC)));

  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 20,
    ),
    enabledBorder: EnabledInputBorder,
    disabledBorder: disableInputBorder,
    focusedBorder: FocusedInputBorder,
    errorBorder: ErrorInputBorder,
    border: EnabledInputBorder,
    hintStyle: TextStyle(),
    labelStyle: TextStyle(color: Color(0xFFFF718D)),
  );
}
////link url fot this method :https://codeburst.io/managing-multiple-themes-in-flutter-application-37411adeb04c
