
import 'package:flutter_jsonplaceholder/models/albums_model/albums_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/post_comments_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/post_model.dart';

import '../comments_model/comments_model.dart';
import '../todos_model/todos_model.dart';
import '../user_model/user_model.dart';

class PTACOfUser{
  final User user;
  final List<PostComments> postComments;
  final List<Todo> todos;
  final List<Album> albums;

  PTACOfUser({required this.user, required this.postComments, required this.todos, required this.albums});
}