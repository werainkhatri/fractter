import 'package:flutter/material.dart';
import 'package:fractter/fractals/sierpinski_carpet/animation.dart';
import '../base/painter.dart';
import '../base/config.dart';
import 'painter.dart';
import 'state.dart';

/// Configuration for [SierpinskiCarpetAnimation].
class SierpinskiTriangleConfig extends FractalConfig {
  const SierpinskiTriangleConfig({
    required int iterations,
    required Color backgroundColor,
    required this.triangleColor,
    required Duration interval,
    required SierpinskiTriangleState initialState,
  }) : super(
          iterations,
          backgroundColor,
          interval,
          initialState,
          1.1547,
        );

  /// The color of the carpet.
  final Color triangleColor;

  @override
  FractalPainter getPainter(
          covariant SierpinskiTriangleState state, covariant SierpinskiTriangleConfig config) =>
      SierpinskiTrianglePainter(state, config);
}
