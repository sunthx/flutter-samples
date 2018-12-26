import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';

void main() => runApp(SocketDemo());

class SocketDemo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socket Sender Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  static Widget _createButton(String txt, VoidCallback callback) {
    return RaisedButton(onPressed: callback, child: Text(txt));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socket Demo"),
      ),
      body: Wrap(
        children: <Widget>[
          _createButton("Sender", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SocketSenderPage()));
          }),
          _createButton("Receiver", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SocketReciverPage()));
          }),
        ],
      ),
    );
  }
}

class SocketSenderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SocketSenderPageState();
  }
}

class SocketSenderPageState extends State<SocketSenderPage> {
  var _ipTextController = new TextEditingController(text: "127.0.0.1");
  var _portTextController = new TextEditingController(text: "9100");

  var _oddsTextController = new TextEditingController();
  var _osdsTextController = new TextEditingController();

  var _oddcTextController = new TextEditingController();
  var _osdcTextController = new TextEditingController();

  var _odAxTextController = new TextEditingController();
  var _osAxTextController = new TextEditingController();

  var _odSeTextController = new TextEditingController();
  var _osSeTextController = new TextEditingController();

  var _odPsTextController = new TextEditingController();
  var _osPsTextController = new TextEditingController();

  var _odGsTextController = new TextEditingController();
  var _osGsTextController = new TextEditingController();

  var _odGcTextController = new TextEditingController();
  var _osGcTextController = new TextEditingController();

  var _pdTextController = new TextEditingController();
  var _examDateTextController = new TextEditingController();

  void _randomExamData() {
    _oddsTextController.text = _getRandomIntValue();
    _osdsTextController.text = _getRandomIntValue();

    _oddcTextController.text = _getRandomIntValue();
    _osdcTextController.text = _getRandomIntValue();

    _odAxTextController.text = _getRandomInt().toString();
    _osAxTextController.text = _getRandomInt().toString();

    _odSeTextController.text = _getRandomIntValue();
    _osSeTextController.text = _getRandomIntValue();

    _odPsTextController.text = _getRandomInt().toString();
    _osPsTextController.text = _getRandomInt().toString();

    _odGsTextController.text = _getRandomIntValue();
    _osGsTextController.text = _getRandomIntValue();

    _odGcTextController.text = _getRandomIntValue();
    _osGcTextController.text = _getRandomIntValue();

    _pdTextController.text = _getRandomInt().toString();
    _examDateTextController.text = _getRandomDateStringValue();
  }

  String _getRandomIntValue() {
    var value = _getRandomInt();
    if(value % 2 != 0)
    {
       value *= -1;
    }

    return value > 0 ? "+"+value.toString() : value.toString();
  }

  String _getRandomDateStringValue() {
    var now = new DateTime.now();
    now.add(new Duration(days: -_getRandomInt()));

    return now.toString();
  }

  int _getRandomInt() {
    var rd = new Random();
    return rd.nextInt(200);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socket Sender Page"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _ipTextController,
              decoration: InputDecoration(labelText: "Remote IPAddress"),
            ),
            TextField(
              controller: _portTextController,
              decoration: InputDecoration(labelText: "Remote Port"),
            ),
            RaisedButton(
              child: Text("发送数据"),
              onPressed: () {
                var ip = _ipTextController.text;
                var port = _portTextController.text;
                _sendData(ip, int.parse(port));
              },
            ),
            RaisedButton(
              child: Text("随机生成"),
              onPressed: () {
                _randomExamData();
              },
            ),
            TextField(
              controller: _odAxTextController,
              decoration: InputDecoration(labelText: "OdAx"),
            ),
            TextField(
              controller: _osAxTextController,
              decoration: InputDecoration(labelText: "OsAx"),
            ),
            TextField(
              controller: _odSeTextController,
              decoration: InputDecoration(labelText: "OdSe"),
            ),
            TextField(
              controller: _osSeTextController,
              decoration: InputDecoration(labelText: "OsSe"),
            ),
            TextField(
              controller: _oddsTextController,
              decoration: InputDecoration(labelText: "OdDs"),
            ),
            TextField(
              controller: _osdsTextController,
              decoration: InputDecoration(labelText: "OsDs"),
            ),
            TextField(
              controller: _oddcTextController,
              decoration: InputDecoration(labelText: "OdDc"),
            ),
            TextField(
              controller: _osdcTextController,
              decoration: InputDecoration(labelText: "OsDc"),
            ),
            TextField(
              controller: _osGcTextController,
              decoration: InputDecoration(labelText: "OsGc"),
            ),
            TextField(
              controller: _odGcTextController,
              decoration: InputDecoration(labelText: "OdGc"),
            ),
            TextField(
              controller: _osGsTextController,
              decoration: InputDecoration(labelText: "OsGs"),
            ),
            TextField(
              controller: _odGsTextController,
              decoration: InputDecoration(labelText: "OdGs"),
            ),
            TextField(
              controller: _pdTextController,
              decoration: InputDecoration(labelText: "Pd"),
            ),
            TextField(
              controller: _osPsTextController,
              decoration: InputDecoration(labelText: "OsPs"),
            ),
            TextField(
              controller: _odPsTextController,
              decoration: InputDecoration(labelText: "OdPs"),
            ),
                        TextField(
              controller: _examDateTextController,
              decoration: InputDecoration(labelText: "ExamDate"),
            ),
          ],
        ),
      ),
    );
  }

  void _sendData(String host, int port) async {
    String host = "192.168.1.148";
    int port = 9100;

    StringBuffer buffer = new StringBuffer();
    buffer.writeln("Welch Allyn");
    buffer.writeln("ID: 001002003");
    buffer.writeln("Name: Test");
    buffer.writeln("Age: 20y-100y Gender: M (-CYL)");
    buffer.writeln("");
    buffer.writeln("OD(Right): ${_oddsTextController.text} DS | ${_oddcTextController.text} DC | @${_odAxTextController.text}? AX | ${_odSeTextController.text} SE");
    buffer.writeln("OS(Left): ${_osdsTextController.text} DS | ${_osdcTextController.text} DC | @${_osAxTextController.text}? AX | ${_osSeTextController.text} SE");
    buffer.writeln("Pupil Size: ( ${_odPsTextController.text}mm OD, ${_osPsTextController.text}mm OS )");
    buffer.writeln("Pupil Distance: ( ${_pdTextController.text}mm )");
    buffer.writeln("Gaze:( ${_odGsTextController.text}?, ${_odGcTextController.text}? OD ),( ${_osGsTextController.text}?, ${_osGcTextController.text}? OS )");
    buffer.writeln("");
    buffer.writeln("Potential Condition: All Measurements In Range");
    buffer.writeln("Date: ${_examDateTextController.text} (C)");

    //创建 Socket 连接
    var socket = await Socket.connect(host, port);
    socket.write(buffer);
    await socket.flush();
    await socket.close();
  }
}

class SocketReciverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}
