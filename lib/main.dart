import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('FlutterEx'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Testing'),
              RaisedButton(
                  onPressed: () {},
                  child: Text('Press Me'),
                  color: Colors.amber),
            ],
          ),
        ),
      ),
    );
  }
}
