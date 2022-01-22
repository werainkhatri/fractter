import 'package:flutter/material.dart';
import '../base/animation.dart';
import 'config.dart';
import 'state.dart';

class SierpinskiTriangleAnimation extends FractalAnimation {
  SierpinskiTriangleAnimation({
    int iterations = 7,
    Color backgroundColor = Colors.black,
    Color carpetColor = Colors.blue,
    Duration interval = const Duration(seconds: 1),
    Key? key,
  }) : super(
          config: SierpinskiTriangleConfig(
            iterations: iterations,
            backgroundColor: backgroundColor,
            triangleColor: carpetColor,
            interval: interval,
            initialState: const SierpinskiTriangleState(1),
          ),
          key: key,
        );
}
