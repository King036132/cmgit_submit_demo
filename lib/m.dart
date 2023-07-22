import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'น้ำขึ้นให้รีบตัก ผู้ชายทักให้รีบตอบ',
    'กลางคืนอย่างห้าว ตอนเช้าอย่างง่วง',
    'เคยเป็นแล้วคนดี ตอนนี้เป็นคนโสด',
    'สับรางไม่ไหว แต่สับไพ่สู้อยู่',
    'ก้าวแรกโดนใจ ก้าวต่อไปโดนเท',
  ];

  var quote = quoteList[0]; // state variable
  var randomColors = [
    Colors.black,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.red,
    Colors.teal,
  ];//กำหนดสีลงarray randomColors
  Color textColor = Colors.black; // กำหนดสีข้อความเริ่มต้น

  void handleClickGo() {
    setState(() {
      var rand = Random();
      var randomIndex = rand.nextInt(quoteList.length);
      quote = quoteList[randomIndex];

      // สร้างสีใหม่ที่แตกต่างจากสีเริ่มต้น
      var newColor = textColor;
      while (newColor == textColor) {
        newColor = randomColors[rand.nextInt(randomColors.length)];
      }
      textColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote, // positional parameter/argument
            // named parameter/argument
            style: TextStyle(
              color: textColor,
              fontSize: 50,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}