import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}
Color val;
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: val,
      appBar: AppBar(
        title: Text('form lesson 5 Radio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Green'),
            Radio(
              value: Colors.green, 
              groupValue: val, 
              onChanged: (newValue){
                setState(() {
                  val = newValue;                  
                });
              }
            ),
            Text('Red'),
            Radio(
              value: Colors.red, 
              groupValue: val, 
              onChanged: (newValue){
                setState(() {
                  val = newValue;                  
                });
              }
            ),
            RadioListTile(
              title: Text('Orange'),
              value: Colors.orange, 
              groupValue: val, 
              onChanged: (newValue){
                val = newValue;
              }
            ),
            RadioListTile(
              title: Text('Yellow'),
              value: Colors.yellow, 
              groupValue: val, 
              onChanged: (newValue){
                val = newValue;
              }
            ),
          ],
        ),
      ),     
    );
  }
}