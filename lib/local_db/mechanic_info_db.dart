import 'package:hive/hive.dart';

const String _VERIFICATION_STATE = 'verificationState';
const String _CURRENT_LANGUAGE = 'currentLanguage';
const String _JWT_TOKEN = 'jwtToken';
const String _FIREBASE_ID = 'fireBaseId';
const String _BACKEND_ID = 'ID';
const String _FIRST_NAME = 'firstName';
const String _LAST_NAME = 'lastName';
const String _PHONE_NUMBER = 'phoneNumber';
// const String _WINCH_PLATES = 'winchPlates';
// const String _WINCH_PLATES_CHARS = 'winchPlatesChars';
// const String _WINCH_PLATES_NUM = 'winchPlatesNum';
const String _WORKING_CITY = 'workingCity';
const String _IAT = 'iat';
const String _SOCIAL_IMAGE = 'socialImage';
const String _SOCIAL_EMAIL = 'socialEmail';

Box winchDriverInfo = Hive.box<String>("MechanicInfoDBBox");

saveVerificationStateInDB(state) {
  winchDriverInfo.put(_VERIFICATION_STATE, state);
}

loadVerificationStateFromDB() {
  return winchDriverInfo.get(_VERIFICATION_STATE);
}

////////////////////////////////////////////////////////////////////////
saveCurrentLangInDB(String lang) {
  winchDriverInfo.put(_CURRENT_LANGUAGE, lang);
}

String loadCurrentLangFromDB() {
  return winchDriverInfo.get(_CURRENT_LANGUAGE, defaultValue: "en");
}

////////////////////////////////////////////////////////////////////////
saveJwtTokenInDB(String jwt) {
  winchDriverInfo.put(_JWT_TOKEN, jwt);
}

String loadJwtTokenFromDB() {
  return winchDriverInfo.get(_JWT_TOKEN, defaultValue: "");
}

///////////////////////////////////////////////////////////////////////////
saveFirebaseIDInDB(String fireID) {
  winchDriverInfo.put(_FIREBASE_ID, fireID);
}

String loadFirebaseFromDB() {
  return winchDriverInfo.get(_FIREBASE_ID, defaultValue: "");
}

////////////////////////////////////////////////////////////////////////////
saveBackendIBInDB(String backID) {
  winchDriverInfo.put(_BACKEND_ID, backID);
}

String loadBackendIDFromDB() {
  return winchDriverInfo.get(_BACKEND_ID, defaultValue: "");
}

////////////////////////////////////////////////////////////////////////////
saveFirstNameInDB(String fName) {
  winchDriverInfo.put(_FIRST_NAME, fName);
}

String loadFirstNameFromDB() {
  return winchDriverInfo.get(_FIRST_NAME, defaultValue: "");
}

/////////////////////////////////////////////////////////////////////////
saveLastNameInDB(String lName) {
  winchDriverInfo.put(_LAST_NAME, lName);
}

String loadLastNameFromDB() {
  return winchDriverInfo.get(_LAST_NAME, defaultValue: "");
}

/////////////////////////////////////////////////////////////////////
savePhoneNumberInDB(String phone) {
  winchDriverInfo.put(_PHONE_NUMBER, phone);
}

String loadPhoneNumberFromDB() {
  return winchDriverInfo.get(_PHONE_NUMBER, defaultValue: "");
}
//
// //////////////////////////////////////////////////////////////////////
// saveWinchPlatesInDB(String phone) {
//   winchDriverInfo.put(_WINCH_PLATES, phone);
// }
//
// String loadWinchPlatesFromDB() {
//   return winchDriverInfo.get(_WINCH_PLATES, defaultValue: "");
// }
//
// //////////////////////////////////////////////////////////////////////
// saveWinchPlatesNumInDB(String phone) {
//   winchDriverInfo.put(_WINCH_PLATES_NUM, phone);
// }
//
// String loadWinchPlatesNumFromDB() {
//   return winchDriverInfo.get(_WINCH_PLATES_NUM, defaultValue: "");
// }
//
// //////////////////////////////////////////////////////////////////////
// saveWinchPlatesCharInDB(String phone) {
//   winchDriverInfo.put(_WINCH_PLATES_CHARS, phone);
// }
//
// String loadWinchPlatesCharFromDB() {
//   return winchDriverInfo.get(_WINCH_PLATES_CHARS, defaultValue: "");
// }

//////////////////////////////////////////////////////////////////////
saveWorkingCityInDB(String phone) {
  winchDriverInfo.put(_WORKING_CITY, phone);
}

String loadWorkingCityFromDB() {
  return winchDriverInfo.get(_WORKING_CITY, defaultValue: "N/A");
}

//////////////////////////////////////////////////////////////////////
saveIATInDB(String iat) {
  winchDriverInfo.put(_IAT, iat);
}

String loadIATFromDB() {
  return winchDriverInfo.get(_IAT, defaultValue: "");
}

///////////////////////////////////////////////////////////////////////
saveSocialImageInDB(String url) {
  winchDriverInfo.put(_SOCIAL_IMAGE, url);
}

String loadSocialImageFromDB() {
  return winchDriverInfo.get(_SOCIAL_IMAGE, defaultValue: "");
}

////////////////////////////////////////////////////////////////////
saveSocialEmailInDB(String email) {
  winchDriverInfo.put(_SOCIAL_EMAIL, email);
}

String loadSocialEmailFromDB() {
  return winchDriverInfo.get(_SOCIAL_EMAIL, defaultValue: "");
}

/////////////////////////////////////////////////////////////////
printAllMechanicSavedInfoInDB() {
  print("_VERIFICATION_STATE : ${loadVerificationStateFromDB()}");
  print("_CURRENT_LANGUAGE : ${loadCurrentLangFromDB()}");
  print("_JWT_TOKEN : ${loadJwtTokenFromDB()}");
  print("_FIREBASE_ID : ${loadFirebaseFromDB()}");
  print("_BACKEND_ID : ${loadBackendIDFromDB()}");
  print("_FIRST_NAME : ${loadFirstNameFromDB()}");
  print("_LAST_NAME : ${loadLastNameFromDB()}");
  print("_PHONE_NUMBER : ${loadPhoneNumberFromDB()}");
  print("_IAT : ${loadIATFromDB()}");
  print("_WORKING_CITY : ${loadWorkingCityFromDB()}");
  //print("_WINCH_PLATES : ${loadWinchPlatesFromDB()}");
  print("_SOCIAL_IMAGE : ${loadSocialImageFromDB()}");
  print("_SOCIAL_EMAIL : ${loadSocialEmailFromDB()}");
}

resetAllMechanicSavedInfoInDB() {
  winchDriverInfo.clear();
}
