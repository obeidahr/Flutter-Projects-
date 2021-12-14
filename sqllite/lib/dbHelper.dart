import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqllite/model/course.dart';

class DbHelper{
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database _db;

  Future<Database> creatDatabase()async{
    if(_db != null){
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(),'school.db');
    _db = await openDatabase(path,version: 2,onCreate:(Database db,int v)async{
      //create tables
      await db.execute('create table courses (id integer primary key autoincrement,name varchar(50),content varchar(255),hours integer)');
     },onUpgrade: (Database db,int oldV,int newV)async{
       if(oldV < newV){
        await db.execute('alter table courses add column level varchar(50)');
       }
     });
    return _db;
  }
  Future<int> createCourse(Course course)async{
    Database db = await creatDatabase();
    //db.rawInsert('insert into course value');
    return db.insert('courses', course.toMap());
  }
  Future<List> allCourses()async{
    Database db = await creatDatabase();
    //db.rawQuery('select * from courses');
    return db.query('courses');
  }
  Future<int> delete(int id)async{
    Database db = await creatDatabase();
    return db.delete('courses',where: 'id = ?',whereArgs: [id]);
  }
  Future <int> courseUpdate(Course course)async{
    Database db = await creatDatabase();
    return await db.update('courses', course.toMap(),where: 'id=?',whereArgs: [course.id]);
  }
}