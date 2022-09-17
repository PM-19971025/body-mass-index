import 'package:flutter/material.dart';
import 'home.dart';

class Result extends StatelessWidget {
  final bool is_male;
  final int age;
  final double result;
  String get resultPhrase {
    String resultText = '';
    if (result >= 32)
      resultText = 'Obese';
    else if (result > 25 && result < 30)
      resultText = 'Overweight';
    else if (result > 18.5 && result < 24.9)
      resultText = 'Normal';
    else
      resultText = 'Thin';
    return resultText;
  }
  //اعلاه اسلوب حديث لعمل اف ستيمنت وهو اسلوب الغيت

  const Result({
    Key? key,
    required this.is_male,
    required this.age,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Result "),
          backgroundColor: Colors.teal,
        ),
        body: DefaultTextStyle(
          style: TextStyle(fontSize: 30, color: Colors.black),
          child: Center(
            child: Column(
              children: [
                Text("Gander:${is_male ? 'Male' : 'Femal'}"),
                SizedBox(height: 60),
                Text("Result:${result.toStringAsFixed(1)} "),
                SizedBox(height: 60),
                Text("Healthiness: $resultPhrase"),
                SizedBox(height: 60),
                Text("Age:$age"),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
