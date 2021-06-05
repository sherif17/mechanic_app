import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class timer extends StatefulWidget {
  @override
  _timerState createState() => _timerState();
}

class _timerState extends State<timer> {
  @override
  bool flag = true;
  Stream<int> timerStream;
  StreamSubscription<int> timerSubscription;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';

  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timerInterval = Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
      }
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
      if (!flag) {
        stopTimer();
      }
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

  Widget build(BuildContext context) {
    String timeString = "00:00:00"; // add from this line
    Stopwatch stopwatch = Stopwatch();
    Timer timer;
    void update(Timer t) {
      if (stopwatch.isRunning) {
        setState(() {
          timeString = (stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
              ":" +
              (stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, "0") +
              ":" +
              (stopwatch.elapsed.inMilliseconds % 1000 / 10)
                  .clamp(0, 99)
                  .toStringAsFixed(0)
                  .padLeft(2, "0");
        });
      }
    }

    void start() {
      stopwatch.start();
      timer = Timer.periodic(Duration(milliseconds: 1), update);
    }

    void stop() {
      setState(() {
        timer.cancel();
        stopwatch.stop();
      });
    }

    void reset() {
      timer.cancel();
      stopwatch.reset();
      setState(() {
        timeString = "00:00:00";
      });
      stopwatch.stop();
    } // to this line

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
              BoxShadow(offset: Offset(10, 10), color: Colors.black38, blurRadius: 15),
              BoxShadow(
                  offset: Offset(-10, -10), color: Colors.white.withOpacity(0.85), blurRadius: 15)
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.timer, size: 40, color: Colors.grey.shade900),
                Text("00:00:00", style: TextStyle(fontSize: 20, color: Colors.grey.shade900))
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
