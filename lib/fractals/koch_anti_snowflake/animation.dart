import 'package:flutter/material.dart';

import '../base/animation.dart';
import 'config.dart';
import 'state.dart';

class KochAntiSnowflakeAnimation extends FractalAnimation {
  KochAntiSnowflakeAnimation({
    int iterations = 7,
    Color curveColor = Colors.blue,
    Duration interval = const Duration(seconds: 1),
    Key? key,
  }) : super(
          config: KochAntiSnowflakeConfig(
            iterations: iterations,
            curveColor: curveColor,
            interval: interval,
            initialState: const KochAntiSnowflakeState(1),
          ),
          key: key,
        );
}
