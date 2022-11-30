import 'dart:math';

class Calculate {
  Calculate({required this.feet, required this.inches, required this.pounds});

  final int feet;
  final int inches;
  final int pounds;
  double bmi = 0.0;

  String score() {
    bmi = pounds * 703 / pow(feet * 12 + inches , 2);
    return bmi.toStringAsFixed(1);
  }

  String result() {
    if (bmi >= 30.0) {
      return 'Obese';
    } else if (bmi >= 25.0) {
      return 'Overweight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
