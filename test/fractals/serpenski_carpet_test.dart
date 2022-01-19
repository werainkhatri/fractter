import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fractter/fractals/sierpinski_carpet/painter.dart';
import 'package:fractter/fractals/sierpinski_carpet/state.dart';

void main() {
  testWidgets('SierpinskiCarpetPainter', (WidgetTester tester) async {
    for (int i = 1; i <= 5; i++) {
      await tester.pumpWidget(
        RepaintBoundary(
          child: CustomPaint(
            painter: SierpinskiCarpetPainter(SierpinskiCarpetState(i)),
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
