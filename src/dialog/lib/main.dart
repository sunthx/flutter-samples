import 'package:flutter/material.dart';

void main() => runApp(DialogDemoApp());

class DialogDemoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _simpleDialog() {
      return SimpleDialog(
        title: Text("Simple Dialog"),
        children: <Widget>[
          Text("This is a Simple Dialog!"),
          RaisedButton(child: Text("Confirm"),onPressed: (){},),
          RaisedButton(child: Text("Cancel"),onPressed: (){},)
        ],
      );
    }

    Widget _alertDialog() {
      return AlertDialog(
        title: Text("Alert Dialog"),
        content: Text("This is a Alert Dialog"),
      );
    }

    Widget _aboutDialog(){
      return AboutDialog(
        children: <Widget>[
          Text("This is a About Dialog")
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Dialog"),
        ),
        body: Center(
          child: Wrap(
            spacing: 10.0,
            runSpacing: 5.0,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                     builder: (builderContext) {
                    return _simpleDialog();
                  });
                },
                child: Text("Simple Dialog"),
              ),
              RaisedButton(
                onPressed: () {
                   showDialog(context: context, builder: (builderContext) {
                    return _alertDialog();
                  });
                },
                child: Text("Alert Dialog"),
              ),
               RaisedButton(
                onPressed: () {
                   showDialog(context: context, builder: (builderContext) {
                    return _aboutDialog();
                  });
                },
                child: Text("About Dialog"),
              )
            ],
          ),
        ));
  }
}
