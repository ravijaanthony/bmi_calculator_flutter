import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.weightOnPressed});

  final IconData icon;
  final Function weightOnPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: () {
        weightOnPressed();
      },
      child: Icon(icon),
    );
  }
}
