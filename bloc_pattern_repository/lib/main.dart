import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/post_bloc.dart';
import 'data/repository/post_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) =>
            PostBloc(PostRepositoryImplement())..add(FetchPosts()),//debendensy injection(DI)
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('all posts'),
      ),
      body: Center(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return CircularProgressIndicator();
            }else if(state is PostLoaded){
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder:(context,i){
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(state.posts[i].title),
                      subtitle: Text(state.posts[i].id.toString()),
                    ),
                  );
                } 
              );
            }else if(state is PostError){
              return Text('we are sorry try again');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}