import 'package:flutter/material.dart';

import '../base/animation.dart';
import 'config.dart';
import 'state.dart';

class KochMixSnowflakeAnimation extends FractalAnimation {
  KochMixSnowflakeAnimation({
    int iterations = 7,
    Color curveColor = Colors.blue,
    Duration interval = const Duration(seconds: 1),
    Key? key,
  }) : super(
          config: KochMixSnowflakeConfig(
            iterations: iterations,
            curveColor: curveColor,
            interval: interval,
            initialState: const KochMixSnowflakeState(1),
          ),
          key: key,
        );
}
