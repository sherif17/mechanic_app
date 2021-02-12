import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mechanic_app/utils/size_config.dart';

class onBoardingContent extends StatelessWidget {
  final String text;
  final String image;
  const onBoardingContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        SvgPicture.asset(
          image,
          height: getProportionateScreenHeight(400),
          width: getProportionateScreenWidth(400),
        ),
        //Spacer(),
        Text(text),
        Spacer(),
      ],
    );
  }
}
