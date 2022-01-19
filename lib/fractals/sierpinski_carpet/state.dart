import '../base/state.dart';

class SierpinskiCarpetState extends FractalState {
  const SierpinskiCarpetState([int generation = 1]) : super(generation);

  @override
  SierpinskiCarpetState nextState() => SierpinskiCarpetState(generation + 1);
}
