import 'package:flutter/material.dart';
import 'package:sqllite/dbHelper.dart';
import 'package:sqllite/model/course.dart';
import 'package:sqllite/pages/coursedetails.dart';
import 'package:sqllite/pages/courseupdate.dart';
import 'package:sqllite/pages/newcourses.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper helper;
  TextEditingController teSearch = TextEditingController();
  var allCourses = [];
  var items = List();

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
    helper.allCourses().then((courses) {
      setState(() {
        allCourses = courses;
        items = allCourses;
      });
    });
  }

  void filterSearch(String query) async {
    var dummySearchList = allCourses;
    if (query.isNotEmpty) {
      var dummyListData = List();
      dummySearchList.forEach((item) {
        var course = Course.fromMap(item);
        if (course.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items = [];
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items = [];
        items = allCourses;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Database'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NewCourses()));
              }),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  filterSearch(value);
                });
              },
              controller: teSearch,
              decoration: InputDecoration(
                hintText: 'Search...',
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                )
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, i) {
                  Course course = Course.fromMap(items[i]);
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(
                          '${course.name} - ${course.hours} hours - ${course.level}'),
                      subtitle: Text(course.content),
                      trailing: Column(
                        children: [
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.delete, color: Colors.blue),
                              onPressed: () {
                                setState(() {
                                  helper.delete(course.id);
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.green),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        CourseUpdate(course)));
                              },
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Coursedetails(course)));
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
