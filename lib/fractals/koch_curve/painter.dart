import 'package:flutter/material.dart';

import '../../utils/line.dart';
import '../base/painter.dart';
import '../common_painter.dart';
import 'config.dart';
import 'state.dart';

/// [CustomPainter] that handles painting the koch curve.
class KochCurvePainter extends FractalPainter {
  /// Make sure the [CustomPaint] using this is wrapped with [AspectRatio]
  /// with aspectRatio set to `FractalConfig.aspectRatio`.
  KochCurvePainter(
    KochCurveState state,
    KochCurveConfig config,
  )   : _config = config,
        super(state, config);

  final KochCurveConfig _config;

  final Paint painter = Paint();

  @override
  void paintState(Canvas canvas, Size size) {
    painter
      ..strokeWidth = 1.0
      ..color = _config.curveColor;

    CommonPainter.paintKochCurve(
      canvas: canvas,
      painter: painter,
      initialLine: Line(Offset(0, size.height), Offset(size.width, size.height)),
      generation: state.generation,
    );
  }
}
