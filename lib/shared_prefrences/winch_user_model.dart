import 'package:shared_preferences/shared_preferences.dart';

const String _CURRENT_LANGUAGE = 'currentLanguage';
const String _JWT_TOKEN = 'jwtToken';
const String _FIREBASE_ID = 'fireBaseId';
const String _BACKEND_ID = 'ID';
const String _FIRST_NAME = 'firstName';
const String _LAST_NAME = 'lastName';
const String _PHONE_NUMBER = 'phoneNumber';
//const String _WINCH_PLATES = 'winchPlates';
//const String _WINCH_PLATES_CHARS = 'winchPlatesChars';
//const String _WINCH_PLATES_NUM = 'winchPlatesNum';
const String _WORKING_CITY = 'workingCity';
const String _IAT = 'iat';
const String _SOCIAL_IMAGE = 'socialImage';
const String _SOCIAL_EMAIL = 'socialEmail';

///////////////////////////////////////////////////////
Future<String> getPrefCurrentLang() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(_CURRENT_LANGUAGE) ?? "en";
}

Future<String> setPrefCurrentLang(String value) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(_CURRENT_LANGUAGE, value);
}

loadPrefCurrentLang() async {
  return getPrefCurrentLang();
}

//////////////////////////////////////////////////////////////////
Future<String> getPrefJwtToken() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(_JWT_TOKEN) ?? null;
}

Future<String> setPrefJwtToken(String value) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(_JWT_TOKEN, value);
}

loadPrefJwtToken() async {
  return getPrefJwtToken();
}

//////////////////////////////////////////////////////////////
Future<String> getPrefFirebaseID() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(_FIREBASE_ID) ?? null;
}

Future<String> setPrefFirebaseID(String value) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(_FIREBASE_ID, value);
}

loadPrefFirebaseID() async {
  return getPrefFirebaseID();
}

////////////////////////////////////////////////////////////////////
Future<String> getPrefBackendID() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(_BACKEND_ID) ?? null;
}

Future<String> setPrefBackendID(String value) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(_BACKEND_ID, value);
}

loadPrefBackendID() async {
  return getPrefBackendID();
}

///////////////////////////////////////////////////////////////////////
Future<String> getPrefFirstName() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String value = _prefs.getString(_FIRST_NAME) ?? null;
  return value;
}

Future<String> setPrefFirstName(String value) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(_FIRST_NAME, value);
}

/*
loadPrefFirstName() {
  String Fname = getPrefFirstName();
  return Fname;
}
*/
//////////////////////////////////////////////////////////////////////
Future<String> getPrefLastName() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(_LAST_NAME) ?? null;
}

Future<String> setPrefLastName(String value) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(_LAST_NAME, value);
}

loadPrefLastName() async {
  return getPrefLastName();
}

///////////////////////////////////////////////////////////////////////
Future<String> getPrefPhoneNumber() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(_PHONE_NUMBER) ?? null;
}

Future<String> setPrefPhoneNumber(String value) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(_PHONE_NUMBER, value);
}

loadPrefPhoneNumber() async {
  return getPrefPhoneNumber();
}

/////////////////////////////////////////////////////////////////////
// Future<String> getPrefWinchPlates() async {
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   return _prefs.getString(_WINCH_PLATES) ?? null;
// }
//
// Future<String> setPrefWinchPlates(String value) async {
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   await _prefs.setString(_WINCH_PLATES, value);
// }
//
// loadPrefWinchPlates() async {
//   return getPrefWinchPlates();
// }

/////////////////////////////////////////////////////////////////////
// Future<String> getPrefWinchPlatesChars() async {
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   return _prefs.getString(_WINCH_PLATES_CHARS) ?? null;
// }
//
// Future<String> setPrefWinchPlatesChars(String value) async {
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   await _prefs.setString(_WINCH_PLATES_CHARS, value);
// }
//
// loadPrefWinchPlatesChars() async {
//   return getPrefWinchPlatesChars();
// }

/////////////////////////////////////////////////////////////////////
// Future<String> getPrefWinchPlatesNum() async {
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   return _prefs.getString(_WINCH_PLATES_NUM) ?? null;
// }
//
// Future<String> setPrefWinchPlatesNum(String value) async {
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   await _prefs.setString(_WINCH_PLATES_NUM, value);
// }
//
// loadPrefWinchPlatesNum() async {
//   return getPrefWinchPlatesNum();
// }

/////////////////////////////////////////////////////////////////////
Future<String> getPrefWorkingCity() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(_WORKING_CITY) ?? null;
}

Future<String> setPrefWorkingCity(String value) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(_WORKING_CITY, value);
}

loadPrefWorkingCity() async {
  return getPrefWorkingCity();
}

/////////////////////////////////////////////////////////////////////
Future<String> getPrefIAT() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(_IAT) ?? null;
}

Future<String> setPrefIAT(String value) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(_IAT, value);
}

loadPrefIAT() async {
  return getPrefIAT();
}

///////////////////////////////////////////////////////
Future<String> getPrefSocialImage() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(_SOCIAL_IMAGE) ?? "";
}

Future<String> setPrefSocialImage(String value) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(_SOCIAL_IMAGE, value);
}

loadPrefGoogleImage() async {
  return getPrefSocialImage();
}

///////////////////////////////////////////////////////
Future<String> getPrefSocialEmail() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(_SOCIAL_EMAIL) ?? "";
}

Future<String> setPrefSocialEmail(String value) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(_SOCIAL_EMAIL, value);
}

loadPrefGoogleEmail() async {
  return getPrefSocialEmail();
}

/////////////////////////////////////////////////////////////////
printAllWinchUserCurrentData() async {
  print("_CURRENT_LANGUAGE : ${await getPrefCurrentLang()}");
  print("_JWT_TOKEN : ${await getPrefJwtToken()}");
  print("_FIREBASE_ID : ${await getPrefFirebaseID()}");
  print("_BACKEND_ID : ${await getPrefBackendID()}");
  print("_FIRST_NAME : ${await getPrefFirstName()}");
  print("_LAST_NAME : ${await getPrefLastName()}");
  print("_PHONE_NUMBER : ${await getPrefPhoneNumber()}");
  //print("_WINCH_PLATES : ${await getPrefWinchPlates()}");
  print("_WORKING_CITY : ${await getPrefWorkingCity()}");
  print("_IAT : ${await getPrefIAT()}");
  print("_GOOGLE_IMAGE : ${await getPrefSocialImage()}");
  print("_GOOGLE_EMAIL : ${await getPrefSocialEmail()}");
}
