import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.0,
      color: Colors.grey
          .withOpacity(0.5), // Theme.of(context).hintColor.withOpacity(0.5),
      thickness: 2,
    );
  }
}
