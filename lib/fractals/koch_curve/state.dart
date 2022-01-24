import '../base/state.dart';

class KochCurveState extends FractalState {
  const KochCurveState([int generation = 1]) : super(generation);

  @override
  KochCurveState nextState() => KochCurveState(generation + 1);
}
