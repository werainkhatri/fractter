import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fractter/fractals/koch_snowflake/config.dart';
import 'package:fractter/fractals/koch_snowflake/painter.dart';
import 'package:fractter/fractals/koch_snowflake/state.dart';

void main() {
  testWidgets('KochSnowflakePainter', (WidgetTester tester) async {
    const KochSnowflakeConfig config = KochSnowflakeConfig(
      iterations: 7,
      curveColor: Colors.blue,
      interval: Duration(seconds: 1),
      initialState: KochSnowflakeState(),
    );
    for (int i = 1; i <= config.iterations; i++) {
      await tester.pumpWidget(
        Center(
          child: AspectRatio(
            aspectRatio: config.aspectRatio,
            child: CustomPaint(
              painter: KochSnowflakePainter(KochSnowflakeState(i), config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(CustomPaint),
        matchesGoldenFile('goldens/koch_snowflake/generation_$i.png'),
      );
    }
  });
}
