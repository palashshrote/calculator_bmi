import 'package:flutter/cupertino.dart';

import '../components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_container.dart';
import '../constantsx.dart';
import '../components/icon_content.dart';
import 'result.dart';
import '/computation.dart';
import '../components/record.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.record});
  final List<Record> record;

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int currentHeight = 152;
  int weight = 56;
  int age = 24;
  List<Record> record = [];

  @override
  void initState() {
    super.initState();
    record = widget.record;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: (selectedGender == Gender.male
                        ? activeCardColor
                        : inActiveCardColor),
                    cardChild: const IconContent(
                      iconData: FontAwesomeIcons.mars,
                      content: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: (selectedGender == Gender.female
                        ? activeCardColor
                        : inActiveCardColor),
                    cardChild: const IconContent(
                      iconData: FontAwesomeIcons.venus,
                      content: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$currentHeight',
                        style: kNumberTextStyle,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('cm'),
                    ],
                  ),
                  Slider(
                    value: currentHeight.toDouble(),
                    min: 100,
                    max: 250,
                    activeColor: sliderActiveColor,
                    inactiveColor: sliderInActiveColor,
                    onChanged: (double val) {
                      setState(() {
                        currentHeight = val.round();
                      });
                    },
                  ),
                ],
              ),
              colour: const Color(
                0xFF1D1E33,
              ),
            ),
          ),
          Expanded(
            child: ReuseableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('WEIGHT'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$weight',
                        style: kNumberTextStyle,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('kg'),
                    ],
                  ),
                  Slider(
                    value: weight.toDouble(),
                    min: 20,
                    max: 120,
                    activeColor: sliderActiveColor,
                    inactiveColor: sliderInActiveColor,
                    onChanged: (double val) {
                      setState(() {
                        weight = val.round();
                      });
                    },
                  ),
                ],
              ),
              colour: const Color(
                0xFF1D1E33,
              ),
            ),
          ),
          BottomContainer(
            onPress: () {
              // showToast("Show Bottom Toast", gravity: Toast.bottom)
              Computation comp =
                  Computation(height: currentHeight, weight: weight);

              // Navigator.push(context,
              //     CupertinoPageRoute(builder: (_) => const SettingView()));

              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return ResultPage(
                      compute: comp,
                      record: record,
                    );
                  },
                ),
              );
            },
            content: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

/*
Expanded(
                  child: ReuseableCard(
                    colour: const Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT'),
                        Text(
                          '$weight',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: const Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE'),
                        Text(
                          '$age',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              
*/
