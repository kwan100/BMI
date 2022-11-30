import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'result_screen.dart';
import 'calculate.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int feet = 0;
  int inches = 0;
  int pounds = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ('BMI'),
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top:35.0, bottom:35.0, left:35.0, right:35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 35.0),
              child: Column(
                children: <Widget>[
                  Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('Height',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]
                  ),
                  Row (
                    children: [
                      Expanded(
                          child: TextField(
                            onChanged: (value) {
                              feet = int.parse(value);
                            },
                            decoration: const InputDecoration(
                              labelText: '(feet)',
                              icon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(
                                  Icons.emoji_people,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          )
                      ),
                      Expanded(
                          child: TextField(
                            onChanged: (value) {
                              inches = int.parse(value);
                            },
                            decoration: const InputDecoration(
                              labelText: '(inches)',
                              icon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(
                                  Icons.emoji_people,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text('Weight',
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
                                Icons.fitness_center,
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
                Calculate calculate = Calculate(feet: feet, inches: inches, pounds: pounds);
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultScreen(
                          score: calculate.score(),
                          result: calculate.result(),
                        ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.black,
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
