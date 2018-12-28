import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _buildRow(String title) {
    return Container(
        color: Colors.blue,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(20.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Flutter Samples"),
      ),
      body: ListView(
        children: <Widget>[
          _buildRow("Layout"),
          _buildRow("Button"),
          _buildRow("Input"),
          _buildRow("ListView"),
        ],
      ),
    );
  }
}
