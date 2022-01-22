import 'package:fractter/fractals/base/animation.dart';
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
}
