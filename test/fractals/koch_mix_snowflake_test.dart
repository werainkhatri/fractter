import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fractter/fractals/koch_mix_snowflake/config.dart';
import 'package:fractter/fractals/koch_mix_snowflake/painter.dart';
import 'package:fractter/fractals/koch_mix_snowflake/state.dart';

void main() {
  testWidgets('KochMixSnowflakePainter', (WidgetTester tester) async {
    const KochMixSnowflakeConfig config = KochMixSnowflakeConfig(
      iterations: 7,
      curveColor: Colors.blue,
      interval: Duration(seconds: 1),
      initialState: KochMixSnowflakeState(),
    );
    for (int i = 1; i <= config.iterations; i++) {
      await tester.pumpWidget(
        Center(
          child: AspectRatio(
            aspectRatio: config.aspectRatio,
            child: CustomPaint(
              painter: KochMixSnowflakePainter(KochMixSnowflakeState(i), config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(CustomPaint),
        matchesGoldenFile('goldens/koch_mix_snowflake/generation_$i.png'),
      );
    }
  });
}
