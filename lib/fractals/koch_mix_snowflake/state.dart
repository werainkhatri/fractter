import '../base/state.dart';

class KochMixSnowflakeState extends FractalState {
  const KochMixSnowflakeState([int generation = 1]) : super(generation);

  @override
  KochMixSnowflakeState nextState() => KochMixSnowflakeState(generation + 1);
}
