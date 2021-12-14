import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyModel with ChangeNotifier{
  String name;
  int number;
  MyModel(this.name,this.number);

  inc(){
    number++;
    notifyListeners();
  }
}