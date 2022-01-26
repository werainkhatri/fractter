import '../base/state.dart';

class KochSnowflakeState extends FractalState {
  const KochSnowflakeState([int generation = 1]) : super(generation);

  @override
  KochSnowflakeState nextState() => KochSnowflakeState(generation + 1);
}
