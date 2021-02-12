import 'package:flutter/material.dart';
import 'package:mechanic_app/screens/login_screens/otp/otp_form.dart';
import 'package:mechanic_app/screens/login_screens/phone_number/componants/phone_number.dart';



class Otp_Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    phoneNum response = ModalRoute.of(context).settings.arguments;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Verify This Mobile  Number",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "We sent your code via SMS to",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                Text(
                  " +20-${response.phoneNumber}.",
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                Text(
                  "Please enter this code here",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.left,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/PhoneNumber');
                  },
                  child: Text(
                    "  Edit number",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.03),
          OtpForm(
              phoneRequestModel: response.phoneRequestModel,
              phone_num: response.phoneNumber,
              scafoldKey: response.scafoldKey),
          buildTimer(context),
          SizedBox(height: size.height * 0.06),
        ],
      ),
    );
  }

  Row buildTimer(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Resend Code "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 60),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
