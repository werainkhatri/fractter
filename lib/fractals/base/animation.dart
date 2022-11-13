import 'package:flutter/material.dart';
import 'package:fractter/fractals/base/painter.dart';

import 'state.dart';
import 'config.dart';

typedef FractalPainterGetter = FractalPainter Function(
    FractalState state, FractalConfig config);

/// Base class for animating a fractal.
class FractalAnimation extends StatefulWidget {
  final FractalConfig config;
  final FractalPainterGetter getPainter;
  const FractalAnimation({
    super.key,
    required this.config,
    required this.getPainter,
  });

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
            painter: widget.getPainter(_state, widget.config),
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
