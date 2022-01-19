import 'package:flutter/material.dart';
import '../base/animation.dart';
import 'config.dart';
import 'state.dart';

class SierpinskiCarpetAnimation extends FractalAnimation {
  SierpinskiCarpetAnimation({
    int iterations = 5,
    Color backgroundColor = Colors.black,
    Color carpetColor = Colors.blue,
    Duration interval = const Duration(seconds: 1),
    Key? key,
  }) : super(
          config: SierpinskiCarpetConfig(
            iterations: iterations,
            backgroundColor: carpetColor,
            carpetColor: backgroundColor,
            interval: interval,
            initialState: const SierpinskiCarpetState(1),
          ),
          key: key,
        );
}
