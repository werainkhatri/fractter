import 'package:flutter/material.dart';

import 'package:fractter/fractals/base/config.dart';

/// Configuration for [KochAntiSnowflakeAnimation].
class KochAntiSnowflakeConfig extends FractalConfig {
  const KochAntiSnowflakeConfig({
    required super.iterations,
    required this.curveColor,
    required Duration interval,
    required super.initialState,
  }) : super(aspectRatio: 1.1547);

  /// The color of the curve.
  final Color curveColor;
}
