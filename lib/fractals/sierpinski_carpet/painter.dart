import 'dart:math';

import 'package:flutter/material.dart';
import '../base/painter.dart';
import 'config.dart';
import 'state.dart';

/// [CustomPainter] that handles painting the sierpinski carpet.
class SierpinskiCarpetPainter extends FractalPainter {
  /// Make sure the [CustomPaint] using this is wrapped with [AspectRatio]
  /// with aspectRatio set to `FractalConfig.aspectRatio`.
  SierpinskiCarpetPainter(
    SierpinskiCarpetState state,
    SierpinskiCarpetConfig config,
  ) : super(state, config);

  double carpetWidth = 0;
  double carpetHeight = 0;
  final Paint painter = Paint();

  @override
  void paintState(Canvas canvas, Size size) {
    carpetWidth = size.width;
    carpetHeight = size.height;
    painter.style = PaintingStyle.fill;

    /// draws the first generation carpet.
    painter.color = (config as SierpinskiCarpetConfig).carpetColor;
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), painter);

    painter.color = config.backgroundColor;

    for (int i = 1; i <= state.generation; i++) {
      _drawCarpet(canvas, i);
    }
  }

  void _drawCarpet(Canvas canvas, int step) {
    double rows = pow(3.0, step - 1).toDouble();
    double partW = carpetWidth / rows;
    double partH = carpetHeight / rows;

    for (double i = 0; i < rows; i++) {
      for (double j = 0; j < rows; j++) {
        if (_skip(i, j, step)) continue;
        double x = (partW * i);
        double y = (partH * j);
        _drawSquare(canvas, Offset(x, y), Offset(x + partW, y + partH));
      }
    }
  }

  void _drawSquare(Canvas canvas, Offset topLeft, Offset bottomRight) {
    Rect rect = Rect.fromPoints(topLeft, bottomRight);
    rect = rect.deflate(rect.width / 3);
    canvas.drawRect(rect, painter);
  }

  bool _skip(double i, double j, int steps) {
    for (int p = 1; p <= steps; p++) {
      double p3 = pow(3.0, p - 1).toDouble();
      if ((i ~/ p3) % 3 == 1 && (j ~/ p3) % 3 == 1) {
        return true;
      }
    }
    return false;
  }
}
