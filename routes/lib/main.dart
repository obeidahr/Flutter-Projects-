import 'package:flutter/material.dart';
import 'package:routes/routes/home.dart';
import 'package:routes/routes/second.dart';

main(){
  runApp(App());
}
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String,WidgetBuilder>{
        '/' :(c) => Home(),
        '/second':(c) => Second()
      },
    );
  }
}