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

  final Wrap body = Wrap(
    spacing: 8.0,
    runSpacing: 4.0,
    children: <Widget>[
      _buildDefaultButton("Container"),
      _buildDefaultButton("Grid"),
      _buildDefaultButton("GridView"),
      _buildDefaultButton("Flex"),
      _buildDefaultButton("ListView"),
      _buildDefaultButton("Stack"),
    ],
  );

  static Widget _buildDefaultButton(String txt) {
    //通过 ButtonTheme 重写默认样式
    return ButtonTheme(
        minWidth: 150,
        height: 80,
        child: FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text(
              txt,
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () => {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(this.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: body,
      ),
    );
  }
}
