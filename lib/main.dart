import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21), //0xFF --> opaque
        scaffoldBackgroundColor: const Color(0xFF0A0E21), //body color
      ),
      home: InputPage(),
    );
  }
}
