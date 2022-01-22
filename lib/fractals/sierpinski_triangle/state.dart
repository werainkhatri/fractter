import '../base/state.dart';

class SierpinskiTriangleState extends FractalState {
  const SierpinskiTriangleState([int generation = 1]) : super(generation);

  @override
  SierpinskiTriangleState nextState() => SierpinskiTriangleState(generation + 1);
}
