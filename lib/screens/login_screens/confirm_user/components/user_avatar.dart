import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserAvatar extends StatelessWidget {
  final String imgSrc;
  final Color color;

  UserAvatar({Key key, @required this.size, this.imgSrc, this.color})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SvgPicture.asset(
        imgSrc,
        height: size.height * 0.15,
        width: size.width * 0.15,
        color: color,
      ),
    );
  }
}
