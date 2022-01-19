import 'package:flutter/material.dart';
import 'package:fractter/fractals/sierpinski_carpet/animation.dart';

void main() {
  runApp(const Fractter());
}

class Fractter extends StatelessWidget {
  const Fractter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SierpinskiCarpetAnimation());
  }
}
