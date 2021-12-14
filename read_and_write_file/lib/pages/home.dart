import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter =0;
  Future<String>getLocalPath()async{
    var folder = await getApplicationDocumentsDirectory();
    return folder.path;
  }//Find the correct local path

  Future<File>getLocalFile()async{
    var path = await getLocalPath();
    return File('$path/counter.txt');
  }//Create a reference to the file location

  Future<File>writeCounter(int c)async{
    File file = await getLocalFile();
    return file.writeAsString('$c');
  }//write data to the file
  
  Future<int>readCounter()async{
    try{
      final file = await getLocalFile();
      String content = await file.readAsString();
      return int.parse(content);
    }catch(e){
      return 0;
    }
  }//Read data from the file
  @override
    void initState() {
      super.initState();
      readCounter().then((data){
        setState(() {
          counter = data;        
        });
      } );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read & Write files'),
      ),
      body: Center(
        child: Text('The counter $counter'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            counter++;
          });
          writeCounter(counter);
        },
      ),
    );
  }
}