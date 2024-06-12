// import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/bottom_container.dart';
import '../constantsx.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '/computation.dart';
import '../components/record.dart';

class ResultPage extends StatefulWidget {
  final Computation compute;
  final List<Record> record;
  const ResultPage({super.key, required this.compute, required this.record});

  // Computation newComp = comp;
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late String bmi;
  late String result;
  late String interpretation;
  List<Record> record = [];
  // List to store the records
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bmi = widget.compute.calculateBMI();
    result = widget.compute.getResults();
    interpretation = widget.compute.getInterpretation();
    record = widget.record;
  }

  void _showSaveDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                setState(() {
                  record.add(
                    Record(
                      name: nameController.text,
                      bmi: bmi,
                      result: result,
                    ),
                  );
                });
                Fluttertoast.showToast(
                  msg: "Saved into records",
                );
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back
              } else {
                Fluttertoast.showToast(
                  msg: "Please provide name to save",
                );
              }
            },
            child: const Text('SAVE'),
          ),
        ],
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your name',
              labelStyle: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CACLULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: const Text(
                'Your Result',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReuseableCard(
              colour: activeCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: resultTextStyle,
                  ),
                  Text(
                    bmi,
                    style: bmiTextStyle,
                  ),
                  Center(
                    child: Text(
                      interpretation,
                      style: bodyTextStyle,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _showSaveDialog,
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'SAVE RESULT',
                        style: saveresultTextStyle,
                      ),
                    ),
                  ),

                  // Text('You have a normal body weight'),
                ],
              ),
            ),
          ),
          BottomContainer(
            content: 'RECALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
