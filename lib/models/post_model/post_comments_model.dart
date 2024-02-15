
import 'package:flutter_jsonplaceholder/models/albums_model/albums_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/post_model.dart';

import '../comments_model/comments_model.dart';
import '../todos_model/todos_model.dart';
import '../user_model/user_model.dart';

class PostComments{
  final User user;
  final Post post;
  final List<Comment> comments;
  PostComments({required this.user, required this.post, required this.comments});
}