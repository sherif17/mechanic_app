import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountryCode extends StatelessWidget {
  final double radius;
  final double width;
  final Color borderColor;
  const CountryCode({
    Key key,
    this.width,
    this.borderColor,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: "+20",
          hintStyle: Theme.of(context).textTheme.subtitle1,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius)),
            borderSide: BorderSide(color: borderColor, width: width),
          )),
    );
  }
}
