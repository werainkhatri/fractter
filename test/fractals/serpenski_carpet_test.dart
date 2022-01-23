import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fractter/fractals/sierpinski_carpet/config.dart';
import 'package:fractter/fractals/sierpinski_carpet/painter.dart';
import 'package:fractter/fractals/sierpinski_carpet/state.dart';

void main() {
  testWidgets('SierpinskiCarpetPainter', (WidgetTester tester) async {
    const SierpinskiCarpetConfig config = SierpinskiCarpetConfig(
      iterations: 7,
      backgroundColor: Colors.black,
      carpetColor: Colors.blue,
      interval: Duration(seconds: 1),
      initialState: SierpinskiCarpetState(),
    );
    for (int i = 1; i <= config.iterations; i++) {
      await tester.pumpWidget(
        Center(
          child: AspectRatio(
            aspectRatio: config.aspectRatio,
            child: CustomPaint(
              painter: SierpinskiCarpetPainter(SierpinskiCarpetState(i), config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(CustomPaint),
        matchesGoldenFile('goldens/sierpinski_carpet/generation_$i.png'),
      );
    }
  });
}
