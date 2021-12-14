import 'package:flutter/material.dart';
import 'counter_provider.dart';
import 'package:statemanagement_inherited_widget/counter_provider.dart';

class Second extends StatelessWidget {

  //int counter =0 ;
  @override
  Widget build(BuildContext context) {
    var pr = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter using InheritedWidget'),
      ),
      body: Center(
        child: StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${pr.counter}',
                  style: Theme.of(context).textTheme.display1,
                ),
                IconButton(icon: Icon(Icons.add), onPressed: () {
                  setState(){
                    pr.counter++;
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