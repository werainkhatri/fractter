import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fractter/fractals/fractal.dart';
import 'package:fractter/utils/launch_url.dart';

class FractalScreen extends StatefulWidget {
  final Fractal fractal;
  const FractalScreen({Key? key, required this.fractal}) : super(key: key);

  @override
  State<FractalScreen> createState() => _FractalScreenState();
}

class _FractalScreenState extends State<FractalScreen> {
  bool get shaderWidgetIsNull => widget.fractal.shaderWidget == null;
  late bool showCustomPainted = shaderWidgetIsNull || kIsWeb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.fractal.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              tooltip: 'open in Wikipedia',
              onPressed: () {
                LaunchURL.launch(widget.fractal.wikiLink);
              },
              icon: const Icon(Icons.open_in_new),
            ),
          ),
        ],
      ),
      body: shaderWidgetIsNull
          ? widget.fractal.customPaintWidget
          : Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Shader'),
                    Builder(builder: (context) {
                      return Switch(
                        value: showCustomPainted,
                        onChanged: (value) {
                          if (kIsWeb) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Shader is not supported on web')),
                            );
                          } else if (value || widget.fractal.shaderWidget != null) {
                            setState(() {
                              showCustomPainted = value;
                            });
                          }
                        },
                      );
                    }),
                    const Text('CustomPaint'),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: showCustomPainted ? widget.fractal.customPaintWidget : widget.fractal.shaderWidget!,
                  ),
                ),
              ],
            ),
    );
  }
}
