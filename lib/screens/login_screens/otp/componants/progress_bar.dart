import 'package:flutter/material.dart';

class ProgressHUD extends StatelessWidget {
  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Animation<Color> valueColor;

  ProgressHUD({
    Key key,
    @required this.child,
    @required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = new List<Widget>();
    Size size = MediaQuery.of(context).size;
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = new Stack(
        children: [
          /* new Opacity(
            opacity: opacity,
            child: SizedBox(
                height: size.height * 0.5,
                width: size.width * 0.5,
                child: ModalBarrier(dismissible: false, color: color)),
          ),*/
          new Center(
              child: Container(
            height: size.height * 0.1,
            // margin: EdgeInsets.symmetric(horizontal: 5.0),
            width: MediaQuery.of(context).size.width * 0.6,

            decoration: new BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColorDark,
                width: 2,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColorLight),
                ),
                SizedBox(width: size.width * 0.05),
                Text(
                  "Processing ",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          )),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
