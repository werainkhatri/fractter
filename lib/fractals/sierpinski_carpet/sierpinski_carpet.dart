export 'config.dart';
export 'painter.dart';
export 'state.dart';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fractter/utils/functions.dart';
import 'sierpinski_carpet_shader.dart';

class SierpinskiCarpet extends StatefulWidget {
  const SierpinskiCarpet({
    Key? key,
    required this.carpetColor,
    required this.backgroundColor,
    this.iterations,
  }) : super(key: key);

  final Color carpetColor, backgroundColor;

  /// The number of iterations to generate the fractal.
  ///
  /// If null, iterations will be calculated based on the screen size and zoom
  /// level.
  final double? iterations;

  @override
  State<SierpinskiCarpet> createState() => _SierpinskiCarpetState();
}

class _SierpinskiCarpetState extends State<SierpinskiCarpet> {
  final TransformationController _controller = TransformationController();
  int maxByZoom = 0;

  int _iterationsFromZoom(double zoom) {
    // increase one for every 3x zoom
    final double logZoom = log(zoom) / log(3);
    return logZoom.floor();
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: _controller,
      onInteractionUpdate: (_) {
        final int newDueToZoom = _iterationsFromZoom(_controller.value.row0[0]);
        // only update if the zoom level has changed
        if (newDueToZoom != maxByZoom) {
          setState(() {
            maxByZoom = newDueToZoom;
          });
        }
      },
      maxScale: 1000,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxSize = min(constraints.maxHeight, constraints.maxWidth);
          // start with 1 and for every 500 pixels increase by 1
          final double maxBySize = 2.0 + (maxSize / 400).floor();

          return AspectRatio(
            aspectRatio: 1,
            child: SierpinskiCarpetShader(
              iterations: widget.iterations ?? maxBySize + maxByZoom,
              carpetColor: F.colorToVector4(widget.carpetColor),
              backgroundColor: F.colorToVector4(widget.backgroundColor),
            ),
          );
        },
      ),
    );
  }
}
