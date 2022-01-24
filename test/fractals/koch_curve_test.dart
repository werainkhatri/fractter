import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fractter/fractals/koch_curve/config.dart';
import 'package:fractter/fractals/koch_curve/painter.dart';
import 'package:fractter/fractals/koch_curve/state.dart';

void main() {
  testWidgets('KochCurvePainter', (WidgetTester tester) async {
    const KochCurveConfig config = KochCurveConfig(
      iterations: 7,
      curveColor: Colors.blue,
      interval: Duration(seconds: 1),
      initialState: KochCurveState(),
    );
    for (int i = 1; i <= config.iterations; i++) {
      await tester.pumpWidget(
        Center(
          child: AspectRatio(
            aspectRatio: config.aspectRatio,
            child: CustomPaint(
              painter: KochCurvePainter(KochCurveState(i), config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(CustomPaint),
        matchesGoldenFile('goldens/koch_curve/generation_$i.png'),
      );
    }
  });
}
