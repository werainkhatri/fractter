/// Base class for defining state of a fractal.
abstract class FractalState {
  /// Current generation of the fractal.
  final int generation;

  const FractalState(this.generation);

  /// Updates the state to the next generation.
  FractalState nextState();
}
