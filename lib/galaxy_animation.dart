library galaxy_animation;

import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'paint.dart';

/// GalaxyAnimation: Animates a galaxy-like structure.
class GalaxyAnimation extends StatefulWidget {
  const GalaxyAnimation({
    Key? key,
    this.lineColor = Colors.green,
    this.planetColor = Colors.brown,
  }) : super(key: key);

  /// Color for the orbit lines
  final Color lineColor;

  /// Color for the planets
  final Color planetColor;

  @override
  State<GalaxyAnimation> createState() => _GalaxyAnimationState();
}

class _GalaxyAnimationState extends State<GalaxyAnimation> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // Defining the animation from 0 to 2*pi (full circle).
    _animation = Tween(begin: 0.0, end: 2 * math.pi).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    // Starting the animation in a repeating loop.
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100),
      painter: GalaxyPainter(
        angle: _animation.value,
        lineColor: widget.lineColor,
        planetColor: widget.planetColor,
      ),
    );
  }
}
