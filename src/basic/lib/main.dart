import 'package:flutter/material.dart';

void main() => runApp(BasicApp());

class BasicApp extends StatelessWidget {
  final String title = "Flutter Widget List";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(
        title: title,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(this.title),
      ),
    );
  }
}
