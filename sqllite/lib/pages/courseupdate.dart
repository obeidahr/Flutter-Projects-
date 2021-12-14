import 'package:flutter/material.dart';
import 'package:sqllite/dbHelper.dart';
import 'package:sqllite/model/course.dart';

class CourseUpdate extends StatefulWidget {
  Course course;
  CourseUpdate(this.course);
  @override
  _CourseUpdateState createState() => _CourseUpdateState();
}

class _CourseUpdateState extends State<CourseUpdate> {
  TextEditingController teName = TextEditingController();
  TextEditingController teContent = TextEditingController();
  TextEditingController teHours = TextEditingController();
  TextEditingController teLevel = TextEditingController();
  DbHelper helper;
  @override
    void initState() {
      super.initState();
      helper = DbHelper();
      teName.text = widget.course.name;
      teContent.text = widget.course.content;
      teHours.text = widget.course.hours.toString();
      teLevel.text = widget.course.level; 
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Update'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            TextField(controller: teName,),
            TextField(controller: teContent,),
            TextField(controller: teHours,),
            TextField(controller: teLevel,),
            RaisedButton(
              child:Text('Save'),
              onPressed: (){
                var updateCourse = Course({
                  'id' : widget.course.id,
                  'name' : teName.text,
                  'content' : teContent.text,
                  'hours' : int.parse(teHours.text),
                  'level' : teLevel.text,
                });
                helper.courseUpdate(updateCourse);
                Navigator.of(context).pop();
              },
              ),
          ],
        ),
      ) ,
    );
  }
}