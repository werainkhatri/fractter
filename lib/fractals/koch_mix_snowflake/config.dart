import 'package:flutter/material.dart';

import 'package:fractter/fractals/base/config.dart';

/// Configuration for [KochMixSnowflakeAnimation].
class KochMixSnowflakeConfig extends FractalConfig {
  const KochMixSnowflakeConfig({
    required super.iterations,
    required this.curveColor,
    required Duration interval,
    required super.initialState,
  }) : super(aspectRatio: 0.866);

  /// The color of the curve.
  final Color curveColor;
}
