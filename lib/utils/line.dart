import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';

/// Line segment with end points [p1] and [p2].
class Line {
  final Offset p1;
  final Offset p2;

  /// Creates a line containing points [p1] and [p2].
  ///
  /// [p1] cannot be equal to [p2].
  const Line(this.p1, this.p2) : assert(p1 != p2, 'p1 and p2 cannot be same');

  /// Horizontal distance b/w the points: `p2.x - p1.x`.
  double get delX => p2.dx - p1.dx;

  /// Vertical distance b/w the points: `p2.y - p1.y`.
  double get delY => p2.dy - p1.dy;

  /// Returns point on this line 1/3rd distance from [p1].
  ///
  /// p1....p3....p4....p2
  Offset get onethird => p1 + (p2 - p1) / 3;

  /// Returns point on this line 2/3rd distance from [p1].
  ///
  /// p1....p3....p4....p2
  Offset get twothird => p2 - (p2 - p1) / 3;

  /// Returns center point on the line.
  Offset get midpoint => (p1 + p2) / 2;

  /// Returns slope of the line.
  double get slope => delY / delX;

  /// Distance between points [p1] and [p2].
  double get length => sqrt(pow(delX, 2) + pow(delY, 2));

  /// Value of function of this line when [point] is put in.
  ///
  /// Sign of this value along with left-hand thumb rule can be used to find
  /// where the point lies wrt this line.
  ///
  /// Mathematically, returns: `(y2-y1)(x-x1)-(x2-x1)(y-y1)`.
  double valueOf(Offset point) => delY * (point.dx - p1.dx) - delX * (point.dy - p1.dy);

  /// Whether [point] is on this line.
  bool contains(Offset point) => valueOf(point) == 0;

  /// Whether this line is perpendicular to [other].
  bool isPerpTo(Line other) =>
      _isPerpTo(other) ||
      other._isPerpTo(this) ||
      ((slope * other.slope + 1).abs() < precisionErrorTolerance);

  bool _isPerpTo(Line other) => (slope == 0 && other.slope.abs() == double.infinity);

  Line copyWith({Offset? p1, Offset? p2}) => Line(p1 ?? this.p1, p2 ?? this.p2);

  @override
  String toString() => 'Line($p1, $p2)';
}
