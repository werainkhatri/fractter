import 'dart:collection';

import 'package:flutter/material.dart';

import '../base/painter.dart';
import 'config.dart';
import 'state.dart';

/// [CustomPainter] that handles painting the sierpinski triangle.
///
/// Make sure the [CustomPaint] using this is wrapped with [AspectRatio]
/// with aspectRatio set to 1.0.
class SierpinskiTrianglePainter extends FractalPainter {
  SierpinskiTrianglePainter(
    SierpinskiTriangleState state,
    SierpinskiTriangleConfig config,
  )   : _config = config,
        super(state, config);

  final SierpinskiTriangleConfig _config;

  late double side, height;
  Queue<Offset> points = Queue<Offset>();
  final Paint painter = Paint();

  @override
  void paintState(Canvas canvas, Size size) {
    side = size.width;
    height = size.height;
    painter.style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    /// draws the first generation.
    painter.color = _config.triangleColor;
    canvas.drawPath(path, painter);

    painter.color = _config.backgroundColor;

    points.clear();
    if (state.generation >= 2) {
      // draws the second generation.
      points.add(Offset(side / 2, height));
      height /= 2;
      side /= 2;
      _drawTriangle(canvas, points.last);
    }

    for (int i = 3; i <= state.generation; i++) {
      _drawCarpet(canvas, i);
    }
  }

  void _drawCarpet(Canvas canvas, int step) {
    height /= 2;
    side /= 2;

    int len = points.length;
    while (len-- > 0) {
      Offset top = points.removeFirst();

      // left
      points.add(top.translate(-side, 0));
      _drawTriangle(canvas, points.last);

      // right
      points.add(top.translate(side, 0));
      _drawTriangle(canvas, points.last);

      // above
      points.add(top.translate(0, -height * 2));
      _drawTriangle(canvas, points.last);
    }
  }

  // Draws an inverted triangle.
  void _drawTriangle(Canvas canvas, Offset bottom) {
    Path path = Path()
      ..moveTo(bottom.dx, bottom.dy)
      ..lineTo(bottom.dx - side / 2, bottom.dy - height)
      ..lineTo(bottom.dx + side / 2, bottom.dy - height)
      ..close();
    canvas.drawPath(path, painter);
  }
}
