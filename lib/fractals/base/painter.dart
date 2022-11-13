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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
