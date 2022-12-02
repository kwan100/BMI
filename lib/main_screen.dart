import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'weight_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int feet = 0;
  int inches = 0;

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
                          child: Text('Step 1:',
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
                            child: Text('How tall are you?',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ]
                    ),
                    Row(
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
                                      Icons.accessibility_new,
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
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              )
                          ),
                        ]
                    ),


                  ],
                )
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WeightScreen(
                          feet: feet,
                          inches: inches,
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
                    ('Next'),
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
