import 'package:flutter/material.dart';

import '../base/animation.dart';
import 'config.dart';
import 'state.dart';

class KochSnowflakeAnimation extends FractalAnimation {
  KochSnowflakeAnimation({
    int iterations = 7,
    Color curveColor = Colors.blue,
    Duration interval = const Duration(seconds: 1),
    Key? key,
  }) : super(
          config: KochSnowflakeConfig(
            iterations: iterations,
            curveColor: curveColor,
            interval: interval,
            initialState: const KochSnowflakeState(1),
          ),
          key: key,
        );
}
