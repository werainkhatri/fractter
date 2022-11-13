import 'package:fractter/utils/constants.dart';

import 'state.dart';

/// Defines how the fractal should be displayed and animated.
///
/// See also:
/// * [SierpinskiCarpetConfig], which is an extension.
/// * [FractalAnimation], which uses this.
abstract class FractalConfig {
  const FractalConfig({
    required this.iterations,
    this.interval = C.defaultInterval,
    required this.initialState,
    required this.aspectRatio,
  });

  /// Number of iterations the fractal would animate through.
  final int iterations;

  /// Duration between two iterations.
  final Duration interval;

  /// Initial State of the fractal.
  final FractalState initialState;

  /// Aspect ratio required to display the fractal.
  final double aspectRatio;
}
