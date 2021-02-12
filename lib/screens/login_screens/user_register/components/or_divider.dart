import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildExpanded(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text("OR"),
          ),
          buildExpanded(context),
        ],
      ),
    );
  }

  Expanded buildExpanded(BuildContext context) {
    return Expanded(
      child: Divider(
        color: Theme.of(context).primaryColor,
        height: 1.5,
        thickness: 2.5,
      ),
    );
  }
}
