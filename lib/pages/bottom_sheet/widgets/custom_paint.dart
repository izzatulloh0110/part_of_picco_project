import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CSS extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
   Paint paint = Paint()..color = Colors.indigo..style=PaintingStyle.fill;
   Path path = Path();
   path.moveTo(0, 0);
   path.cubicTo(0, 1, w/2, 1, w, 1);
   canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}