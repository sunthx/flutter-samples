import 'package:flutter/material.dart';

class BasicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Flutter Samples"),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}