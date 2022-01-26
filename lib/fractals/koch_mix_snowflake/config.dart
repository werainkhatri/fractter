import 'package:flutter/material.dart';

import '../base/config.dart';
import '../base/painter.dart';
import 'animation.dart';
import 'painter.dart';
import 'state.dart';

/// Configuration for [KochMixSnowflakeAnimation].
class KochMixSnowflakeConfig extends FractalConfig {
  const KochMixSnowflakeConfig({
    required int iterations,
    required this.curveColor,
    required Duration interval,
    required KochMixSnowflakeState initialState,
  }) : super(
          iterations,
          interval,
          initialState,
          0.866,
        );

  /// The color of the curve.
  final Color curveColor;

  @override
  FractalPainter getPainter(
          covariant KochMixSnowflakeState state, covariant KochMixSnowflakeConfig config) =>
      KochMixSnowflakePainter(state, config);
}
