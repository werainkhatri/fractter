import 'package:flutter/material.dart';

import '../base/config.dart';
import '../base/painter.dart';
import 'animation.dart';
import 'painter.dart';
import 'state.dart';

/// Configuration for [KochCurveAnimation].
class KochCurveConfig extends FractalConfig {
  const KochCurveConfig({
    required int iterations,
    required this.curveColor,
    required Duration interval,
    required KochCurveState initialState,
  }) : super(
          iterations,
          interval,
          initialState,
          3.4641,
        );

  /// The color of the curve.
  final Color curveColor;

  @override
  FractalPainter getPainter(covariant KochCurveState state) =>
      KochCurvePainter(state, this);
}
