import 'package:flutter/material.dart';
import 'package:handle_change_textfield/pages/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      
    );
  }
}