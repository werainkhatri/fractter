import 'package:flutter/material.dart';
import 'package:fractter/fractals/fractal.dart';
import 'package:fractter/screens/fractal_screen.dart';
import 'package:fractter/utils/launch_url.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Fractter'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                tooltip: 'view source code',
                onPressed: () {
                  LaunchURL.launchGitHub();
                },
                icon: const Icon(Icons.code),
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: Fractal.all.length,
          itemBuilder: (context, i) {
            final Fractal fractal = Fractal.all[i];
            return ListTile(
              title: Text(fractal.name),
              subtitle: Text(fractal.shortDescription),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FractalScreen(fractal: fractal)),
                );
              },
            );
          },
        ),
      );
}
