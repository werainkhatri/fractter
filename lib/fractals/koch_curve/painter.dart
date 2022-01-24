import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fractter/utils/functions.dart';
import 'package:fractter/utils/line.dart';
import '../base/painter.dart';
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
    final Queue<Line> lines = Queue();
    painter
      ..strokeWidth = 1.0
      ..color = _config.curveColor;

    lines.clear();
    lines.add(Line(Offset(0, size.height), Offset(size.width, size.height)));

    for (int i = 2; i <= state.generation; i++) {
      int len = lines.length;
      while (len-- > 0) {
        Line line = lines.removeFirst();

        Line l1 = line.copyWith(p2: line.onethird);
        lines.add(l1);

        Line l2 = line.copyWith(p1: line.onethird, p2: line.twothird);
        // here, below is set to true because origin is on the top right.
        Offset p3 = F.getPerpBisectingPoint(l2, l2.length * sqrt(3) / 2, true);
        lines.add(l2.copyWith(p2: p3));
        lines.add(l2.copyWith(p1: p3));

        Line l3 = line.copyWith(p1: line.twothird);
        lines.add(l3);
      }
    }

    for (Line line in lines) {
      canvas.drawLine(line.p1, line.p2, painter);
    }
  }
}
