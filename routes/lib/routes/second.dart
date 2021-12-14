import 'package:flutter/material.dart';
import 'package:routes/routes/home.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(' Second Screen',style: Theme.of(context).textTheme.headline,),
          RaisedButton(
            child: Text('Open Home'),
            onPressed: (){
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (c) => Home())
              // );
              Navigator.of(context).pop();
            },
          ),
          ],) ,),
    );
  }
}
