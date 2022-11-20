import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fractter/fractals/base/painter.dart';

import 'config.dart';

/// [CustomPainter] that handles painting the sierpinski carpet.
class SierpinskiCarpetPainter extends FractalPainter {
  /// Make sure the [CustomPaint] using this is wrapped with [AspectRatio]
  /// with aspectRatio set to `FractalConfig.aspectRatio`.
  SierpinskiCarpetPainter(super.state, super.config);

  SierpinskiCarpetConfig get _config => config as SierpinskiCarpetConfig;

  List<Rect Function(Rect)> rectGetters = [
    _getTopLeftRect,
    _getTopMiddleRect,
    _getTopRightRect,
    _getMiddleLeftRect,
    _getMiddleRightRect,
    _getBottomLeftRect,
    _getBottomMiddleRect,
    _getBottomRightRect,
  ];
  final Paint painter = Paint()..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final Queue<Rect> currentRects = Queue()
      ..add(Rect.fromPoints(Offset.zero, Offset(size.width, size.height)));

    /// draws the first generation carpet.
    painter.color = _config.carpetColor;
    canvas.drawRect(currentRects.first, painter);

    painter.color = _config.backgroundColor;

    for (int i = 2; i <= state.generation; i++) {
      int rectCount = currentRects.length;
      while (rectCount-- > 0) {
        final Rect currentRect = currentRects.first;
        currentRects.removeFirst();

        // since width and height are the same, we can use either.
        final Rect rectToRemove = currentRect.deflate(currentRect.width / 3);
        canvas.drawRect(rectToRemove, painter);

        if (i == state.generation) continue;

        for (var rectGetter in rectGetters) {
          currentRects.add(rectGetter(currentRect));
        }
      }
    }
  }

  static Rect _getTopLeftRect(Rect rect) {
    return Rect.fromLTRB(
      rect.left,
      rect.top,
      rect.left + rect.width / 3,
      rect.top + rect.height / 3,
    );
  }

  static Rect _getTopMiddleRect(Rect rect) {
    return Rect.fromLTRB(
      rect.left + rect.width / 3,
      rect.top,
      rect.left + (rect.width / 3) * 2,
      rect.top + rect.height / 3,
    );
  }

  static Rect _getTopRightRect(Rect rect) {
    return Rect.fromLTRB(
      rect.left + (rect.width / 3) * 2,
      rect.top,
      rect.right,
      rect.top + rect.height / 3,
    );
  }

  static Rect _getMiddleLeftRect(Rect rect) {
    return Rect.fromLTRB(
      rect.left,
      rect.top + rect.height / 3,
      rect.left + rect.width / 3,
      rect.top + (rect.height / 3) * 2,
    );
  }

  static Rect _getMiddleRightRect(Rect rect) {
    return Rect.fromLTRB(
      rect.left + (rect.width / 3) * 2,
      rect.top + rect.height / 3,
      rect.right,
      rect.top + (rect.height / 3) * 2,
    );
  }

  static Rect _getBottomLeftRect(Rect rect) {
    return Rect.fromLTRB(
      rect.left,
      rect.top + (rect.height / 3) * 2,
      rect.left + rect.width / 3,
      rect.bottom,
    );
  }

  static Rect _getBottomMiddleRect(Rect rect) {
    return Rect.fromLTRB(
      rect.left + rect.width / 3,
      rect.top + (rect.height / 3) * 2,
      rect.left + (rect.width / 3) * 2,
      rect.bottom,
    );
  }

  static Rect _getBottomRightRect(Rect rect) {
    return Rect.fromLTRB(
      rect.left + (rect.width / 3) * 2,
      rect.top + (rect.height / 3) * 2,
      rect.right,
      rect.bottom,
    );
  }
}
