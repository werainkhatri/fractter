import 'package:flutter_test/flutter_test.dart';
import 'package:fractter/utils/functions.dart';
import 'package:fractter/utils/line.dart';

void main() {
  test('getPointAtPerpDistance', () {
    Line line = Line(Offset.zero, const Offset(4.8, 3.6));
    double distance = 4;
    expect(
      F.getPerpBisectingPoint(line, distance, false), // above
      offsetMoreOrLessEquals(const Offset(0, 5)),
    );
    expect(
      F.getPerpBisectingPoint(line, distance, true), // below
      offsetMoreOrLessEquals(const Offset(4.8, -1.4)),
    );

    line = Line(const Offset(0, -1), const Offset(0, 1));
    distance = 1;
    expect(
      F.getPerpBisectingPoint(line, distance, false), // above
      offsetMoreOrLessEquals(const Offset(-1, 0)),
    );
    expect(
      F.getPerpBisectingPoint(line, distance, true), // below
      offsetMoreOrLessEquals(const Offset(1, 0)),
    );

    line = Line(const Offset(0, 1), const Offset(0, -1));
    distance = 1;
    expect(
      F.getPerpBisectingPoint(line, distance, false), // above
      offsetMoreOrLessEquals(const Offset(1, 0)),
    );
    expect(
      F.getPerpBisectingPoint(line, distance, true), // below
      offsetMoreOrLessEquals(const Offset(-1, 0)),
    );

    line = Line(const Offset(-1, 0), const Offset(1, 0));
    distance = 1;
    expect(
      F.getPerpBisectingPoint(line, distance, false), // above
      offsetMoreOrLessEquals(const Offset(0, 1)),
    );
    expect(
      F.getPerpBisectingPoint(line, distance, true), // below
      offsetMoreOrLessEquals(const Offset(0, -1)),
    );

    line = Line(const Offset(1, 0), const Offset(-1, 0));
    distance = 1;
    expect(
      F.getPerpBisectingPoint(line, distance, false), // above
      offsetMoreOrLessEquals(const Offset(0, -1)),
    );
    expect(
      F.getPerpBisectingPoint(line, distance, true), // below
      offsetMoreOrLessEquals(const Offset(0, 1)),
    );
  });
}
