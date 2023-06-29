import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({super.key, required this.colour, required this.cardChild, required this.onPress});

  final Color colour;
  final cardChild;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
            child: cardChild,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.circular(10.0),
            )));
  }
}
