import 'dart:math';

import 'package:flutter/material.dart';

class NixieTube extends StatefulWidget {
  @override
  State createState() => _NixieTubeState();
}

class _NixieTubeState extends State<NixieTube> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomPainter(),
    );
  }
}

class _CustomPainter extends CustomPainter {
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double length = size.width;
    double width = 20;

    Matrix4 transform = Matrix4.identity();

    Path pathA = genPath(length, width);
    canvas.drawPath(pathA, getPaint());

    Path pathB = genPath(length, width);
    transform.translate(length);
    transform.translate(
      15.0,
      15.0,
    );
    transform.rotateZ(90 / 180 * pi);
    pathB = pathB.transform(transform.storage);
    canvas.drawPath(pathB, getPaint());

    Path pathC = genPath(length, width);
    transform.translate(length);
    pathC = pathC.transform(transform.storage);
    canvas.drawPath(pathC, getPaint());

    Path pathD = genPath(length, width);
    transform.translate(length, length);
//    transform.translate(
//      10.0,
//      10.0,
//    );
    transform.rotateZ(-90 / 180 * pi);
    pathD = pathD.transform(transform.storage);
    canvas.drawPath(pathD, getPaint());
  }

  Paint getPaint() {
    final highlightPaint = Paint();
    highlightPaint
      ..style = PaintingStyle.fill
      ..color = Colors.red;
    return highlightPaint;
  }

  Path genPath(double length, double width) {
    final path = Path();
    double lerp = width / 2;
    path.addPolygon([
      Offset(0, lerp),
      Offset(lerp, 0),
      Offset(length - lerp, 0),
      Offset(length, lerp),
      Offset(length - lerp, width),
      Offset(lerp, width),
    ], true);
    return path;
  }
}
