import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Draws a circle if placed into a square widget.
class CirclePainter extends CustomPainter {
  Size size;
  CirclePainter();
  final _paint = Paint()
    ..color = Colors.white
    ..strokeWidth = 3
    // Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
