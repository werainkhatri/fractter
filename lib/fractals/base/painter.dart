import 'package:flutter/rendering.dart';
import 'state.dart';

/// Base class for painting fractals.
abstract class FractalPainter extends CustomPainter {
  /// State of the fractal that needs to be painted according to.
  final FractalState state;

  const FractalPainter(this.state);

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
