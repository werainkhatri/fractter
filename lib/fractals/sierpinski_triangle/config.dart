import 'package:flutter/material.dart';

import 'package:fractter/fractals/base/config.dart';

/// Configuration for [SierpinskiTriangleAnimation].
class SierpinskiTriangleConfig extends FractalConfig {
  const SierpinskiTriangleConfig({
    required super.iterations,
    required this.backgroundColor,
    required this.triangleColor,
    required Duration interval,
    required super.initialState,
  }) : super(aspectRatio: 1.1547);

  /// The color of the triangle.
  final Color triangleColor;

  /// The color of the background.
  final Color backgroundColor;
}
