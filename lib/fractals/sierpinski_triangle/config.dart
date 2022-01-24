import 'package:flutter/material.dart';

import '../base/config.dart';
import '../base/painter.dart';
import 'animation.dart';
import 'painter.dart';
import 'state.dart';

/// Configuration for [SierpinskiTriangleAnimation].
class SierpinskiTriangleConfig extends FractalConfig {
  const SierpinskiTriangleConfig({
    required int iterations,
    required this.backgroundColor,
    required this.triangleColor,
    required Duration interval,
    required SierpinskiTriangleState initialState,
  }) : super(
          iterations,
          interval,
          initialState,
          1.1547,
        );

  /// The color of the triangle.
  final Color triangleColor;

  /// The color of the background.
  final Color backgroundColor;

  @override
  FractalPainter getPainter(
          covariant SierpinskiTriangleState state, covariant SierpinskiTriangleConfig config) =>
      SierpinskiTrianglePainter(state, config);
}
