import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mechanic_app/localization/localization_constants.dart';
import 'package:mechanic_app/models/user_register_model.dart';
import 'package:mechanic_app/screens/login_screens/file_upload/main_stepper.dart';
import 'package:mechanic_app/screens/login_screens/otp/componants/progress_bar.dart';
import 'package:mechanic_app/shared_prefrences/winch_user_model.dart';
import 'package:mechanic_app/widgets/rounded_button.dart';
import '../common_widgets/background.dart';
import '../../../widgets/form_error.dart';
import 'components/or_divider.dart';
import 'register_form.dart';
import '../../../widgets/borderd_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  WinchRegisterRequestModel winchRegisterRequestModel;
  dynamic googleName;
  dynamic googleImage;
  dynamic googleEmail;

  dynamic faceName;
  dynamic faceImage;
  dynamic faceEmail;

  String facebookProfile;
  bool isApiCallProcess = false;

  String jwtToken;
  String responseID;
  String responseFName;
  String responseLName;
  int responseIat;

  @override
  void initState() {
    super.initState();
    getCurrentPrefData();
    winchRegisterRequestModel = new WinchRegisterRequestModel();
  }

  String currentLang;

  void getCurrentPrefData() {
    getPrefCurrentLang().then((value) {
      setState(() {
        currentLang = value;
      });
    });
  }

  Widget build(BuildContext context) {
    return ProgressHUD(
      child: social_build(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0,
    );
  }

  @override
  Widget social_build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // otpNavData otpResponse = ModalRoute.of(context).settings.arguments;
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    //final facebookLogin = FacebookLogin();
    Map userProfile;
    return Background(
      child: SingleChildScrollView(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        child: Column(
          children: <Widget>[
            // SizedBox(height: size.height * 0.00005),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03, right: size.width * 0.03),
              child: Align(
                alignment: currentLang == "en"
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Text(
                  getTranslated(context, "What's Your Name ?"),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              child: Align(
                alignment: currentLang == "en"
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    getTranslated(context,
                        "Your name helps Captains to confirm who they 're picking up"),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: RegisterForm(
                  currentLang: currentLang,
                  /*otpResponse_jwt: otpResponse.jwtToken,
                    otpResponse_phone: otpResponse.Phone*/
                )),
            SizedBox(height: size.height * 0.02),
            OrDivider(),
            SizedBox(height: size.height * 0.02),
            borderedRoundedButton(
              text: getTranslated(context, 'Continue with Facebook'),
              iconSrc: 'assets/icons/facebook.svg',
              CornerRadius: 29,
              press: () async {
                /*final result = await facebookLogin.logIn(['email']);
                final token = result.accessToken.token;
                final graphResponse = await http.get(
                    'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
                final profile = JSON.jsonDecode(graphResponse.body);
                print(profile);
                userProfile = profile;
                faceName = userProfile['name'];
                faceEmail = userProfile['email'];
                faceImage = userProfile["picture"]["data"]["url"];
                List FDecode;
                if (faceName != null &&
                    faceEmail != null &&
                    faceImage != null) {
                  FDecode = faceName.split(new RegExp('\\s+'));
                  print(FDecode);
                  registerRequestModel.firstName = FDecode[0];
                  registerRequestModel.lastName = FDecode[1];
                  print("Request body: ${registerRequestModel.toJson()}.");
                  setState(() {
                    isApiCallProcess = true;
                  });

                  ApiService apiService = new ApiService();
                  apiService
                      .registerUser(registerRequestModel, otpResponse.jwtToken)
                      .then((value) {
                    if (value.error == null) {
                      jwtToken = value.token;
                      Map<String, dynamic> decodedToken =
                          JwtDecoder.decode(jwtToken);
                      responseID = decodedToken["_id"];
                      responseFName = decodedToken["firstName"];
                      responseLName = decodedToken["lastName"];
                      responseIat = decodedToken["iat"];
                      print(jwtToken);
                      print(responseID);
                      print(responseLName);
                      print(responseFName);
                      print(responseIat);
                      setState(() {
                        isApiCallProcess = false;
                      });
                      showRegisterModalBottomSheet(
                          context,
                          size.height * 0.4,
                          true,
                          "ByFacebook",
                          otpNavData(
                              jwtToken: jwtToken,
                              Phone: otpResponse.Phone,
                              socialEmail: faceEmail,
                              socialPhoto: faceImage));
                    } else {
                      //response come error msg
                      print(value.error);
                      setState(() {
                        isApiCallProcess = false;
                      });
                      showRegisterModalBottomSheet(
                          context, size.height * 0.4, false, " ", "");
                    }
                  });
                } else {
                  print("error on loading From facebook");
                  setState(() {
                    isApiCallProcess = false;
                  });
                  showRegisterModalBottomSheet(
                      context, size.height * 0.4, false, "byFacebookError", "");
                }*/
              },
            ),

            SizedBox(height: size.height * 0.02),
            borderedRoundedButton(
                text: getTranslated(context, "Continue with Google"),
                iconSrc: 'assets/icons/google_logo.svg',
                CornerRadius: 29,
                press: () async {
                  try {
                    await _googleSignIn.signIn();
                    googleName = _googleSignIn.currentUser.displayName;
                    googleImage = _googleSignIn.currentUser.photoUrl;
                    googleEmail = _googleSignIn.currentUser.email;
                    setPrefSocialEmail(googleEmail);
                    setPrefSocialImage(googleImage);
                    print(googleName);
                    print(googleImage);
                  } catch (err) {
                    print(err);
                  }
                  List Gdecode;
                  if (googleName != null &&
                      googleImage != null &&
                      googleEmail != null) {
                    Gdecode = googleName.split(new RegExp('\\s+'));
                    print(Gdecode);
                    setPrefFirstName(Gdecode[0]);
                    setPrefLastName(Gdecode[1]);
                    showRegisterModalBottomSheet(context, size.height * 0.48,
                        true, "byGoogle", LangModel(language: currentLang));
                    // Navigator.pushNamed(context, MainStepper.routeName);
                    printAllWinchUserCurrentData();
                    /* print("Request body: ${winchRegisterRequestModel.toJson()}.");
                  setState(() {
                    isApiCallProcess = true;
                  });
                  ApiService apiService = new ApiService();
                  apiService
                      .registerUser(winchRegisterRequestModel,
                          await getPrefJwtToken(), await getPrefCurrentLang())
                      .then((value) {
                    if (value.error == null) {
                      jwtToken = value.token;
                      Map<String, dynamic> decodedToken =
                          JwtDecoder.decode(jwtToken);
                      responseID = decodedToken["_id"];
                      responseFName = decodedToken["firstName"];
                      responseLName = decodedToken["lastName"];
                      responseIat = decodedToken["iat"];
                      print(jwtToken);
                      print(responseID);
                      print(responseLName);
                      print(responseFName);
                      print(responseIat);
                      setState(() {
                        isApiCallProcess = false;
                      });
                      showRegisterModalBottomSheet(
                          context,
                          size.height * 0.4,
                          true,
                          "byGoogle",
                          otpNavData(
                              jwtToken: jwtToken,
                              Phone: otpResponse.Phone,
                              socialPhoto: googleImage,
                              socialEmail: googleEmail));
                    } else {
                      //response come error msg
                      print(value.error);
                      setState(() {
                        isApiCallProcess = false;
                      });
                      showRegisterModalBottomSheet(
                          context, size.height * 0.4, false, " ", "");
                    }
                  });
                } */
                  } else {
                    //failing in loading data from google
                    setState(() {
                      isApiCallProcess = false;
                    });
                    showRegisterModalBottomSheet(context, size.height * 0.45,
                        false, "byGoogleError", "");
                  }
                }),

            SizedBox(height: size.height * 0.02),
            borderedRoundedButton(
              CornerRadius: 29,
              text: getTranslated(context, "Continue with Apple ID"),
              iconSrc: 'assets/icons/apple.svg',
              press: () {},
            ),
            //SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}

class LangModel {
  String language;

  LangModel({this.language});
}

showRegisterModalBottomSheet(
    context, container_size, bool state, errorCausal, arguments) {
  String processMsg;
  switch (errorCausal) {
    case "byName":
      {
        processMsg =
            getTranslated(context, "You registered by first & last name");
      }
      break;

    case "byGoogle":
      {
        processMsg =
            getTranslated(context, "You registered by your Google account");
      }
      break;

    case "ByFacebook":
      {
        processMsg =
            getTranslated(context, "You registered by your Facebook account");
      }
      break;

    case "byNameError":
      {
        processMsg =
            getTranslated(context, "Failed to sync your Data to the server");
        ;
      }
      break;

    case "byGoogleError":
      {
        processMsg = getTranslated(
            context, "Failed to fetch your Data from google account");
      }
      break;
    case "byFacebookError":
      {
        processMsg = getTranslated(
            context, "Failed to fetch your Data from your facebook account");
      }
      break;
    case "InvalidUserToken":
      {
        processMsg = getTranslated(context, "Invalid User Token");
      }
      break;
    default:
      {
        processMsg = getTranslated(context, "server response error");
      }
      break;
  }
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: container_size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: SvgPicture.asset(
              state
                  ? 'assets/icons/correct.svg'
                  : 'assets/icons/error_cloud.svg',
              height: size.height * 0.12,
              width: size.width * 0.12,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: size.height * 0.015),
          Text(
              state
                  ? getTranslated(context, "Successfully Signed Up")
                  : getTranslated(context, "Getting Your Data Failed"),
              style: Theme.of(context).textTheme.headline3),
          SizedBox(height: size.height * 0.015),
          Text(
            state
                ? getTranslated(
                    context, "You successfully created account in our app")
                : getTranslated(context,
                    "There is something wrong while fetching your data"),
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            processMsg,
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.02),
          RoundedButton(
            text: state
                ? getTranslated(context, "Next")
                : getTranslated(context, "Try again"),
            color: Theme.of(context).primaryColorLight,
            press: () {
              state
                  ? Navigator.pushNamedAndRemoveUntil(
                      context, MainStepper.routeName, (route) => false,
                      arguments: arguments)
                  : Navigator.pop(context);
            },
          )
        ],
      ),
    ),
  );
}
