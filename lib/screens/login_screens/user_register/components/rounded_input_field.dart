import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mechanic_app/widgets/text_field_container.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  // final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    //  this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Theme.of(context).accentColor,
        decoration: InputDecoration(
          /*icon: Icon(
            icon,
            color: kPrimaryColor,
          ),*/
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.headline5,
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
