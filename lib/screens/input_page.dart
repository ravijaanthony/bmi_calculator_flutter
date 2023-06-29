import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';

enum GenderEnum {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderEnum selectedGender = GenderEnum.male;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          backgroundColor: const Color(0xFF0A0E21),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: Row(children: [
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = GenderEnum.male;
                  });
                },
                colour: selectedGender == GenderEnum.male ? kActiveCardColor : kInactiveCardColor,
                cardChild: const CardGender(stringGender: "MALE", iconGender: FontAwesomeIcons.mars),
              ),
            ),
            Expanded(
                child: ReusableCard(
              onPress: () {
                setState(() {
                  selectedGender = GenderEnum.female;
                });
              },
              colour: selectedGender == GenderEnum.female ? kActiveCardColor : kInactiveCardColor,
              cardChild: const CardGender(stringGender: "FEMALE", iconGender: FontAwesomeIcons.venus),
            ))
          ])),
          Expanded(
              child: ReusableCard(
            colour: kActiveCardColor,
            cardChild: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "HEIGHT",
                style: kLabelTextStyle,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kSliderTextStyle,
                    ),
                    const Text(
                      " cm",
                      style: kLabelTextStyle,
                    )
                  ]),
              SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    thumbColor: const Color(0xFFEB1555),
                    overlayColor: const Color(0x30EB1555),
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      }))
            ]),
            onPress: null,
            // cardChild: null,
          )),
          Expanded(
              child: Row(children: [
            Expanded(
                child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "WEIGHT",
                  style: kLabelTextStyle,
                ),
                Text(
                  weight.toString(),
                  style: kSliderTextStyle,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  RoundIconButton(
                    icon: FontAwesomeIcons.minus,
                    weightOnPressed: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RoundIconButton(
                      icon: FontAwesomeIcons.plus,
                      weightOnPressed: () {
                        setState(() {
                          weight++;
                        });
                      })
                ])
              ]),
              onPress: null,
              // cardChild: null,
            )),
            Expanded(
                child: ReusableCard(
              colour: kActiveCardColor,
              onPress: null,
              cardChild: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "AGE",
                  style: kLabelTextStyle,
                ),
                Text(
                  age.toString(),
                  style: kSliderTextStyle,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  RoundIconButton(
                      icon: FontAwesomeIcons.minus,
                      weightOnPressed: () {
                        setState(() {
                          age--;
                        });
                      }),
                  const SizedBox(
                    width: 10,
                  ),
                  RoundIconButton(
                      icon: FontAwesomeIcons.plus,
                      weightOnPressed: () {
                        setState(() {
                          age++;
                        });
                      })
                ])
              ]),
            )),
          ])),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResults: calc.calculateBMI(),
                            interpretation: calc.getInterpretation(),
                            resultText: calc.getResult(),
                          )));
            },
          )
        ]));
  }
}
