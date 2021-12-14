import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String text='';
  final myController = TextEditingController();//1-create a TextEditingController()

  @override
  initState(){//4-Listen to the controller for changes
    super.initState();
    myController.addListener(getLatest);
  }

  getLatest(){//3-Create function to print the latest value
    setState(() {
      text =myController.text;      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter form lesson 3'),
      ),
      body:Form(
        child:Column(
          children: [
            Text('you Typed \n $text',style: Theme.of(context).textTheme.headline,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
              ),
              controller: myController,//2-Connect the TextEditingController to a textfield
              
              // onChanged: (value){//طريقة1
              //   setState(() {
              //     text = value;                  
              //   });                
              // },
            )
          ],
        )),
    );
  }
}