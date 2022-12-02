import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.score, required this.result, required this.category}) : super(key: key);

  final String score;
  final String result;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('BmiPal', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),),
            Image.asset(
              'images/bmi_icon.png',
              fit: BoxFit.contain,
              height: 30,
            ),
          ],
        ),
      ),
      body: Container (
        margin: const EdgeInsets.all(35.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "BMI: $score ($category)",
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const Text(
                    "The healthy range for BMI is between 18.5 and 24.9.",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.indigo,
                ),
                margin: const EdgeInsets.only(top: 150.0),
                width: double.infinity,
                height: 80.0,
                child: const Center(
                  child: Text(
                    ('Recalculate'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
