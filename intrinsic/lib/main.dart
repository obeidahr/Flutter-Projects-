import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title: Text('Material'),
        ),
        body:CustomScrollView(
          slivers: [
            SliverList(
              delegate:SliverChildListDelegate(
                [
                  ListTile(title: Text('1st list item'),),
                  ListTile(title: Text('2nd list item'),),
                  ListTile(title: Text('3th list item'),),
                  ListTile(title: Text('4th list item'),),
                  ListTile(title: Text('5th list item'),),
                  ListTile(title: Text('5th list item'),),
                  ListTile(title: Text('5th list item'),),
                  ListTile(title: Text('5th list item'),),
                  ListTile(title: Text('5th list item'),),
                  ListTile(title: Text('5th list item'),),
                  ListTile(title: Text('5th list item'),),
                  ListTile(title: Text('5th list item'),),
                  ListTile(title: Text('5th list item'),),
                ]
              ) ,
              ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Colors.yellowAccent,
              child: Column(
                children: [
                  FlutterLogo(size:200,),
                  Text('kjf;fj;gous   uf;oseujf;shf fse;f suh ',
                  textAlign: TextAlign.start)
                ],),
              ),
            )
          ])
        )
    );
  }
}