import 'package:flutter/material.dart';

import '../base/config.dart';
import '../base/painter.dart';
import 'animation.dart';
import 'painter.dart';
import 'state.dart';

/// Configuration for [KochAntiSnowflakeAnimation].
class KochAntiSnowflakeConfig extends FractalConfig {
  const KochAntiSnowflakeConfig({
    required int iterations,
    required this.curveColor,
    required Duration interval,
    required KochAntiSnowflakeState initialState,
  }) : super(
          iterations,
          interval,
          initialState,
          1.1547,
        );

  /// The color of the curve.
  final Color curveColor;

  @override
  FractalPainter getPainter(
          covariant KochAntiSnowflakeState state, covariant KochAntiSnowflakeConfig config) =>
      KochAntiSnowflakePainter(state, config);
}
