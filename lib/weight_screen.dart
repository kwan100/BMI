import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'result_screen.dart';
import 'calculate.dart';


class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key, required this.feet, required this.inches}) : super(key: key);

  final int feet;
  final int inches;

  @override
  WeightScreenState createState() => WeightScreenState();
}

class WeightScreenState extends State<WeightScreen> {
  int pounds = 0;

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
      body: Container(
        margin: const EdgeInsets.all(35.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                            child: Text('Step 2:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                              child: Text('How much do you weigh?',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ]
                      ),
                      Expanded(
                          child: TextField(
                            onChanged: (value) {
                              pounds = int.parse(value);
                            },
                            decoration: const InputDecoration(
                              labelText: '(pounds)',
                              icon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(
                                  Icons.scale_rounded,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          )
                      ),
                    ],
                  )
              ),
              GestureDetector(
                onTap: () {
                  Calculate calculate = Calculate(feet: widget.feet, inches: widget.inches, pounds: pounds);
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ResultScreen(
                            score: calculate.score(),
                            result: calculate.result(),
                            category: calculate.category(),
                          ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.indigo,
                  ),
                  width: double.infinity,
                  height: 80.0,
                  child: const Center(
                    child: Text(
                      ('Calculate'),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}
