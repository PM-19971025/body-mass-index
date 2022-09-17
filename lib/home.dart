import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'result.dart';
import 'home.dart';
import 'dart:math';

class myhomepage extends StatefulWidget {
  myhomepage({Key? key}) : super(key: key);

  @override
  State<myhomepage> createState() => _myhomepageState();
}

class _myhomepageState extends State<myhomepage> {
  //في هذهِ الصفحة عرفنا متغيرات وهن 4 متغيرات سوف يكون المتغير هس ميل يحمل صفة ترو او فالس
  bool is_male = false;
  double hightval = 170;
  int age = 18;
  int weight = 50;
  @override
  // في الاسفل قسمنا الواجهة الى اعمدة وصفوف لكي نتمكن بالتحكم في الصفحة
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Body Mass Index ",
        ),
      ),
      //ملاحظة السيف اريا مهمه كلش حتى نستطيع ان نجعل تطبيقنا قابل للعمل في جميع الموبايلات
      body: SafeArea(
        child: Column(
          //main column
          mainAxisAlignment: MainAxisAlignment.center,
          // ملاحظة مهمة جدا :ـ ايكسبانديد هو عبارة عن وجت مفيد جدا لجعل العناصر في الاعمدة والصفوف باخذ المساحة المتاحها لها ويتم تقسيهما بينهما بحيث يملأها
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded1(context, 'male'),
                    const SizedBox(width: 15),
                    Expanded1(context, 'femal'),
                  ],
                ),
              ),
            ),
            //////////////////// first row in main column
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      20.0), //اعطيناها سميترك حتى لا نترك من الاعلى والاسفل مسافة
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height:",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        //هذه الطريقة لجعل النص صغير تحت نص اخر نلاحض انا وضعنا العبارة المارد جعلها تحت عبارة اخرى في صف واحد حتى يعمل الكود عليها
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            " ${hightval.toStringAsFixed(1)}",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                          Text(
                            "cm",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Slider(
                          //هذا السلايدر مفيد في جعل التصميم اكثر احترافية
                          min: 90,
                          max: 220,
                          value: hightval,
                          onChanged: (newval) {
                            setState(() {
                              // يجب وضع العناصر اعلاه والتي في الاسفل كذلك وهنا اسندنا قيمة الجديدة للقديمه اثناء التغيير
                              hightval = newval;
                            });
                          })
                    ],
                  )),
            )),
            //////////////////// second row in main column
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded2(context, 'weight'),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded2(context, 'age'),
                    //////////////////// secound  row in main column
                  ],
                ),
              ),
            ),
            //////////////////// third row in main column
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  // المعادلة
                  var result = weight / pow(hightval / 100, 2);
                  //للتحويل الى صفحة النتائج
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(
                          age: age,
                          is_male: is_male,
                          result: result,
                        ),
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

//ملاحظة مهمة جدا نستخدم اسلوب استخراج الوت لنتمكن من استخدام وجت محدةة كدالة لعدة استخدامات وهنا سوف يكون الكود مختصرا ونظيفا ويمكننا التحكم بها عنطريق متغير
  Expanded Expanded1(BuildContext context, String type) {
    return Expanded(
        //يستخدم وجت  غيستر ديتيكتر لجعل الوجت قابل للضغط
        child: GestureDetector(
      onTap: (() {
        setState(() {
          is_male = (type == 'male') ? true : false;
        });
      }),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (type == 'male' && is_male == true) ||
                    (type == 'femal' && is_male == false)
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 100,
                color: Colors.yellow,
              ),
              Text(
                type == 'male' ? "Male" : "female",
                style: TextStyle(fontSize: 40),
              )
            ],
          )),
    ));
  }

  Expanded Expanded2(BuildContext context, String type) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  type == 'weight' ? "weight:" : "age: ",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                Text(
                  type == 'weight' ? "$weight" : "$age",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        type == "age" ? age++ : weight++;
                      });
                    },
                    heroTag: type == "age" ? age++ : weight++,
                    child: Icon(Icons.add),
                    mini: true,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        type == "weight" ? weight-- : age--;
                      });
                    },
                    heroTag: type == "age" ? age-- : weight--,
                    child: Icon(Icons.remove),
                    mini: true,
                  ),
                ]),
              ],
            )));
  }
}
