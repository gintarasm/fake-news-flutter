import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../domain/Post.dart';

Future<List<Post>> fetchAll() async {
  final response = await http.get('http://localhost:3001/posts');
  final List<Post> posts = List();
  for (var post in json.decode(response.body)) {
    posts.add(Post.fromJson(post));
  }
  return posts;
}

Future<Post> add(String title, String body) async {
  final response = await http.post('http://localhost:3001/posts',
      body: {'title': title, 'body': body});
  return Post.fromJson(json.decode(response.body));
}
