import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.size,
    @required this.errors,
  }) : super(key: key);

  final Size size;
  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: size.height * 0.017,
        ),
        SizedBox(width: size.width * 0.01),
        Text(
          error,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
