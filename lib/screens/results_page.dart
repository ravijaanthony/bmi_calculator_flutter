import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.bmiResults, required this.interpretation, required this.resultText});

  final String bmiResults;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI CALCULATOR"),
          backgroundColor: const Color(0xFF0A0E21),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Your Results",
                  style: kTitleTextStyle,
                ),
              )),
              Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiResults,
                        style: kBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                  onPress: null,
                ),
              ),
              BottomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonTitle: "RE-CALCULATE")
            ],
          ),
        ));
  }
}
