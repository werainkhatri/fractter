import 'dart:math';
import 'dart:ui';

import 'package:fractter/utils/line.dart';

import 'constants.dart';

/// Class containing static utility functions.
class F {
  const F._();

  /// Returns the point at a perpendicular distance of [distance] from the midpoint
  /// of [line].
  ///
  /// ```
  ///            p3
  ///            |
  ///            |
  /// p1 ----------------- p2
  ///            |
  ///            |
  ///            p4
  /// ```
  ///
  /// Given Line(p1, p2):
  /// * if [below] is true, p4 will be returned,
  /// * else p3 will be returned.
  ///
  /// [distance] should be more than zero.
  static Offset getPerpBisectingPoint(Line line, double distance, bool below) {
    assert(distance > 0);
    if (line.slope.abs() < C.precisionErrorTolerance) {
      return line.midpoint + Offset(0, distance * line.delX.sign * (below ? -1 : 1));
    }
    Offset midpoint = line.midpoint;
    double slope = -1 / line.slope;
    double dx = distance / sqrt(1 + slope * slope);
    double dy = distance * slope / sqrt(1 + slope * slope);
    for (int xs = -1; xs <= 1; xs += 2) {
      for (int ys = -1; ys <= 1; ys += 2) {
        Offset potentialPoint = midpoint.translate(xs * dx, ys * dy);
        if (line.isPerpTo(Line(potentialPoint, midpoint)) &&
            !line.valueOf(potentialPoint).isNegative == below) {
          return potentialPoint;
        }
      }
    }
    // Will never reach here.
    throw UnimplementedError(
      'Line: $line\ndistance: $distance\nbelow: $below\nslope: $slope\ndx: $dx; dy: $dy',
    );
  }
}
