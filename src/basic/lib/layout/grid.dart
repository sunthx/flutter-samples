import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static Widget _buildRectange() {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 100.0,
      width: 100.0,
      color: Colors.green,
      child: Center(
        child: Text(
          "Content",
          style: TextStyle(color: Colors.white),),
      ),
    );
  }

  static Widget _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildRectange(), 
        _buildRectange(),
        _buildRectange(),
        _buildRectange()],
    );
  }

  static Widget _buildRow() {
    return Row(
      children: <Widget>[
        _buildColumn(), 
        _buildColumn(),
        _buildColumn()],
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grid"),
        ),
        body: Container(
          child: _buildRow(),
        ),
      ),
    );
  }
}
