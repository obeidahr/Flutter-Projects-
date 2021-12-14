import 'package:flutter/material.dart';
import 'package:form_with_validation/pages/home.dart';

main() => runApp(App());
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}