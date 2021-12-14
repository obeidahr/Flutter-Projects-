import 'package:flutter/material.dart';
import 'package:shopping_cart/home.dart';
import 'package:shopping_cart/shopping.dart';


main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Shopping(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}