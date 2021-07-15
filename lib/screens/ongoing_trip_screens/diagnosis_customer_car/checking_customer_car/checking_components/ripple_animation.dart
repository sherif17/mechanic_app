import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/checking_customer_car/checking_components/circle_painter.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/diagnosis_customer_car/checking_customer_car/checking_components/curve_wave.dart';
import 'package:mechanic_app/screens/ongoing_trip_screens/my_timer.dart';

class RipplesAnimation extends StatefulWidget {
  static String routeName = '/RipplesAnimation';
  RipplesAnimation({
    Key key,
    this.size = 110.0,
    this.color = const Color(0xFF4F5266), //Theme.of(context).primaryColorDark,
    this.onPressed,
    this.state,
    @required this.child,
  }) : super(key: key);
  final double size;
  Color color;
  final Widget child;
  final VoidCallback onPressed;
  bool state = false;
  @override
  _RipplesAnimationState createState() => _RipplesAnimationState();
}

class _RipplesAnimationState extends State<RipplesAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: <Color>[
                  widget.color,
                  Color.lerp(widget.color, Colors.black, .05)
                ],
              ),
            ),
            child: ScaleTransition(
                scale: Tween(begin: 0.95, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: const CurveWave(),
                  ),
                ),
                child: widget.state == false
                    ? SvgPicture.asset(
                        "assets/illustrations/car_top_view.svg",
                        height: 100,
                      )
                    : ServiceTimer())),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(
        _controller,
        color: widget.color,
      ),
      child: SizedBox(
        width: widget.size * 4.125,
        height: widget.size * 4.125,
        child: _button(),
      ),
    );
  }
}
