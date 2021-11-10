import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mamy/result.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 55;
  int weightVal = 65;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Body Mass Index "),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(children: [
                  m1expanded(context, 'male'),
                  SizedBox(width: 15),
                  m1expanded(context, 'female'),
                ]),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',
                          style: Theme.of(context).textTheme.headline2),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(heightVal.toStringAsFixed(1),
                                style: Theme.of(context).textTheme.headline1),
                            Text('CM',
                                style: Theme.of(context).textTheme.bodyText1),
                          ]),
                      Slider(
                        inactiveColor: Colors.black54,
                        thumbColor: Colors.black,
                        value: heightVal,
                        onChanged: (newVal) =>
                            setState(() => heightVal = newVal),
                        min: 45,
                        max: 350,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(children: [
                  m2expanded(context, 'weight'),
                  SizedBox(width: 15),
                  m2expanded(context, 'age'),
                ]),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                onPressed: () {
                  var result = weightVal / pow(heightVal / 100, 2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                              result: result, age: age, isMale: isMale)));
                },
                child: Text(
                  'Calculate',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//for gender
  Expanded m1expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isMale = (type == 'male') ? true : false),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 80,
              ),
              SizedBox(height: 10),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

//for weigtht and age
  Expanded m2expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'weight' ? 'Weight' : 'Age',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 10),
            Text(
              type == 'weight' ? '$weightVal' : '$age',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'weight' ? 'weight--' : 'age--',
                  onPressed: () =>
                      setState(() => type == 'weight' ? weightVal-- : age--),
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  heroTag: type == 'weight' ? 'weight++' : 'age++',
                  onPressed: () =>
                      setState(() => type == 'weight' ? weightVal++ : age++),
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
