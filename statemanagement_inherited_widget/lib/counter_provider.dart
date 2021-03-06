import 'dart:developer';

import 'package:flutter/material.dart';

class CounterProvider extends InheritedWidget{
  //data shared between all widget
  int counter = 0;
  Widget child;
  CounterProvider({this.child});
  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return oldWidget.counter != counter;
  }
  static CounterProvider of(BuildContext context) => context.dependOnInheritedWidgetOfExactType();

}