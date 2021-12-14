import 'package:flutter/material.dart';
import 'package:route_pass/home.dart';

main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}