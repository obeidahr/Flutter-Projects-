import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:networking_http/model/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Post> postData;
  @override
  initState(){
    super.initState();
    postData = getPostById();
  }
  
  Future<Post> getPostById()async{
    http.Response futurePost = await http.get('https://jsonplaceholder.typicode.com/posts/1');
    if(futurePost.statusCode == 200){
      //success get the data
      //print(futurePost.body);
      return Post.fromJson(json.decode(futurePost.body));

    }else{
      //error
      throw Exception('can not load post data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http'),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          future: postData,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return Text(snapshot.data.title);
            }else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },          
          ),
      ),
    );
  }
}