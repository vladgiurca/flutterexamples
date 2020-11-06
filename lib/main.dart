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
          child: Text('This is my first dummy data'),
        ),
      ),
    );
  }
}
