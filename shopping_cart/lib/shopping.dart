import 'package:flutter/cupertino.dart';
import 'package:shopping_cart/product.dart';
import 'package:collection/collection.dart';
class Shopping extends InheritedWidget{

  List<Product>products = [];
  Widget child;
  Shopping({this.child});//child : MaterialApp

  @override
  bool updateShouldNotify( Shopping oldWidget) {
    return !IterableEquality().equals(products,oldWidget.products);
  }
  static Shopping of(BuildContext context) => context.dependOnInheritedWidgetOfExactType();
  
}