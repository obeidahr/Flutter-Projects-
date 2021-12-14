import 'package:flutter/material.dart';
import 'package:statemanagement_inherited_widget/counter_provider.dart';
import 'package:statemanagement_inherited_widget/home.dart';

main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}