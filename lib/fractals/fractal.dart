import 'package:fractter/fractals/base/animation.dart';
import 'package:fractter/fractals/sierpinski_carpet/animation.dart';

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
  ];

  static final Fractal sierpinskiCarpet = Fractal(
    name: 'Sierpiński Carpet',
    shortDescription: 'The Sierpiński carpet is a plane fractal first '
        'described by Wacław Sierpiński in 1916.',
    wikiLink: 'https://en.wikipedia.org/wiki/Sierpi%C5%84ski_carpet',
    animationWidget: SierpinskiCarpetAnimation(),
  );
}
