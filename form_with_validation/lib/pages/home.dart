import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text('Forms lesson 1'),
      ),
      body: Form(
        key: formkey,
        child:Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'name required';
                }else{
                  return null;
                }
              },
            ),
            RaisedButton(
              child: Text('send'),
              onPressed: (){
                if(formkey.currentState.validate()){//true data
                  //store data to local database or to send it to api
                  scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('store data')));
                }
              }
            ),
          ],
        ) ),
    );
  }
}