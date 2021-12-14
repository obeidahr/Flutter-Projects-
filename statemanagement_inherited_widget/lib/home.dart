import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:statemanagement_inherited_widget/second.dart';
import 'counter_provider.dart';
import 'package:statemanagement_inherited_widget/counter_provider.dart';

class Home extends StatelessWidget {

  //int counter =0 ;
  @override
  Widget build(BuildContext context) {
    var provider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter using InheritedWidget'),
        actions: [
          IconButton(icon: Icon(Icons.forward), onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Second()));
          })
        ],
      ),
      body: Center(
        child: StatefulBuilder(
          builder: (context, StateSetter set) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${provider.counter}',
                  style: Theme.of(context).textTheme.display1,
                ),
                IconButton(icon: Icon(Icons.add), onPressed: () {
                  set(){
                    provider.counter++;
                  }
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}