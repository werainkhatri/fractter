import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/line.dart';
import '../base/painter.dart';
import '../common_painter.dart';
import 'config.dart';
import 'state.dart';

/// [CustomPainter] that handles painting the koch mix snowflake.
class KochMixSnowflakePainter extends FractalPainter {
  /// Make sure the [CustomPaint] using this is wrapped with [AspectRatio]
  /// with aspectRatio set to `FractalConfig.aspectRatio`.
  KochMixSnowflakePainter(
    KochMixSnowflakeState state,
    KochMixSnowflakeConfig config,
  )   : _config = config,
        super(state, config);

  final KochMixSnowflakeConfig _config;

  final Paint painter = Paint();

  @override
  void paintState(Canvas canvas, Size size) {
    painter
      ..strokeWidth = 1.0
      ..color = _config.curveColor;

    double side = size.width, smallHeight = side / (2 * sqrt(3));

    //       /\
    // left /  \ right
    //     /    \
    //    /      \
    //   ---------
    //     bottom
    Line left = Line(Offset(0, size.height - smallHeight), Offset(side / 2, 0)),
        right = Line(left.p2, Offset(side, size.height - smallHeight)),
        bottom = Line(right.p2, left.p1);

    CommonPainter.paintKochCurve(
      canvas: canvas,
      painter: painter,
      initialLine: left,
      generation: state.generation,
    );
    CommonPainter.paintKochCurve(
      canvas: canvas,
      painter: painter,
      initialLine: left.antiLine(),
      generation: state.generation,
    );
    CommonPainter.paintKochCurve(
      canvas: canvas,
      painter: painter,
      initialLine: right,
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
      initialLine: bottom,
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
