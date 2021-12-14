import 'package:flutter/material.dart';
import 'package:routes/routes/second.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon:Icon(Icons.open_with),
            onPressed: (){
              Navigator.pushNamed(context,'/second');
              //  Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => new Second())
              // );
            },
            )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('Home Screen',style: Theme.of(context).textTheme.headline,),
          RaisedButton(
            child: Text('Open Second'),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new Second())
              );
            },
          ),
          ],) ,),
    );
  }
}