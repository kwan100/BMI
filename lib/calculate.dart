import 'dart:math';

class Calculate {
  Calculate({required this.feet, required this.inches, required this.pounds});

  final int feet;
  final int inches;
  final int pounds;
  double bmi = 0.0;

  String category() {
    if (bmi >= 30.0) {
      return "Obese";
    } else if (bmi >= 25.0) {
      return 'Overweight';
    } else if (bmi >= 18.5) {
      return "Normal";
    } else {
      return 'Underweight';
    }
  }

  String score() {
    bmi = pounds * 703 / pow(feet * 12 + inches , 2);
    return bmi.toStringAsFixed(1);
  }

  String result() {
    if (bmi >= 30.0) {
      return "Since your weight puts you in the obese range, you're much more likely to have serious health problems.";
    } else if (bmi >= 25.0) {
      return 'Since your weight puts you in the overweight range, losing some extra pounds is a good first step toward lowering your chances of health problems. If you have a very muscular build, though, you could have an overweight BMI and still be OK.';
    } else if (bmi >= 18.5) {
      return "You're in a good place now. Keep up your healthy habits to maintain your weight.";
    } else {
      return 'A few more pounds can lessen your chances of thinning bones and a weakened immune system, as well as feeling tired. Women who are underweight may have irregular periods or stop having them altogether. Underweight men may have lower sperm counts.';
    }
  }
}
