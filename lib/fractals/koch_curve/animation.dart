import 'package:flutter/material.dart';

import '../base/animation.dart';
import 'config.dart';
import 'state.dart';

class KochCurveAnimation extends FractalAnimation {
  KochCurveAnimation({
    int iterations = 7,
    Color curveColor = Colors.blue,
    Duration interval = const Duration(seconds: 1),
    Key? key,
  }) : super(
          config: KochCurveConfig(
            iterations: iterations,
            curveColor: curveColor,
            interval: interval,
            initialState: const KochCurveState(1),
          ),
          key: key,
        );
}
