import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:fractter/utils/line.dart';

void main() {
  test('onethird, twothird and midpoint', () {
    Line line = Line(Offset.zero, const Offset(9, 3));
    expect(line.onethird, equals(const Offset(3, 1)));
    expect(line.twothird, equals(const Offset(6, 2)));
    expect(line.midpoint, equals(const Offset(4.5, 1.5)));
  });

  test('slope', () {
    expect(Line(Offset.zero, const Offset(0, 1)).slope, equals(double.infinity));
    expect(Line(const Offset(0, 1), Offset.zero).slope, equals(double.negativeInfinity));
    expect(Line(Offset.zero, const Offset(1, 0)).slope, equals(0));
    expect(Line(Offset.zero, const Offset(1, 1)).slope, equals(1));
    expect(Line(Offset.zero, const Offset(1, -1)).slope, equals(-1));
  });

  test('length', () {
    expect(Line(Offset.zero, const Offset(0, 1)).length, equals(1));
    expect(Line(Offset.zero, const Offset(1, 1)).length, equals(sqrt(2)));
    expect(Line(const Offset(10, 10), const Offset(13, 14)).length, equals(5));
  });

  test('valueOf', () {
    Line line = Line(Offset.zero, const Offset(0, 1));
    expect(line.valueOf(const Offset(0, -1)), isZero); // on the line
    expect(line.valueOf(const Offset(-1, 0)), isNegative); // left of the line
    expect(line.valueOf(const Offset(1, 0)), isPositive); // right of the line

    line = Line(const Offset(0, 1), Offset.zero);
    expect(line.valueOf(const Offset(0, -1)), isZero); // on the line
    expect(line.valueOf(const Offset(-1, 0)), isPositive); // left of the line
    expect(line.valueOf(const Offset(1, 0)), isNegative); // right of the line

    line = Line(Offset.zero, const Offset(1, 0));
    expect(line.valueOf(const Offset(-1, 0)), isZero); // on the line
    expect(line.valueOf(const Offset(0, 1)), isNegative); // above the line
    expect(line.valueOf(const Offset(0, -1)), isPositive); // below the line

    line = Line(const Offset(1, 0), Offset.zero);
    expect(line.valueOf(const Offset(-1, 0)), isZero); // on the line
    expect(line.valueOf(const Offset(0, 1)), isPositive); // above the line
    expect(line.valueOf(const Offset(0, -1)), isNegative); // below the line

    line = Line(Offset.zero, const Offset(1, 1));
    expect(line.valueOf(const Offset(-1, -1)), isZero); // on the line
    expect(line.valueOf(const Offset(0, 1)), isNegative); // left of the line
    expect(line.valueOf(const Offset(1, 0)), isPositive); // right of the line

    line = Line(const Offset(1, 1), Offset.zero);
    expect(line.valueOf(const Offset(-1, -1)), isZero); // on the line
    expect(line.valueOf(const Offset(0, 1)), isPositive); // right of the line
    expect(line.valueOf(const Offset(1, 0)), isNegative); // left of the line
  });

  test('contains', () {
    Line line = Line(Offset.zero, const Offset(0, 1));
    expect(line.contains(const Offset(0, -1)), isTrue);
    expect(line.contains(const Offset(1, 0)), isFalse);
    expect(line.contains(const Offset(-1, 0)), isFalse);

    line = Line(Offset.zero, const Offset(1, 0));
    expect(line.contains(const Offset(-1, 0)), isTrue);
    expect(line.contains(const Offset(0, -1)), isFalse);
    expect(line.contains(const Offset(0, 1)), isFalse);
  });

  test('isPerpTo', () {
    Line xAxis = Line(Offset.zero, const Offset(0, 1)),
        yAxis = Line(Offset.zero, const Offset(1, 0));
    expect(xAxis.isPerpTo(yAxis), isTrue);
    expect(yAxis.isPerpTo(xAxis), isTrue);

    expect(
      Line(Offset.zero, const Offset(1, 1)).isPerpTo(Line(Offset.zero, const Offset(-1, 1))),
      isTrue,
    );
  });

  test('antiLine', () {
    expect(Line(const Offset(1, 1), const Offset(2, 2)).antiLine(),
        equals(Line(const Offset(2, 2), const Offset(1, 1))));
  });

  test('toString', () {
    expect(Line(const Offset(1, 1), const Offset(2, 2)).toString(),
        equals('Line(Offset(1.0, 1.0), Offset(2.0, 2.0))'));
  });

  test('same p1 and p2 throws assertion error', () {
    expect(() => Line(Offset.zero, Offset.zero), throwsAssertionError);
  });
}
