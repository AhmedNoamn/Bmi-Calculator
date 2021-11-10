import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    required this.result,
    required this.age,
    required this.isMale,
  });

  final double result;
  final int age;
  final bool isMale;

  String get healthPhrase {
    String reslutTesxt = '';
    if (result > 30)
      reslutTesxt = 'Obese';
    else if (result < 30 && result >= 25)
      reslutTesxt = 'Overweight';
    else if (result <= 24.9 && result >= 18.5)
      reslutTesxt = 'Normal';
    else
      reslutTesxt = 'Thin';
    return reslutTesxt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            ' Gender : ${isMale ? 'Male' : 'Female'}',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            ' Result : ${result.toStringAsFixed(1)}',
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
          Text(
            ' Healtiness : $healthPhrase',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            ' Age : $age',
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ))),
    );
  }
}
