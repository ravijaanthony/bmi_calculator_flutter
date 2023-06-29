import 'package:flutter/cupertino.dart';
import '../constants.dart';

class CardGender extends StatelessWidget {
  const CardGender({super.key, required this.stringGender, required this.iconGender});

  final String stringGender;
  final IconData iconGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconGender,
          size: 80,
        ),
        const SizedBox(height: 15),
        Text(
          stringGender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
