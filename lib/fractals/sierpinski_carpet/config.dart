import 'package:flutter/material.dart';

import '../base/config.dart';
import '../base/painter.dart';
import 'animation.dart';
import 'painter.dart';
import 'state.dart';

/// Configuration for [SierpinskiCarpetAnimation].
class SierpinskiCarpetConfig extends FractalConfig {
  const SierpinskiCarpetConfig({
    required int iterations,
    required this.backgroundColor,
    required this.carpetColor,
    required Duration interval,
    required SierpinskiCarpetState initialState,
  }) : super(
          iterations,
          interval,
          initialState,
          1.0,
        );

  /// The color of the carpet.
  final Color carpetColor;

  /// The color of the background.
  final Color backgroundColor;

  @override
  FractalPainter getPainter(covariant SierpinskiCarpetState state) =>
      SierpinskiCarpetPainter(state, this);
}
