import 'package:flutter/cupertino.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.onTap, required this.buttonTitle});

  final onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20),
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Center(
            child: Text(
          buttonTitle,
          style: kBottomNavigationTextStyle,
        )),
      ),
    );
  }
}
