import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fractter/fractals/sierpinski_triangle/config.dart';
import 'package:fractter/fractals/sierpinski_triangle/painter.dart';
import 'package:fractter/fractals/sierpinski_triangle/state.dart';

void main() {
  testWidgets('SierpinskiTrianglePainter', (WidgetTester tester) async {
    const SierpinskiTriangleConfig config = SierpinskiTriangleConfig(
      iterations: 8,
      backgroundColor: Colors.black,
      triangleColor: Colors.blue,
      interval: Duration(seconds: 1),
      initialState: SierpinskiTriangleState(),
    );
    for (int i = 1; i <= config.iterations; i++) {
      await tester.pumpWidget(
        Center(
          child: AspectRatio(
            aspectRatio: config.aspectRatio,
            child: CustomPaint(
              painter: SierpinskiTrianglePainter(SierpinskiTriangleState(i), config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(CustomPaint),
        matchesGoldenFile('goldens/sierpinski_triangle/generation_$i.png'),
      );
    }
  });
}
