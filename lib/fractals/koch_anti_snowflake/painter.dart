import 'package:flutter/material.dart';

import '../../utils/line.dart';
import '../base/painter.dart';
import '../common_painter.dart';
import 'config.dart';

/// [CustomPainter] that handles painting the koch anti snowflake.
class KochAntiSnowflakePainter extends FractalPainter {
  /// Make sure the [CustomPaint] using this is wrapped with [AspectRatio]
  /// with aspectRatio set to `FractalConfig.aspectRatio`.
  KochAntiSnowflakePainter(super.state, super.config);

  KochAntiSnowflakeConfig get _config => config as KochAntiSnowflakeConfig;

  final Paint painter = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    painter
      ..strokeWidth = 1.0
      ..color = _config.curveColor;

    double side = size.width;

    //       /\
    // left /  \ right
    //     /    \
    //    /      \
    //   ---------
    //     bottom
    Line left = Line(Offset(0, size.height), Offset(side / 2, 0)),
        right = Line(left.p2, Offset(side, size.height)),
        bottom = Line(right.p2, left.p1);

    CommonPainter.paintKochCurve(
      canvas: canvas,
      painter: painter,
      initialLine: left.antiLine(),
      generation: state.generation,
    );
    CommonPainter.paintKochCurve(
      canvas: canvas,
      painter: painter,
      initialLine: right.antiLine(),
      generation: state.generation,
    );
    CommonPainter.paintKochCurve(
      canvas: canvas,
      painter: painter,
      initialLine: bottom.antiLine(),
      generation: state.generation,
    );
  }
}
