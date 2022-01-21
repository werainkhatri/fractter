import 'package:flutter/material.dart';
import 'package:fractter/fractals/fractal.dart';
import 'package:fractter/utils/launch_url.dart';

class FractalScreen extends StatelessWidget {
  final Fractal fractal;
  const FractalScreen({Key? key, required this.fractal}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(fractal.name),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                tooltip: 'open in Wikipedia',
                onPressed: () {
                  LaunchURL.launch(fractal.wikiLink);
                },
                icon: const Icon(Icons.open_in_new),
              ),
            ),
          ],
        ),
        body: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: fractal.animationWidget,
          ),
        ),
      );
}
