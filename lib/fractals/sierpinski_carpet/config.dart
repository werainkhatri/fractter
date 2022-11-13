import 'package:flutter/material.dart';

import 'package:fractter/fractals/base/config.dart';

/// Configuration for [SierpinskiCarpetAnimation].
class SierpinskiCarpetConfig extends FractalConfig {
  const SierpinskiCarpetConfig({
    required super.iterations,
    required this.backgroundColor,
    required this.carpetColor,
    required Duration interval,
    required super.initialState,
  }) : super(aspectRatio: 1.0);

  /// The color of the carpet.
  final Color carpetColor;

  /// The color of the background.
  final Color backgroundColor;
}
