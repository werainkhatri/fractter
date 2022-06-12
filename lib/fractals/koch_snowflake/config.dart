import 'package:flutter/material.dart';

import '../base/config.dart';
import '../base/painter.dart';
import 'animation.dart';
import 'painter.dart';
import 'state.dart';

/// Configuration for [KochSnowflakeAnimation].
class KochSnowflakeConfig extends FractalConfig {
  const KochSnowflakeConfig({
    required int iterations,
    required this.curveColor,
    required Duration interval,
    required KochSnowflakeState initialState,
  }) : super(
          iterations,
          interval,
          initialState,
          0.866,
        );

  /// The color of the curve.
  final Color curveColor;

  @override
  FractalPainter getPainter(covariant KochSnowflakeState state) =>
      KochSnowflakePainter(state, this);
}
