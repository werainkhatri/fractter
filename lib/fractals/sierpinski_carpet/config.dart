import 'dart:ui';

import 'package:flutter/material.dart';
import '../base/painter.dart';
import '../base/config.dart';
import 'painter.dart';
import 'state.dart';

class SierpinskiCarpetConfig extends FractalConfig {
  const SierpinskiCarpetConfig({
    int iterations = 5,
    Color backgroundColor = Colors.black,
    this.carpetColor = Colors.blue,
    Duration interval = const Duration(seconds: 1),
    SierpinskiCarpetState initialState = const SierpinskiCarpetState(),
  }) : super(
          iterations,
          backgroundColor,
          interval,
          initialState,
        );

  final Color carpetColor;

  @override
  FractalPainter getPainter(
          covariant SierpinskiCarpetState state, covariant SierpinskiCarpetConfig config) =>
      SierpinskiCarpetPainter(state, config: config);
}
