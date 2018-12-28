import 'home.dart';
import 'package:flutter/material.dart';

void main() => runApp(BasicApp());

class BasicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
    );
  }
}