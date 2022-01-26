import 'dart:collection';
import 'dart:math';
import 'dart:ui';

import 'package:fractter/utils/functions.dart';
import 'package:fractter/utils/line.dart';

class CommonPainter {
  static void paintKochCurve({
    required Canvas canvas,
    required Paint painter,
    required Line initialLine,
    required int generation,
  }) {
    final Queue<Line> lines = Queue();
    lines.add(initialLine);

    for (int i = 2; i <= generation; i++) {
      int len = lines.length;
      while (len-- > 0) {
        Line line = lines.removeFirst();

        Line l1 = line.copyWith(p2: line.onethird);
        lines.add(l1);

        Line l2 = line.copyWith(p1: line.onethird, p2: line.twothird);
        // here, below is set to true because origin is on the top right.
        Offset p3 = F.getPerpBisectingPoint(l2, l2.length * sqrt(3) / 2, true);
        lines.add(l2.copyWith(p2: p3));
        lines.add(l2.copyWith(p1: p3));

        Line l3 = line.copyWith(p1: line.twothird);
        lines.add(l3);
      }
    }

    for (Line line in lines) {
      canvas.drawLine(line.p1, line.p2, painter);
    }
  }
}
