import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: () {}, child: Text('Press Me'), color: Colors.amber),
          ],
        ),
      ),
    );
  }
}
