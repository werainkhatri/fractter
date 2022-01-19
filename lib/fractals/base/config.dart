import 'dart:ui';

import 'painter.dart';
import 'state.dart';

/// Base class for configuring a fractal.
abstract class FractalConfig {
  const FractalConfig(
    this.iterations,
    this.backgroundColor,
    this.interval,
    this.initialState,
  );

  /// Number of iterations the fractal would animate through.
  final int iterations;

  /// Duration between two iterations.
  final Duration interval;

  /// Initial State of the fractal.
  final FractalState initialState;

  /// Suitable color for fractal's background.
  final Color backgroundColor;

  FractalPainter getPainter(FractalState state, FractalConfig config);
}
