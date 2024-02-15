import 'package:flutter_jsonplaceholder/models/albums_model/albums_model.dart';
import 'package:flutter_jsonplaceholder/models/albums_model/photos_model.dart';
import 'package:flutter_jsonplaceholder/models/comments_model/comments_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/post_comments_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/post_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/p_t_a_c_user_model.dart';
import 'package:flutter_jsonplaceholder/models/todos_model/todos_model.dart';
import 'package:flutter_jsonplaceholder/models/user_model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_config.dart';

class UserResourcesDioService extends DioClient {
  Future<List<PostComments>> getAllPosts() async {
    List<PostComments> postsOfUsers = [];
    var postsData = await dio.get('$baseUrl/posts');
    List<Post> posts =
        (postsData.data as List).map((x) => Post.fromJson(x)).toList();
    for (var post in posts) {
      //данные о пользователе
      var userData = await dio.get('$baseUrl/users/${post.userId}');
      User user = User.fromJson(userData.data);
      //данные о комментариях к посту
      var commentsData = await dio.get('$baseUrl/posts/${post.id}/comments');
      List<Comment> comments =
      (commentsData.data as List).map((x) => Comment.fromJson(x)).toList();
      postsOfUsers
          .add(PostComments(user: user, post: post, comments: comments));
    }
    return postsOfUsers;
  }

  Future<List<PostComments>> getAllUserPosts({required int id}) async {
    List<PostComments> postsOfUser = [];
    var postsData = await dio.get('$baseUrl/users/${id}/posts');
    List<Post> posts =
        (postsData.data as List).map((x) => Post.fromJson(x)).toList();
    for (var post in posts){
      //данные о пользователе
      var userData = await dio.get('$baseUrl/users/${id}');
      User user = User.fromJson(userData.data);
      //данные о комментариях к посту
      var commentsData = await dio.get('$baseUrl/posts/${post.id}/comments');
      List<Comment> comments =
      (commentsData.data as List).map((x) => Comment.fromJson(x)).toList();
      postsOfUser.add(PostComments(user: user, post: post, comments: comments));
    }
    return postsOfUser;
  }

  Future<List<Photo>> getAllAlbumPhotos({required int id}) async {
    var photosData = await dio.get('$baseUrl/albums/${id}/photos');
    List<Photo> photos =
    (photosData.data as List).map((x) => Photo.fromJson(x)).toList();
    return photos;
  }

  Future<PTACOfUser> getAllUserResources({required int id}) async {
    List<PostComments> postComments = [];
    var userData = await dio.get('$baseUrl/users/${id}');
    User user = User.fromJson(userData.data);
    //данные о постах и комментариях
    postComments = await getAllUserPosts(id: user.id);
    //данные о туду пользователя
    var todosData = await dio.get('$baseUrl/users/${user.id}/todos');
    List<Todo> todos =
        (todosData.data as List).map((x) => Todo.fromJson(x)).toList();
    //данные об альбомах пользователя
    var albumsData = await dio.get('$baseUrl/users/${user.id}/albums');
    List<Album> albums =
        (albumsData.data as List).map((x) => Album.fromJson(x)).toList();
    PTACOfUser userRecources = PTACOfUser(user: user, postComments: postComments, todos: todos, albums: albums);
    return userRecources;
  }
}

final ptacProvider =
    Provider<UserResourcesDioService>((ref) => UserResourcesDioService());
