import 'dart:ui';

import 'painter.dart';
import 'state.dart';

/// Defines how the fractal should be displayed and animated.
///
/// See also:
/// * [SierpinskiCarpetConfig], which is an extension.
/// * [FractalAnimation], which uses this.
abstract class FractalConfig {
  const FractalConfig(
    this.iterations,
    this.backgroundColor,
    this.interval,
    this.initialState,
    this.aspectRatio,
  );

  /// Number of iterations the fractal would animate through.
  final int iterations;

  /// Duration between two iterations.
  final Duration interval;

  /// Initial State of the fractal.
  final FractalState initialState;

  /// Suitable color for fractal's background.
  final Color backgroundColor;

  /// Aspect ratio required to display the fractal.
  final double aspectRatio;

  /// Returns the painter for the fractal given the [state] and [config].
  FractalPainter getPainter(FractalState state, FractalConfig config);
}
