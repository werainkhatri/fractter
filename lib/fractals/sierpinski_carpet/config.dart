import 'package:flutter/material.dart';
import 'package:fractter/fractals/sierpinski_carpet/animation.dart';
import '../base/painter.dart';
import '../base/config.dart';
import 'painter.dart';
import 'state.dart';

/// Configuration for [SierpinskiCarpetAnimation].
class SierpinskiCarpetConfig extends FractalConfig {
  const SierpinskiCarpetConfig({
    required int iterations,
    required Color backgroundColor,
    required this.carpetColor,
    required Duration interval,
    required SierpinskiCarpetState initialState,
  }) : super(
          iterations,
          backgroundColor,
          interval,
          initialState,
          1.0,
        );

  /// The color of the carpet.
  final Color carpetColor;

  @override
  FractalPainter getPainter(
          covariant SierpinskiCarpetState state, covariant SierpinskiCarpetConfig config) =>
      SierpinskiCarpetPainter(state, config);
}
