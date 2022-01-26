import '../base/state.dart';

class KochAntiSnowflakeState extends FractalState {
  const KochAntiSnowflakeState([int generation = 1]) : super(generation);

  @override
  KochAntiSnowflakeState nextState() => KochAntiSnowflakeState(generation + 1);
}
