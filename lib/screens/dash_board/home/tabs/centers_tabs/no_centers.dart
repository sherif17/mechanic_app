import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoCentersTab extends StatelessWidget {
  const NoCentersTab({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            width: size.width * 0.9,
            child: SvgPicture.asset(
              "assets/illustrations/undraw_features_overview_jg7a.svg",
              height: size.height * 0.45,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Text(
                'Not available right now !!',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          Text(
            'Will be implemented in future plans ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          // Text(
          //   'To start receiving requests',
          //   style: Theme.of(context).textTheme.bodyText1,
          // ),
        ],
      ),
    );
  }
}
