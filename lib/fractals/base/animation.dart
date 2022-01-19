import 'dart:math';

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
  late Key paintKey;

  @override
  void initState() {
    super.initState();
    _state = widget.config.initialState;
    paintKey = const ValueKey('CustomPaint');
    _iterate();
  }

  @override
  Widget build(BuildContext context) {
    final double side = min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Center(
      child: Container(
        height: side,
        width: side,
        color: widget.config.backgroundColor,
        child: CustomPaint(
          key: paintKey,
          painter: widget.config.getPainter(_state, widget.config),
        ),
      ),
    );
  }

  void _iterate() async {
    for (int i = 0; i < widget.config.iterations; i++) {
      await Future.delayed(widget.config.interval);
      if (mounted) {
        setState(() {
          _state = _state.nextState();
        });
      }
    }
  }
}
