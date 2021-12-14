import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'choice.dart';
main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var choices= <Choice>[
  Choice(title: 'Bicycle',icon: Icons.directions_bike,id: 0),
  Choice(title: 'car',icon: Icons.directions_car,id: 1),
  Choice(title: 'Bus',icon: Icons.directions_bus,id: 2),
  Choice(title: 'walk',icon: Icons.directions_walk,id: 3),
  Choice(title: 'boat',icon: Icons.directions_boat,id: 4),
  Choice(title: 'train',icon: Icons.directions_railway,id: 5),
  ];
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child:ListView(
            children: [
              DrawerHeader(
                decoration:BoxDecoration(color: Colors.blue),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      child: CircleAvatar(
                        backgroundImage:AssetImage('assets/images/ob.jpg'),
                      ),
                  ),
                  SizedBox(height: 10,),
                      Text(
                        'ob',
                        style: TextStyle(fontSize: 18,color: Colors.white),
                      ),       
                      Text(
                        'dc',
                        style: TextStyle(color: Colors.white,fontSize: 14),
                      ),
                  ],),
                ),
                ListTile(
                  leading:Icon(Icons.home),
                  title: Text('Home'),
                  onTap: (){print('Home clicked');},
                  ),
                  ListTile(
                  leading:Icon(Icons.settings),
                  title: Text('setting'),
                  onTap: (){print('Home clicked');},
                  ),
                  ListTile(
                  leading:Icon(Icons.save),
                  title: Text('save'),
                  onTap: (){print('Home clicked');},
                  ),
            ],) ,
            ),
        appBar: AppBar(
          title:Text('popup menu') ,
          actions: [
            IconButton(
              icon:Icon(choices[0].icon),
              onPressed: (){setState(() {
                selectedIndex=0;
              });},
              ),
              IconButton(
              icon:Icon(choices[1].icon),
              onPressed: (){setState(() {
                selectedIndex=1;
              });},
              ),
              IconButton(
              icon:Icon(choices[2].icon),
              onPressed: (){setState(() {
                selectedIndex=2;
              });},
              ),
              PopupMenuButton(
              itemBuilder:(context){
                return choices.skip(3).map((choice){
                  return PopupMenuItem(
                    value: choice ,
                    child: Text(choice.title),
                    );
                }).toList();
              },
              onSelected: (Choice choice){
                setState(() {
                  selectedIndex=choice.id;
                });
              },
            ),
          ],
          ),
          body: Center(
            child: Icon(choices[selectedIndex].icon,size: 300,color: Colors.blue),
            ),           
          ),
    );
  }
}