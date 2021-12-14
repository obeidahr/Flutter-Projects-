import 'dart:collection';
import 'dart:convert';

import 'package:bloc_pattern_repository/data/model/post.dart';
import 'package:http/http.dart';

abstract class PostRepository{
  Future<List<Post>> getAllPosts();
}

class PostRepositoryImplement extends PostRepository{
  @override
  Future<List<Post>> getAllPosts()async {
    final response = await get('https://jsonplaceholder.typicode.com/posts');
    if(response.statusCode == 200){
      final parsed = json.decode(response.body).cast<Map<String,dynamic>>();
      return parsed.map<Post>((item)=>Post.fromJson(item)).toList();
    }else{
      throw Exception('can not load posts');
    }
  }
}