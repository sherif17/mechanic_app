import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ServiceTimer extends StatefulWidget {
  @override
  _ServiceTimerState createState() => _ServiceTimerState();
}

class _ServiceTimerState extends State<ServiceTimer> {

  String timeString = "00:00:00"; // add from this line
  Stopwatch stopwatch = Stopwatch();
  Timer timer;

  void update(Timer t) {
    if (stopwatch.isRunning) {
      setState(() {
        timeString = (stopwatch.elapsed.inHours % 24).toString().padLeft(2, "0") +
            ":" +
            (stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
            ":" +
            (stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    stopwatch.start();
    timer = Timer.periodic(Duration(seconds: 1), update);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Edited
        body: Column(
      children: <Widget>[
        Expanded(
          child: Container(
            width: 280,
            height: 100,
            decoration:
                BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle, boxShadow: [
              BoxShadow(offset: Offset(1, 1), color: Colors.black38, blurRadius: 15),
              BoxShadow(
                  offset: Offset(-10, -10), color: Colors.white.withOpacity(0.85), blurRadius: 15)
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.timer, size: 40, color: Colors.grey.shade900),
                Text(timeString, style: TextStyle(fontSize: 20, color: Colors.grey.shade900))
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
