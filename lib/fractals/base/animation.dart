import 'package:flutter/material.dart';

import 'state.dart';
import 'config.dart';

/// Base class for animating a fractal.
class FractalAnimation extends StatefulWidget {
  final FractalConfig config;
  const FractalAnimation({Key? key, required this.config}) : super(key: key);

  @override
  _FractalAnimationState createState() => _FractalAnimationState();
}

class _FractalAnimationState extends State<FractalAnimation> {
  late FractalState _state;

  @override
  void initState() {
    super.initState();
    _state = widget.config.initialState;
    _iterate();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Center(
        child: AspectRatio(
          aspectRatio: widget.config.aspectRatio,
          child: CustomPaint(
            painter: widget.config.getPainter(_state, widget.config),
          ),
        ),
      ),
    );
  }

  void _iterate() async {
    // First generation is painted initially,
    // only (iterations - 1) generations need to be animated.
    for (int i = 1; i < widget.config.iterations; i++) {
      await Future.delayed(widget.config.interval);
      if (mounted) {
        setState(() {
          _state = _state.nextState();
        });
      }
    }
  }
}
