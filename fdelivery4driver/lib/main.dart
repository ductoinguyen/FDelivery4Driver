import 'package:flutter/material.dart';
import 'login2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
      ),
      home: Login(),
    );
  }
}

