import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fractter/fractals/koch_anti_snowflake/config.dart';
import 'package:fractter/fractals/koch_anti_snowflake/painter.dart';
import 'package:fractter/fractals/koch_anti_snowflake/state.dart';

void main() {
  testWidgets('KochAntiSnowflakePainter', (WidgetTester tester) async {
    const KochAntiSnowflakeConfig config = KochAntiSnowflakeConfig(
      iterations: 7,
      curveColor: Colors.blue,
      interval: Duration(seconds: 1),
      initialState: KochAntiSnowflakeState(),
    );
    for (int i = 1; i <= config.iterations; i++) {
      await tester.pumpWidget(
        Center(
          child: AspectRatio(
            aspectRatio: config.aspectRatio,
            child: CustomPaint(
              painter: KochAntiSnowflakePainter(KochAntiSnowflakeState(i), config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(CustomPaint),
        matchesGoldenFile('goldens/koch_anti_snowflake/generation_$i.png'),
      );
    }
  });
}
