import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/flat_card.dart';
import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 80;
  int age = 25;
  Gender gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: FlatCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.MALE;
                    });
                  },
                  color:
                      gender == Gender.MALE ? kCardColor : kInactiveCardColor,
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.male,
                        size: 80,
                      ),
                      Text(
                        "Male",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FlatCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.FEMALE;
                    });
                  },
                  color:
                      gender == Gender.FEMALE ? kCardColor : kInactiveCardColor,
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.female,
                        size: 80,
                      ),
                      Text(
                        "Female",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          FlatCard(
            color: kCardColor,
            child: Column(
              children: [
                Text(
                  "Height",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double v) {
                      setState(() {
                        height = v.floor();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FlatCard(
                  color: kCardColor,
                  child: Column(
                    children: [
                      Text(
                        "Weight",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            iconData: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FlatCard(
                  color: kCardColor,
                  child: Column(
                    children: [
                      Text(
                        "Age",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            iconData: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}
