import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material app',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management'),
      ),
      body: Center(
        child: myCounter(context),
      ),
    );
  }

  Widget myCounter(BuildContext context) {
    return StatefulBuilder(builder: (context, StateSetter setState) {
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: Icon(
                Icons.remove,
                size: 50,
                color: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  counter--;
                });
              }),
          Text(
            '$counter',
            style: TextStyle(fontSize: 33),
          ),
          IconButton(
              icon: Icon(
                Icons.add,
                size: 50,
                color: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  counter++;
                });
              }),
        ],
      );
    });
  }
}
