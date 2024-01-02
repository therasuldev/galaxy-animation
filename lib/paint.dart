import 'package:flutter/material.dart';
import 'dart:math' as math;

/// GalaxyPainter: A custom painter class to draw a galaxy-like structure with orbits and planets.
class GalaxyPainter extends CustomPainter {
  /// The angle to position the planets on their orbits.
  final double angle;

  /// The color of the orbits.
  final Color lineColor;

  /// The color of the planets.
  final Color planetColor;

  GalaxyPainter({
    required this.angle,
    required this.lineColor,
    required this.planetColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    var radius = math.min(size.width / 2, size.height / 2);

    // Draw multiple orbits and planets.
    for (var r = 0.0; r < 45; r += 15) {
      _drawOrbit(canvas, center, radius - r);
      _drawPlanet(canvas, center, radius, r);
    }

    // Draw the sun at the center.
    _drawSun(canvas, center);
  }

  void _drawOrbit(Canvas canvas, Offset center, double orbitRadius) {
    var orbitPaint = Paint()
      ..strokeWidth = 2
      ..color = lineColor
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, orbitRadius, orbitPaint);
  }

  // Method to draw a planet on an orbit.
  void _drawPlanet(Canvas canvas, Offset center, double radius, double r) {
    var smallCircleRadius = 7.0;
    var smallCirclePaint = Paint()
      ..color = planetColor
      ..style = PaintingStyle.fill;

    var smallCircleCenter = Offset(
      center.dx + (radius - r) * math.cos(angle - r / 2),
      center.dy + (radius - r) * math.sin(angle - r / 2),
    );

    // Drawing the orbit as a circle.
    canvas.drawCircle(smallCircleCenter, smallCircleRadius, smallCirclePaint);
  }

  void _drawSun(Canvas canvas, Offset center) {
    var sunRadius = 7.0;
    var sunPaint = Paint()
      ..strokeWidth = 3
      ..color = Colors.yellow.shade700
      ..style = PaintingStyle.fill;
    // Drawing the sun.
    canvas.drawCircle(center, sunRadius, sunPaint);
    // Drawing sun rays.
    var sunRayLength = 7.0;
    for (var i = 0; i < 8; i++) {
      var rayAngle = math.pi / 4 * i;
      var rayStartX = center.dx + sunRadius * math.cos(rayAngle);
      var rayStartY = center.dy + sunRadius * math.sin(rayAngle);
      var rayEndX = center.dx + (sunRadius + sunRayLength) * math.cos(rayAngle);
      var rayEndY = center.dy + (sunRadius + sunRayLength) * math.sin(rayAngle);
      canvas.drawLine(
        Offset(rayStartX, rayStartY),
        Offset(rayEndX, rayEndY),
        sunPaint..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
