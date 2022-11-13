import 'package:flutter/material.dart';

import '../../utils/line.dart';
import '../base/painter.dart';
import '../common_painter.dart';
import 'config.dart';

/// [CustomPainter] that handles painting the koch curve.
class KochCurvePainter extends FractalPainter {
  /// Make sure the [CustomPaint] using this is wrapped with [AspectRatio]
  /// with aspectRatio set to `FractalConfig.aspectRatio`.
  KochCurvePainter(super.state, super.config);

  KochCurveConfig get _config => config as KochCurveConfig;

  final Paint painter = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    painter
      ..strokeWidth = 1.0
      ..color = _config.curveColor;

    CommonPainter.paintKochCurve(
      canvas: canvas,
      painter: painter,
      initialLine: Line(
        Offset(0, size.height),
        Offset(size.width, size.height),
      ),
      generation: state.generation,
    );
  }
}
