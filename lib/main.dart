import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(mayapp());
}
// في هذا التطبيق قسمنا الى عدة صفحات وهو الصحيح حيث نضع المين في صفحة لوحدها وهي التي تتحكم بالتطبيق

class mayapp extends StatelessWidget {
  const mayapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI",
      home: myhomepage(),
      // هذا هو الصحيح حيث نحدد الصفحة الام
    );
  }
}
