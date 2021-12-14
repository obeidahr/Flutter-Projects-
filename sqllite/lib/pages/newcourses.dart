import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqllite/model/course.dart';
import '../dbHelper.dart';

class NewCourses extends StatefulWidget {

  @override
  _NewCoursesState createState() => _NewCoursesState();
}
class _NewCoursesState extends State<NewCourses>{
  String name,content;
  int hours;
  DbHelper helper;

  @override
    void initState() {
      super.initState();
      helper = DbHelper();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child:ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: ' Enter Course name',
                ),
                onChanged: (value){
                  setState(() {
                    name = value;                   
                  });
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Enter content',
                ),
                onChanged: (value){
                  setState(() {
                    content=value;                    
                  });
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter hours',
                ),
                onChanged: (value){
                  setState(() {
                    hours=int.parse(value);                    
                  });
                },
              ),
              SizedBox(height: 15,),
              RaisedButton(
                child: Text('Save'),
                onPressed: ()async{
                  Course course= Course({'name':name,'content':content,'hours':hours});
                  helper.createCourse(course);
                  Navigator.of(context).pop();
                }),  
            ],
          )),
      ),
    );
  }
}