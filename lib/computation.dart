import 'dart:math';

class Computation {
  Computation({required this.height, required this.weight});

  final int height;
  final int weight;

  late double bmi;

  String calculateBMI() {
    bmi = (weight / pow(height / 100, 2));
    return bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return "More workout will benefit";
    } else if (bmi >= 18.5) {
      return "Good, Keep it up!";
    } else {
      return "Need to bulk";
    }
  }
}
