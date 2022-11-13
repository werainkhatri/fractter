import 'package:flutter/material.dart';

import 'package:fractter/fractals/base/config.dart';

/// Configuration for [KochCurveAnimation].
class KochCurveConfig extends FractalConfig {
  const KochCurveConfig({
    required super.iterations,
    required this.curveColor,
    required Duration interval,
    required super.initialState,
  }) : super(aspectRatio: 3.4641);

  /// The color of the curve.
  final Color curveColor;
}
