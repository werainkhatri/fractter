import 'package:fractter/fractals/base/animation.dart';
import 'package:fractter/fractals/koch_anti_snowflake/animation.dart';
import 'package:fractter/fractals/koch_curve/animation.dart';
import 'package:fractter/fractals/koch_mix_snowflake/animation.dart';
import 'package:fractter/fractals/koch_snowflake/animation.dart';
import 'package:fractter/fractals/sierpinski_carpet/animation.dart';
import 'package:fractter/fractals/sierpinski_triangle/animation.dart';

class Fractal {
  const Fractal({
    required this.name,
    required this.shortDescription,
    required this.wikiLink,
    required this.animationWidget,
  });

  final String name;
  final String shortDescription;
  final String wikiLink;
  final FractalAnimation animationWidget;

  static final List<Fractal> all = <Fractal>[
    kochCurve,
    kochSnowflake,
    kochAntiSnowflake,
    kochMixSnowflake,
    sierpinskiCarpet,
    sierpinskiTriangle,
  ];

  static final Fractal sierpinskiCarpet = Fractal(
    name: 'Sierpiński Carpet',
    shortDescription: 'The Sierpiński carpet is a plane fractal which starts '
        'with a square, which is subdivided into 9 congruent subsquares in a '
        '3-by-3 grid, and the central subsquare is removed. The same procedure is '
        'then applied recursively to the remaining 8 subsquares, ad infinitum.',
    wikiLink: 'https://en.wikipedia.org/wiki/Sierpi%C5%84ski_carpet',
    animationWidget: SierpinskiCarpetAnimation(),
  );

  static final Fractal sierpinskiTriangle = Fractal(
    name: 'Sierpiński Triangle',
    shortDescription: 'The Sierpiński triangle is a plane fractal which starts '
        'with an equilateral triangle, which is subdivided into 4 smaller '
        'congruent equilateral triangles, and the central triangle is removed. '
        'The same procedure is then applied recursively to the remaining 3 '
        'subtriangles, ad infinitum.',
    wikiLink: 'https://en.wikipedia.org/wiki/Sierpi%C5%84ski_triangle',
    animationWidget: SierpinskiTriangleAnimation(),
  );

  static final Fractal kochCurve = Fractal(
    name: 'Koch Curve',
    shortDescription: 'The Koch curve is a plane fractal which starts with '
        'a straight line, which is divided into 3 equal segments. An equilateral '
        'triangle is constructed using the middle line as the base, and this base '
        'is removed. This results in 4 new line segments, on which the same procedure '
        'is applied recursively, ad infinitum.',
    wikiLink: 'https://en.wikipedia.org/wiki/Koch_curve',
    animationWidget: KochCurveAnimation(),
  );

  static final Fractal kochSnowflake = Fractal(
    name: 'Koch Snowflake',
    shortDescription: 'The Koch snowflake is a plane fractal which starts with '
        'an equilateral triangle. Each side is treated as a starting line and '
        'the Koch curve fractal is applied to them recursively, ad infinitum.',
    wikiLink: 'https://en.wikipedia.org/wiki/Koch_snowflake',
    animationWidget: KochSnowflakeAnimation(),
  );

  static final Fractal kochAntiSnowflake = Fractal(
    name: 'Koch Anti Snowflake',
    shortDescription: 'The Koch anti snowflake is a plane fractal which is same '
        'as the Koch snowflake, but instead of the curve buldging out, they buldge in.',
    wikiLink: 'https://en.wikipedia.org/wiki/Koch_snowflake',
    animationWidget: KochAntiSnowflakeAnimation(),
  );

  static final Fractal kochMixSnowflake = Fractal(
    name: 'Koch Mix Snowflake',
    shortDescription: 'The Koch mix snowflake is a plane fractal which is the '
        'summation of Koch snowflake and Koch anti snowflake.',
    wikiLink: 'https://en.wikipedia.org/wiki/Koch_snowflake',
    animationWidget: KochMixSnowflakeAnimation(),
  );
}
