import 'package:flutter/material.dart';
import 'package:fractter/screens/home.dart';

void main() {
  runApp(const Fractter());
}

class Fractter extends StatelessWidget {
  const Fractter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(home: HomeScreen());
}
