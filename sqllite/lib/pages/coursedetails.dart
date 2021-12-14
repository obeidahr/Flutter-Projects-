import 'package:flutter/material.dart';
import 'package:sqllite/model/course.dart';

class Coursedetails extends StatelessWidget {
  Course course;
  Coursedetails(this.course);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(course.name,style: Theme.of(context).textTheme.headline,),
            SizedBox(height: 20,),
            Text(course.content,style: Theme.of(context).textTheme.body1,),
            SizedBox(height: 20,),
            Text(course.hours.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}