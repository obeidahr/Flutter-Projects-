import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double inTem=0.0,outTem=0.0;
  bool isFah=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration:InputDecoration(
                hintText: 'Enter temperature',
                labelText: isFah ?"You entered $inTem Fahrenhiet" : "You entered $inTem Celsius",
              ),
              onChanged: (value){
                try{
                  inTem = double.parse(value);
                }catch(e){
                  ///showDailog('invalid input)
                }
              },
            ),
            RadioListTile(
              title: Text('Fahrenheit'),
              value: true, 
              groupValue: isFah, 
              onChanged: (newValue){
                setState(() {
                  isFah=true;
                });
              }
            ),
            RadioListTile(
              title: Text('Celsius'),
              value: false, 
              groupValue: isFah, 
              onChanged: (newValue){
                setState(() {
                  isFah=newValue;                  
                });
              }
            ),
            RaisedButton(
              child: Text('convert'),
              onPressed: (){
                setState(() {
                   outTem =isFah ? (inTem-32)/(5/6):(inTem*9/5)+32;
                   showDialog(context: context, builder: (c)=> AlertDialog(
                     title:Text('The result'),
                     content:isFah?Text("$inTem Fah = $outTem celsius") : Text("$inTem celsius = $outTem Fah"),
                   ));              
                });  
              })
          ],
        ),
      ),
    );
  }
}