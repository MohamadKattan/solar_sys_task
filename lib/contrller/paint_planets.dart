// this class for  paint soler system
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solar_system_task/models/planeta.dart';

class SolerSystem extends CustomPainter {
  List<Planeta> listOfPlanet;
  SolerSystem(this.listOfPlanet);
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    _paintSun(canvas, size);
    _addPlaneta(canvas: canvas, size: size, list: listOfPlanet);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  // this function for paint sun by defult
  void _paintSun(Canvas canvas, Size size) {
    final sunColor = Paint()
      ..color = Colors.amberAccent.shade700
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40.0, sunColor);
  }

  // this function for add new Planeta
  void _addPlaneta({
    required Canvas canvas,
    required Size size,
    required List<Planeta> list,
  }) {
    double orbitRadius = 60;
    for (var i = 0; i < list.length; i++) {
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2),
          orbitRadius,
          Paint()
            ..color = list[i].planetsColor
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2.0);

      canvas.drawCircle(
          Offset(size.width / 2 + orbitRadius * cos(list[i].planetsangle),
              size.height / 2 + orbitRadius * sin(list[i].planetsangle)),
          list[i].planetsRadius,
          Paint()
            ..color = list[i].planetsColor
            ..style = PaintingStyle.fill);
      orbitRadius += 25;
    }
  }
}
