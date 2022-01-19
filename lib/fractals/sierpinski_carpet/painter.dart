import 'dart:math';

import 'package:flutter/material.dart';
import '../base/painter.dart';
import 'config.dart';
import 'state.dart';

class SierpinskiCarpetPainter extends FractalPainter {
  SierpinskiCarpetPainter(
    SierpinskiCarpetState state, {
    SierpinskiCarpetConfig config = const SierpinskiCarpetConfig(),
  })  : _config = config,
        super(state);

  final SierpinskiCarpetConfig _config;

  double carpetWidth = 0;
  double carpetHeight = 0;
  double offsetX = 0, offsetY = 0;

  @override
  void paintState(Canvas canvas, Size size) {
    double squareSize = min(size.width, size.height);
    if (size.width == size.height) {
      offsetX = 0;
      offsetY = 0;
    } else if (size.width > size.height) {
      offsetX = (size.width - size.height) / 2;
    } else {
      offsetY = (size.height - size.width) / 2;
    }

    carpetWidth = squareSize;
    carpetHeight = squareSize;

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
        double x = offsetX + (partW * i);
        double y = offsetY + (partH * j);
        _drawSquare(canvas, Offset(x, y), Offset(x + partW, y + partH));
      }
    }
  }

  void _drawSquare(Canvas canvas, Offset topLeft, Offset bottomRight) {
    Rect rect = Rect.fromPoints(topLeft, bottomRight);
    rect = rect.deflate(rect.width / 3);
    Paint paint = Paint()
      ..color = _config.carpetColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);
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
