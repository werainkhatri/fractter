import 'package:flutter/rendering.dart';
import 'package:fractter/fractals/base/config.dart';
import 'state.dart';

/// Base class for painting fractals.
abstract class FractalPainter extends CustomPainter {
  /// State of the fractal that needs to be painted according to.
  final FractalState state;

  /// Configuration of the fractal that needs to be painted according to.
  final FractalConfig config;

  const FractalPainter(this.state, this.config);

  @override
  void paint(Canvas canvas, Size size) {
    paintState(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  /// Called when the fractal needs to be painted to the [canvas]
  /// accortding to the [state].
  void paintState(Canvas canvas, Size size);
}
